gcc -O3  -I./hetero_util -DENABLE_HAPPI denoise.c hetero_util/atom_events.c hetero_util/xeon_events.c hetero_util/get_current_processor.c hetero_util/HAPPI.c hetero_util/derived_events.c hetero_util/util_heteros.c -lpthread -lm -lperfctr -o denoise 

