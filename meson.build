project('cpp-cuda', ['cpp', 'cuda'], default_options: ['cpp_std=c++23'])

# Cuda compiler arguments.
# -arch=native: Compile for your specific GPU.
# -Wno-deprecated-gpu-targets: Suppress the current NVCC warning.
cuda_args = [
  '-arch=native',
  '-Wno-deprecated-gpu-targets',
]

# Tell meson that cuda is required.
cuda_dependency = dependency('cuda', required: true)

# List your cuda files here.
cuda_sources = [
  'src/cuda.cu',
]

# List your cpp files here.
cpp_sources = [
  'src/main.cpp',
]

# Create the final executable.
executable(
  'cpp-cuda',
  cuda_sources + cpp_sources,
  include_directories: include_directories('include'),
  dependencies: [cuda_dependency],
  cuda_args: cuda_args,
)