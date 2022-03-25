%echo off
del *.pdf
cd latex
del resume-cn.tex
cd ..
cabal run resume --verbose=0 -- cn >> latex/resume-cn.tex
cd latex
xelatex resume-cn.tex
del resume-cn.tex
move *.pdf ..
del *.log
del *.aux
del *.out
cd ..
cmd /c "rd /s /q .git"
git init --initial-branch=master
git remote add origin https://iamazy:%GITHUB_TOKEN%@github.com/iamazy/resume.git
git add *
git add .gitignore
git commit -a -m "refresh everything" >> commit.log
git push --force --set-upstream origin master
git status
