from distutils.core import setup, Extension
from Cython.Build import cythonize

setup(ext_modules = cythonize(Extension(
           "pyMdApi",                                         # the extension name
           sources=["pyMdApi.pyx", "MdSpi.cpp", "MdApi.cpp"], # the Cython source and
                                                              # additional C++ source files
           language="c++",                                    # generate and compile C++ code
           extra_compile_args=["/openmp"],  
           extra_link_args=["thostmduserapi.lib"],  
      )))
