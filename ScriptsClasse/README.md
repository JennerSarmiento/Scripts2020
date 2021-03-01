# @edt ASIX M01-ISO
## Curs 2019-2020

Podeu trobar els programes al GitLab de [edtasixm01](https://gitlab.com/edtasixm01/scripts-2019.git
)

Podeu trobar la documentació del mòdul a [ASIX-M01](https://sites.google.com/site/asixm01edt/)

ASIX M06-ASO Escola del treball de barcelona


Llistat d'exercicis i material

 * exercicis d'scripting
 
   * Exercicis fets a classe interactivament / conjuntament amb les alumnes.
   * Exercicis de la llists d'exercicis.

 * base de dades training

 * exercicis scripts d'administració d'usuaris

## Exercicis

 * **04-validar-argument.sh arg1 arg2**

   Validar prog té exactament dos args i els mostra. 
   Si no dos args mostrar error, usage i exit error.

   Explicar que fem primer la validació d’error i pleguem, o fem la xixa.

 * **05-validar-nota.sh  nota**
   
   Mostrar si està aprovat/suspès. Validar rep un arg i que la nota és un valor vàlid 0-10.

 * **06-nota.sh nota**

   Mostrar suspès, aprovat, notable, excel·lent. Validar rep un arg i que té un valor vàlid del 0 al 10.

 * **07-esdirectori.sh   dir**

   Si l’argument rebut és un directori, llistar-lo. Si no és directori error. Validar hi ha un argument.

   Ampliació: prog -h, prog file

 * **08-tipusfile.sh  file**

   Dir si es regular, dir, link (ampliar després a altres).
   Usar una variable msg i pintar un sol cop el resultat.

 * **09-exemplecase.sh**

   - dir si un nom és de nen o de nena donada una llista., - ampliar amb la opció altres
   - dir si és vocal o no és vocal
   - dir si és parell o imparell del 0 al 10  


 * **10-case-diesmes.sh mes**

   Programa que donat un mes dir si té 28, 30 o 31 dies. 

   L’argument més pren el valor del 1 al 12, cal validar-ho.

   Validar que existeix l’argument.

   Ampliar 07 → fer que tingui prog -h


 * **11-exemplesfor.sh**

   a) iterar llista noms

   b1) exemple assignar llista a una variable i iterar el seu contingut (sense encapsular)

   b2) exemple assignar llista a una variable i iterar el seu contingut: encapsular la variable “$llista” (una sola iteració).

   c) exemple iterar ls llista arguments

   d) exemple encapsular “$*” i “$@”. observar que la diferència radica en que “$@” fa el word spliting (tot i estar encapsulat).

   e) Progarma exemple:  mostrar els arguments rebuts numerant-los.

 * **12-fornotes.sh nota...**

   Repetir exercici 03-notes.sh però amb la synopiys: prog nota…

   Si no hi ha almenys una  nota error, per cada nota, validar que pren un valor vàlid del rang [0-10] i mostrar la qualificació. 

   Explicat concepte: Error irrecuperable, error recuperable.

   Explicat els errors es mostren per stderr amb un append. Observar que si es volca la sortida a un fitxer no és el mateix usar en el codi “>” que “>>”.
 
 * **13-exemples-while.sh**

   *Casos Generals*

   Exemple fer un bucle que mostri del 0 al 10 (MAX=10). 

   Fer un bucle compte enrrera del 10 al 0. 

   Fer un compte enrrera de arg fins a zero. 

   Fer que surti 12, 11, 10 → amb coma i espai el echo 

   Operador Shift i processar args 

   iterar per tots els args (usant $1). 

   iterar per tots els args numerant-los  (usant $1). 

   iterar mostrant $1 $# $* amb shift (usant $1). 

   iterar mostrant $1 usant de condició $# -gt 0 (provar cas error $#-ge 0). 

   Bucle while read 

   mostrar linia a línia stdin. Processar amb interactiu, pipe i redirect d’entrada. 

   ampliar fent que iteri linia a linia fins a token FI. 

   fer programa fent que numeri les línies que mostra per stdout. 

   fer un altre bucle que mostri per stdout el que s’ha rebut de stdin en majúscules. 


 * **14-LLista Directori** (fet en quatre passos per observar l'aprenentatge)

   * **14a-llista-dir.sh dir**
   
     Validar que es rep un argument i que és un directori i llistar-ne el contingut. 
     Per llistar el contingut amb un simple ls ja n’hi ha prou.


   * **14b-llista-dir.sh dir**

     Validar que es rep un argument i que és un directori i llistar-ne el contingut  
     numerant cada element (en una llista línia a línia). Usar un bucle for i un 
     command substitution per generar la llista d’elements del directori  
     que cal mostrar-los numeradament.

   * **14c-llista-dir.sh dir**

     Validar que es rep un argument i que és un directori. Per a cada element 
     del directori indicar si és un fitxer regular, un link, un directori 
     o una altra cosa. Usar un bucle per iterar per a cada element del directori
     (amb un command substitution). Usar un bloc condicional compost per 
     determinar el tipus de l’element.

   * **14d-llista-dir.sh dir[…]**

     Ídem programa anterior però processant un o més directoris.

 * **15-copyfiles.sh fileorigen dirdesti**

   Validar existeix (es regular file) i el destí existeix i es directori.

   Ampliar amb -help 

   * **15a-copyfiles.sh  file… dir-desti**

     programa que mostri el nº arguments, la llista, el nom del programa, 
     l'últim argument i tots els arguments menys l’últim. El difícil és 
     identificar quin és l’últim argument.

     Llavors itera per la llista origen i si és file el copia al dirdestí.

     Resolt usant grep, sed: “s/.*://”.  

   * **15b-copyfiles.sh file… dir-desti**

     Resolt usant  cut -f$#


  * **16-validarargs.sh**

    prog -h (mostrar help)

    prog -a arg (dir primer cas)

    prog -b -a arg  (dir segon cas)

    validar arguments i mostrar el missatge que diu si estem al primer cas 
    o al segon cas, tot mostrant l’argument rebut.


  * **17-argsfor.sh [ -a -b -c -d -f -g ] arg…**

    Mostrar la llista d’opcions i la llista d’arguments.

    Fer un bucle per tots els elements, amb un case acumular les opcions 
    a opcions i els arguments a arguments. Les opcions poden aparèixer en
    qualsevol ordre però sempre abans que els arguments.  No cal fer 
    validacions de coherència, suposem que l’usuari escriu apropiadament
    les opcions.


 * **18-argsparse.sh  [-a file -b -c -d num -e] arg[…]**

   Mostrar la llista de opcions i la llista d’arguments, el valor 
   de file i de num. Fer un bucle per tots els elements, amb un case
   acumular les opcions a opcions i els arguments a arguments i salvar 
   el valor dels elements file i num. Pista: usar shift.

 * **19-creardir.sh noudir[…]**

   Validar almenys un arg. Crear els directoris passats com arguments. 
   mkdir no ha de generar cap sortida. status 0 ok (creats tots els dirs). 
   1 error args, 2 si algun dir no s’ha creat.




