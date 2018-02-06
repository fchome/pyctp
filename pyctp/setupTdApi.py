from distutils.core import setup, Extension
from Cython.Build import cythonize

setup(ext_modules = cythonize(Extension(
           "pyTdApi",                                         # the extension name
           sources=["pyTdApi.pyx", "TdSpi.cpp", "TdApi.cpp"], # the Cython source and
                                                              # additional C++ source files
           language="c++",                                    # generate and compile C++ code
           extra_compile_args=["/openmp"],  
           extra_link_args=["thosttraderapi.lib"],  
      )))
