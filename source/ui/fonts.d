module ui.fonts;

version ( FontConfig ):
public import fontconfig.fontconfig;
import core.stdc.stdio  : printf;
import core.stdc.string : strlen;
import core.stdc.string : memcpy;
import core.stdc.stdlib : malloc;

/** 
 * Returns C string contains path to the OS font file
 * After using program showld free string with free().
 */
nothrow @nogc
char* queryFont( immutable char* family, int style, float height, float slant, float outline )
{
    FcPattern* pat;
    FcPattern* match;
    FcChar8*   path;
    FcResult   result;        

    pat = FcPatternCreate();

    // family
    FcPatternAddString( pat, "family", /*cast( const FcChar8* )*/ family );
    
    // bold
    if ( style == 1 ) 
    { 
        FcPatternAddInteger( pat, "weight", FC_WEIGHT_BOLD );
    }

    // italic
    if ( style == 2 ) 
    { 
        FcPatternAddInteger( pat, "slant", FC_SLANT_ITALIC );
    }

    // dpi
    FcPatternAddDouble( pat, "dpi", 72.0 ); /* 72 dpi = 1 pixel per 'point' */

    // scale
    FcPatternAddDouble( pat, "scale", 1.0 );

    // size
    FcPatternAddDouble( pat, "size", height );

    //
    FcDefaultSubstitute( pat );                     /* fill in other expected pattern fields */
    FcConfigSubstitute( null, pat, FcMatchKind.FcMatchPattern );   /* apply any system/user config rules */

    //
    match = FcFontMatch( null, pat, &result );         /* find 'best' matching font */

    if ( result != FcResult.FcResultMatch || !match ) 
    {
        /* FIXME: better error reporting/handling here...
        * want to minimise the situations where opendefaultfont gives you *nothing* */
        return null;
    }

    FcPatternGetString( match, "file", 0, &path );

    //
    char* retString = null;
    if ( path )
    {
        size_t l = strlen( path );
        retString = cast( char* ) malloc( l );
        memcpy( retString, path, l );
    }

    //
    FcPatternDestroy( match );
    FcPatternDestroy( pat );

    return retString;
}

