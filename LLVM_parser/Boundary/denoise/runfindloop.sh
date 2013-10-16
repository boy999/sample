#/curr/boyuan/PIN/pin-2.9-39599-gcc.3.4.6-ia32_intel64-linux/pin -t /curr/boyuan/PIN/pin-2.9-39599-gcc.3.4.6-ia32_intel64-linux/source/tools/boyuan2011/obj-intel64/findloop.so -- ./denoise > res_findloop.txt
INPUT_FILE=$1;
/curr/boyuan/PIN/pin-2.9-39599-gcc.3.4.6-ia32_intel64-linux/pin -t /curr/boyuan/PIN/pin-2.9-39599-gcc.3.4.6-ia32_intel64-linux/source/tools/boyuan2011/obj-intel64/findloop.so -- ./${INPUT_FILE} > res_findloop.txt
