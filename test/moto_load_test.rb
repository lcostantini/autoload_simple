# -*- coding: utf-8 -*-
require_relative '../lib/moto_load'

<<STR
  Hoy te levantás, desayunás, suena el skype de tu celular,
  atendés y del otro lado está DHH para decirte que el autoload
  de Rails no le gusta más, entonces te pide que hagas una prueba
  de concepto de lo que va a ser el nuevo autoload para Rails 10.
  
  La prueba de concepto es sencilla, dada una constante que puede
  ser la definicion de un módulo o una clase si ruby no encuentra
  esa constante tiene que intentar requerir un archivo en un determinado
  directorio.
  Entonces por ejemplo si queremos hacer puts Foo.class y Foo aún no existe
  el autoload tiene que intentar hacer: require './lib/foo.rb'
  siendo ./lib el directorio dónde debe buscar los archivos.
STR

test 'it requires the file based on the constant, Foo -> foo.rb' do
  assert Foo.class == Module
end

test 'if the class name is MyFoo it requires my_foo.rb' do
  assert MyFoo.new.class == MyFoo
end

test 'if the const is not found it still raising NameError' do
  assert_raise NameError do
    DontExists.new
  end
end

test 'Lib path is configurable' do
  MotoLoad.path = "../test/fixtures/custom_path/"
  assert InsideCustomPath.new.class == InsideCustomPath 
end
