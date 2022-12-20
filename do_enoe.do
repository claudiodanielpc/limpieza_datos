** Do file para calcular indicadores de ENOE;

		#delimit;
						clear all;
						set mem 1g;
						log close _all;
						set more off;
						set timeout1 60;
	
**Directorio de trabajo;
cd "D:\";
*Se crea carpeta;
capture mkdir "enoe";
*Se cambia nuevamente el directorio de trabajo incorporando carpeta creada;
cd "D:\datos\enoe";

***Esta primera parte corresponde a la descarga de los archivos TRIMESTRALES SDEMT de la ENOE de 2005 a 2021;
***En esta descarga NO se incluyen los datos de la ETOE;


***********************************************;
***Descarga de datos de 2005 a 2009;
***********************************************;
quietly forvalues i=5(1) 9 {;
quietly forvalues j=1(1) 4 {;
copy "https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/microdatos/200`i'trim`j'_dta.zip" archivos.zip, replace;
unzipfile archivos.zip, replace;
**Borrar archivos innecesarios;

capture erase "COE1T`j'0`i'.dta";
capture erase "COE2T`j'0`i'.dta";
capture erase "VIVT`j'0`i'.dta";
capture erase "HOGT`j'0`i'.dta";

};
};


***********************************************;
***Descarga de datos de 2010 a 2019;
***********************************************;
quietly forvalues i=10(1) 19 {;
quietly forvalues j=1(1) 4 {;
copy "https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/microdatos/20`i'trim`j'_dta.zip" archivos.zip, replace;
unzipfile archivos.zip, replace;
**Borrar archivos innecesarios;

capture erase "COE1T`j'`i'.dta";
capture erase "COE2T`j'`i'.dta";
capture erase "VIVT`j'`i'.dta";
capture erase "HOGT`j'`i'.dta";

};
};

***********************************************;
***Descarga de datos de 2020;
***********************************************;
***Primer trimestre;
quietly forvalues i=20(1) 20 {;
quietly forvalues j=1(1) 1 {;
copy "https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/microdatos/20`i'trim`j'_dta.zip" archivos.zip, replace;
unzipfile archivos.zip, replace;
**Borrar archivos innecesarios;

capture erase "ENOEN_COE1T`j'`i'.dta";
capture erase "ENOEN_COE2T`j'`i'.dta";
capture erase "ENOEN_VIVT`j'`i'.dta";
capture erase "ENOEN_HOGT`j'`i'.dta";

};
};

***Tercero al cuarto trimestre;

quietly forvalues i=20(1) 20 {;
quietly forvalues j=3(1) 4 {;
copy "https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/microdatos/enoe_n_20`i'_trim`j'_dta.zip" archivos.zip, replace;
unzipfile archivos.zip, replace;
**Borrar archivos innecesarios;

capture erase "ENOEN_COE1T`j'`i'.dta";
capture erase "ENOEN_COE2T`j'`i'.dta";
capture erase "ENOEN_VIVT`j'`i'.dta";
capture erase "ENOEN_HOGT`j'`i'.dta";

};
};



***********************************************;
***Descarga de datos de 2021;
***********************************************;

quietly forvalues i=21(1) 21 {;
quietly forvalues j=1(1) 4 {;
copy "https://www.inegi.org.mx/contenidos/programas/enoe/15ymas/microdatos/enoe_n_20`i'_trim`j'_dta.zip" archivos.zip, replace;
unzipfile archivos.zip, replace;
**Borrar archivos innecesarios;

capture erase "ENOEN_COE1T`j'`i'.dta";
capture erase "ENOEN_COE2T`j'`i'.dta";
capture erase "ENOEN_VIVT`j'`i'.dta";
capture erase "ENOEN_HOGT`j'`i'.dta";

};
};

**Borrar zip;
capture erase "archivos.zip";
