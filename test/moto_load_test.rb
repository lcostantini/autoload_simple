# -*- coding: utf-8 -*-
require_relative '../lib/moto_load'

test 'if requires the file based on the constant, Foo -> foo.rb' do
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
