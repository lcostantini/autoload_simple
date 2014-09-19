  Autoload simple.
  ===============
  
  Hay que hacer un autoload de archivos que funcione de la siguiente
  manera: dada una constante que puede ser la definicion de un módulo
  o una clase si ruby no encuentra esa constante tiene que intentar
  requerir un archivo en un determinado directorio.
  Entonces por ejemplo si queremos hacer puts Foo.class y Foo aún no existe
  el autoload tiene que intentar hacer: require './lib/foo.rb'
  siendo ./lib el directorio dónde debe buscar los archivos.
