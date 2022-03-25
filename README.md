# iamazy's resume

[![GitHub top language](https://img.shields.io/github/languages/top/iamazy/resume.svg)](https://github.com/iamazy/resume)
[![GitHub forks](https://img.shields.io/github/forks/iamazy/resume.svg?style=social&label=Fork)](https://github.com/iamazy/resume)

This is my resume, based on [this template](https://github.com/ice1000/resume).
There's a [Haskell script](Resume.hs) to generate the TeX source files.

# Build

To build this resume, install texlive-full and GHC toolchain first.<br/>
Then:

```bash
# Generate the TeX files
runghc Main.hs cn >> latex/resume-cn.tex

# Build the TeX files
cd latex
make
cp *.pdf ..
cd ..
```

# Download/下载

+ [中文版 (pdf)](./resume-cn.pdf)
