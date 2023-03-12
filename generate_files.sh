#!/bin/bash
nom=$1
rm -rf source_md
mkdir -p source_md/"$nom"
sed -E 's/(#{6})#{1,}/\1/g' source/"$nom"/"$nom".md > source_md/"$nom"/"$nom"_2.md
sed -E 's/^#(#*) ([^:]+) :.*/#\1 \2/' source_md/"$nom"/"$nom"_2.md > source_md/"$nom"/"$nom"_1.md
sed -E 's/^(#+)(.{0,250}).*/\1\2/' source_md/"$nom"/"$nom"_1.md > source_md/"$nom"/"$nom".md
mdsplit source_md/"$nom"/"$nom".md --max-level 6 --output "$nom"-out
rm -rf "$nom"
mv "$nom"-out "$nom"
find $nom -type f ! -name 'Article*' -delete