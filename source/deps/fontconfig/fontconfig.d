module deps.fontconfig.funcs;

version ( FontConfig ):
public import fontconfig.fontconfig;
import core.stdc.stdio  : printf;


// https://www.freedesktop.org/software/fontconfig/fontconfig-user.html

// Paths:
// /etc/fonts/fonts.conf
// /etc/fonts/fonts.dtd
// /etc/fonts/conf.d
// $XDG_CONFIG_HOME/fontconfig/conf.d
// $XDG_CONFIG_HOME/fontconfig/fonts.conf
// ~/.fonts.conf.d
// ~/.fonts.conf

//Property        Type    Description
//--------------------------------------------------------------
//family          String  Font family names
//familylang      String  Languages corresponding to each family
//style           String  Font style. Overrides weight and slant
//stylelang       String  Languages corresponding to each style
//fullname        String  Font full names (often includes style)
//fullnamelang    String  Languages corresponding to each fullname
//slant           Int     Italic, oblique or roman
//weight          Int     Light, medium, demibold, bold or black
//size            Double  Point size
//width           Int     Condensed, normal or expanded
//aspect          Double  Stretches glyphs horizontally before hinting
//pixelsize       Double  Pixel size
//spacing         Int     Proportional, dual-width, monospace or charcell
//foundry         String  Font foundry name
//antialias       Bool    Whether glyphs can be antialiased
//hinting         Bool    Whether the rasterizer should use hinting
//hintstyle       Int     Automatic hinting style
//verticallayout  Bool    Use vertical layout
//autohint        Bool    Use autohinter instead of normal hinter
//globaladvance   Bool    Use font global advance data (deprecated)
//file            String  The filename holding the font
//index           Int     The index of the font within the file
//ftface          FT_Face Use the specified FreeType face object
//rasterizer      String  Which rasterizer is in use (deprecated)
//outline         Bool    Whether the glyphs are outlines
//scalable        Bool    Whether glyphs can be scaled
//color           Bool    Whether any glyphs have color
//scale           Double  Scale factor for point->pixel conversions (deprecated)
//dpi             Double  Target dots per inch
//rgba            Int     unknown, rgb, bgr, vrgb, vbgr,
//                      none - subpixel geometry
//lcdfilter       Int     Type of LCD filter
//minspace        Bool    Eliminate leading from line spacing
//charset         CharSet Unicode chars encoded by the font
//lang            String  List of RFC-3066-style languages this
//                      font supports
//fontversion     Int     Version number of the font
//capability      String  List of layout capabilities in the font
//fontformat      String  String name of the font format
//embolden        Bool    Rasterizer should synthetically embolden the font
//embeddedbitmap  Bool    Use the embedded bitmap instead of the outline
//decorative      Bool    Whether the style is a decorative variant
//fontfeatures    String  List of the feature tags in OpenType to be enabled
//namelang        String  Language name to be used for the default value of
//                      familylang, stylelang, and fullnamelang
//prgname         String  String  Name of the running program
//postscriptname  String  Font family name in PostScript
//fonthashint     Bool    Whether the font has hinting
//order           Int     Order number of the font


//nothrow @nogc
//FontList queryFonts2( string face, int size )
//{
//    import deps.fontconfig.fontconfig;

//    // FcInit(); // executed in loadUI()

//    FontList lst;

//    FcConfig* config = FcInitLoadConfigAndFonts();

//    FcPattern* pat = FcNameParse( cast( const FcChar8* ) "Arial" );

//    FcConfigSubstitute( config, pat, FcMatchKind.FcMatchPattern );
//    FcDefaultSubstitute( pat );

//    char*      fontFile; //this is what we'd return if this was a function find the font
//    FcResult   result;

//    FcPattern* font = FcFontMatch( config, pat, &result );

//    if ( font )
//    {
//        FcChar8* file = null;

//        if ( FcPatternGetString( font, FC_FILE, 0, &file ) == FcResult.FcResultMatch )
//        {
//            //we found the font, now print it.
//            //This might be a fallback font
//            fontFile = cast( char* ) file;
//            printf( "%s\n", fontFile );
//        }
//    }

//    FcPatternDestroy( font );
//    FcPatternDestroy( pat );
//    FcConfigDestroy( config );

//    // Fcfini(); // executed in unloadUI()

//    return lst;
//}


//struct FontList
//{
//    nothrow @nogc
//    void dump()
//    {
//        //
//    }
//}


    //import fontconfig.fontconfig;

    //FT_UInt FcFreeTypeCharIndex(FT_Face face, FcChar32 ucs4);

    //FcCharSet* FcFreeTypeCharSetAndSpacing(FT_Face face, FcBlanks* blanks, int* spacing);

    //FcCharSet* FcFreeTypeCharSet(FT_Face face, FcBlanks* blanks);

    //FcResult FcPatternGetFTFace(const(FcPattern)* p, const(char)* object, int n, FT_Face* f);

    //FcBool FcPatternAddFTFace(FcPattern* p, const(char)* object, const(FT_Face) f);

    //FcPattern* FcFreeTypeQueryFace(
    //    const(FT_Face) face, const(FcChar8)* file, uint id, FcBlanks* blanks
    //);
