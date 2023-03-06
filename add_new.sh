#!/bin/bash
for fullNom in source/*; do
    nom=$(basename $fullNom)
    rm -rf "source/$nom"
    cd source
    git clone "https://archeo-lex.fr/codes/$nom"
    cd "$nom"
    mv .git git
    cd ../..
    git add .
    git commit -m "adding $nom"
done
git push