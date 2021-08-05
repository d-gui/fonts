module deps.fontconfig;

version ( FontConfig ):
public import fontconfig.fontconfig;
public import deps.fontconfig.funcs;
import core.stdc.stdio  : printf;
import core.stdc.stdlib : exit;


static
this()
{
    if ( ! FcInit() )
    {
        printf( "error: fontconfig: Can't init font config library\n" );
        exit( -1 );
    }
}


static
~this()
{
    FcFini();        
}


