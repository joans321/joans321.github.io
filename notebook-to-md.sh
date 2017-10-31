#/bin/bash

tmpdir=.tmp

if [ -z "$1" ]; then
  nbpath=_posts/notebook/2017-10-31-scatter.ipynb
else
  nbpath=$1
fi

echo "convert $nbpath to markdown"



filename=`basename $nbpath`
basename=${filename%.*}

asset_name=${basename}_files
out_asset=$tmpdir/$asset_name
out_file=$tmpdir/${basename}.md

mkdir -p $tmpdir
jupyter-nbconvert --to markdown --output-dir=$tmpdir $nbpath

sed -i '1d' $out_file
sed -i "s#$asset_name#/assets/$asset_name#g" $out_file

rm -rf assets/$asset_name
mv $out_asset assets/
mv $out_file  _posts/ai/


#mv .tmp/*.md _posts/ai/


# rm -rf $tmpdir

