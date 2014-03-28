g++ test.cpp -o test 

declare -a OUT_FOLDERS=("harddisk" "ramdisk")
declare -a SIZE_ARRAY=("8" "12" "16" "24" "32" "48" "64" "128" "256" "512") # "1024" "2048" "4096")

for OUT_FOLDER in "${OUT_FOLDERS[@]}"
do 
  
  echo -e "size\treal\tuser\tsys" > "${OUT_FOLDER}.txt"
  for SIZE in "${SIZE_ARRAY[@]}"
  do
    echo "${SIZE}"
    /usr/bin/time --output="${OUT_FOLDER}.txt" --append --format="${SIZE}\t%e\t%U\t%S"  ./test ${SIZE} "${OUT_FOLDER}/out.bin"
    ls -alh "${OUT_FOLDER}/out.bin"
  done
done

gnuplot -persist plot.gplt
