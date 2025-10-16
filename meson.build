project('cpp-cuda', ['cpp', 'cuda'], default_options: ['cpp_std=c++23'])

# Cuda specifics
cuda_args = [
  '-arch=native',
  '-Wno-deprecated-gpu-targets',
]
cuda_dependency = dependency('cuda', required: true)
cuda_sources = ['src/cuda.cu',]

# Cpp specifics
cpp_sources = ['src/main.cpp',]

# Create executable
executable(
  'cpp-cuda',
  cuda_sources + cpp_sources,
  include_directories: include_directories('include'),
  dependencies: [cuda_dependency],
  cuda_args: cuda_args
)
