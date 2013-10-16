/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;
/* Structure forward decls */
struct l_struct_2E_FILE;
struct l_struct_2E__IO_marker;
struct l_struct_2E_csEdgeStruct;
struct l_struct_2E_stat;
struct l_struct_2E_timespec;

/* Typedefs */
typedef struct l_struct_2E_FILE l_struct_2E_FILE;
typedef struct l_struct_2E__IO_marker l_struct_2E__IO_marker;
typedef struct l_struct_2E_csEdgeStruct l_struct_2E_csEdgeStruct;
typedef struct l_struct_2E_stat l_struct_2E_stat;
typedef struct l_struct_2E_timespec l_struct_2E_timespec;

/* Structure contents */
struct l_struct_2E_FILE {
  unsigned int field0;
  unsigned char *field1;
  unsigned char *field2;
  unsigned char *field3;
  unsigned char *field4;
  unsigned char *field5;
  unsigned char *field6;
  unsigned char *field7;
  unsigned char *field8;
  unsigned char *field9;
  unsigned char *field10;
  unsigned char *field11;
  struct l_struct_2E__IO_marker *field12;
  struct l_struct_2E_FILE *field13;
  unsigned int field14;
  unsigned int field15;
  unsigned long long field16;
  unsigned short field17;
  unsigned char field18;
  unsigned char field19[1];
  unsigned char *field20;
  unsigned long long field21;
  unsigned char *field22;
  unsigned char *field23;
  unsigned char *field24;
  unsigned char *field25;
  unsigned long long field26;
  unsigned int field27;
  unsigned char field28[20];
};

struct l_struct_2E__IO_marker {
  struct l_struct_2E__IO_marker *field0;
  struct l_struct_2E_FILE *field1;
  unsigned int field2;
};

struct l_struct_2E_csEdgeStruct {
  unsigned char field0;
  unsigned long long field1;
  unsigned int field2[8];
  unsigned int field3[8];
};

struct l_struct_2E_timespec {
  unsigned long long field0;
  unsigned long long field1;
};

struct l_struct_2E_stat {
  unsigned long long field0;
  unsigned long long field1;
  unsigned long long field2;
  unsigned int field3;
  unsigned int field4;
  unsigned int field5;
  unsigned int field6;
  unsigned long long field7;
  unsigned long long field8;
  unsigned long long field9;
  unsigned long long field10;
  struct l_struct_2E_timespec field11;
  struct l_struct_2E_timespec field12;
  struct l_struct_2E_timespec field13;
  unsigned long long field14[3];
};


/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
static unsigned char *hash_insert(unsigned long long llvm_cbe_key, unsigned int llvm_cbe_keyOffSet, unsigned int llvm_cbe_validOffSet);
void __assert_fail(unsigned char *, unsigned char *, unsigned int , unsigned char *);
static void CallEdgeProfiler(unsigned int llvm_cbe_functionId, unsigned int llvm_cbe_callSiteId, unsigned int llvm_cbe_calleeId);
static void CallProfPrinter(void);
struct l_struct_2E_FILE *fopen(unsigned char *, unsigned char *);
unsigned int fprintf(struct l_struct_2E_FILE *, unsigned char *, ...);
unsigned int fputc(unsigned int , unsigned char *);
unsigned int fclose(struct l_struct_2E_FILE *);
static unsigned int APHash(unsigned char *llvm_cbe_str);
unsigned int printf(unsigned char *, ...);
void exit(unsigned int );
static void LBM_initializeGrid(double *llvm_cbe_grid);
static void LBM_loadObstacleFile(double *llvm_cbe_grid, unsigned char *llvm_cbe_filename);
unsigned int fgetc(struct l_struct_2E_FILE *);
static void LBM_initializeSpecialCellsForLDC(double *llvm_cbe_grid);
static void LBM_initializeSpecialCellsForChannel(double *llvm_cbe_grid);
static void LBM_performStreamCollide(double *llvm_cbe_srcGrid, double *llvm_cbe_dstGrid);
static void LBM_showGridStatistics(double *llvm_cbe_grid);
unsigned long long fread(unsigned char *, unsigned long long , unsigned long long , struct l_struct_2E_FILE *);
unsigned long long fwrite(unsigned char *, unsigned long long , unsigned long long , struct l_struct_2E_FILE *);
unsigned int main(unsigned int llvm_cbe_nArgs, unsigned char **llvm_cbe_arg);
unsigned int puts(unsigned char *);
unsigned long long __strtol_internal(unsigned char *, unsigned char **, unsigned int , unsigned int );
unsigned int __xstat(unsigned int , unsigned char *, struct l_struct_2E_stat *);
unsigned char *malloc();
void free(unsigned char *);
void abort(void);
unsigned char *memset(unsigned char *, unsigned int , unsigned long long );
unsigned char *memcpy(unsigned char *, unsigned char *, unsigned long long );
double sqrt(double );
double sqrtl(double );


/* Global Variable Declarations */
static unsigned int gCSEdgeTableSize;
static bool gCSEdgeKeyOffset_2E_b;
static bool gCSEdgeValidOffset_2E_b;
static unsigned char _2E_str[57];
static unsigned char _2E_str1[11];
static unsigned char __PRETTY_FUNCTION___2E_2597[17];
static struct l_struct_2E_csEdgeStruct *gCSEdgeTable;
static unsigned char _2E_str2[20];
static unsigned char _2E_str3[2];
static unsigned char _2E_str4[6];
static unsigned char _2E_str5[7];
static unsigned long long gNumConflicts;
static unsigned long long gNumHashFind;
static unsigned char _2E_str6[49];
static unsigned char _2E_str17[3];
static unsigned char _2E_str28[138];
static unsigned char _2E_str69[43];
static unsigned char _2E_str7[3];
static unsigned char actionString_2E_2842[3][32];
static unsigned char simTypeString_2E_2843[3][32];
static unsigned char _2E_str410[7];
static unsigned char _2E_str15[174];
static unsigned char _2E_str26[108];
static unsigned char _2E_str37[55];
static unsigned char _2E_str48[82];
static unsigned char _2E_str59[53];
static unsigned char _2E_str610[14];
static unsigned int cg_caller_id_var;
static unsigned int cg_caller_call_site_var;


/* Global Variable Definitions and Initialization */
static unsigned int gCSEdgeTableSize;
static bool gCSEdgeKeyOffset_2E_b;
static bool gCSEdgeValidOffset_2E_b;
static unsigned char _2E_str[57] = "0 && \"Same call site calls too many different functions\"";
static unsigned char _2E_str1[11] = "callsite.c";
static unsigned char __PRETTY_FUNCTION___2E_2597[17] = "CallEdgeProfiler";
static struct l_struct_2E_csEdgeStruct *gCSEdgeTable;
static unsigned char _2E_str2[20] = "call_profile_by.log";
static unsigned char _2E_str3[2] = "w";
static unsigned char _2E_str4[6] = "%u %u";
static unsigned char _2E_str5[7] = " %u %u";
static unsigned long long gNumConflicts;
static unsigned long long gNumHashFind;
static unsigned char _2E_str6[49] = "LBM_allocateGrid: could not allocate %.1f MByte\n";
static unsigned char _2E_str17[3] = "rb";
static unsigned char _2E_str28[138] = "LBM_showGridStatistics:\n\tnObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\n\tminRho: %8.4f maxRho: %8.4f mass: %e\n\tminU: %e maxU: %e\n\n";
static unsigned char _2E_str69[43] = "LBM_compareVelocityField: maxDiff = %e  \n\n";
static unsigned char _2E_str7[3] = "wb";
static unsigned char actionString_2E_2842[3][32] = { "nothing\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", "compare\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", "store\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" };
static unsigned char simTypeString_2E_2843[3][32] = { "lid-driven cavity\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", "channel flow\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", { ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0), ((unsigned char )0) } };
static unsigned char _2E_str410[7] = "<none>";
static unsigned char _2E_str15[174] = "MAIN_printInfo:\n\tgrid size      : %i x %i x %i = %.2f * 10^6 Cells\n\tnTimeSteps     : %i\n\tresult file    : %s\n\taction         : %s\n\tsimulation type: %s\n\tobstacle file  : %s\n\n";
static unsigned char _2E_str26[108] = "syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]";
static unsigned char _2E_str37[55] = "MAIN_parseCommandLine: cannot stat obstacle file '%s'\n";
static unsigned char _2E_str48[82] = "MAIN_parseCommandLine:\n\tsize of file '%s' is %i bytes\n\texpected size is %i bytes\n";
static unsigned char _2E_str59[53] = "MAIN_parseCommandLine: cannot stat result file '%s'\n";
static unsigned char _2E_str610[14] = "timestep: %i\n";
static unsigned int cg_caller_id_var = ((unsigned int )1);
static unsigned int cg_caller_call_site_var;


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

static unsigned char *hash_insert(unsigned long long llvm_cbe_key, unsigned int llvm_cbe_keyOffSet, unsigned int llvm_cbe_validOffSet) {
  unsigned long long llvm_cbe_key46;    /* Address-exposed local */
  unsigned long long llvm_cbe_key230;    /* Address-exposed local */
  unsigned long long llvm_cbe_key349;    /* Address-exposed local */
  unsigned int llvm_cbe_tmp5;
  struct l_struct_2E_csEdgeStruct *ltmp_0_1;
  unsigned char *llvm_cbe_tmp7;
  unsigned char *ltmp_1_2;
  struct l_struct_2E_csEdgeStruct (*ltmp_2_3)[7];
  unsigned char *ltmp_3_2;
  struct l_struct_2E_csEdgeStruct *ltmp_4_1;
  unsigned char *llvm_cbe_tmp25;
  unsigned char *llvm_cbe_basePtr_0;
  unsigned char *llvm_cbe_basePtr_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_numElems_0;
  unsigned int llvm_cbe_numElems_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp50;
  unsigned long long llvm_cbe_tmp55;
  unsigned long long llvm_cbe_tmp7071;
  unsigned long long llvm_cbe_tmp6566;
  unsigned long long llvm_cbe_gNumConflicts_promoted5;
  unsigned long long llvm_cbe_gNumConflicts_tmp_06;
  unsigned long long llvm_cbe_gNumConflicts_tmp_06__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp50_pn;
  unsigned int llvm_cbe_tmp50_pn__PHI_TEMPORARY;
  unsigned int llvm_cbe_hashVal_0_reg2mem_0;
  unsigned long long llvm_cbe_tmp6062;
  unsigned char *llvm_cbe_tmp63;
  unsigned char llvm_cbe_tmp74;
  unsigned long long llvm_cbe_tmp84;
  unsigned long long llvm_cbe_tmp95;
  unsigned int llvm_cbe_tmp97;
  unsigned int llvm_cbe_tmp102;
  unsigned long long llvm_cbe_gNumConflicts_tmp_17;
  unsigned long long llvm_cbe_gNumConflicts_tmp_17__PHI_TEMPORARY;
  unsigned char llvm_cbe_foundValidData_0_ph;
  unsigned char llvm_cbe_foundValidData_0_ph__PHI_TEMPORARY;
  unsigned char *llvm_cbe_tmp1_0_ph;
  unsigned char *llvm_cbe_tmp1_0_ph__PHI_TEMPORARY;
  unsigned char llvm_cbe_foundValidData_0;
  unsigned char llvm_cbe_foundValidData_0__PHI_TEMPORARY;
  unsigned char *llvm_cbe_tmp1_0;
  unsigned char *llvm_cbe_tmp1_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp;
  unsigned char *ltmp_5_2;
  struct l_struct_2E_csEdgeStruct *ltmp_6_1;
  unsigned char *llvm_cbe_tmpcast2;
  unsigned char *ltmp_7_2;
  unsigned long long llvm_cbe_tmp195196;
  unsigned long long llvm_cbe_tmp205206;
  unsigned char *llvm_cbe_key230233;
  unsigned int llvm_cbe_i176_0_reg2mem_0_us;
  unsigned int llvm_cbe_i176_0_reg2mem_0_us__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp190192_us;
  unsigned char llvm_cbe_tmp199_us;
  unsigned int llvm_cbe_indvar_next;
  unsigned long long llvm_cbe_tmp210_us;
  unsigned int ltmp_8_4;
  unsigned long long llvm_cbe_tmp240_us;
  unsigned char *ltmp_9_2;
  unsigned int llvm_cbe_i176_0_reg2mem_0;
  unsigned int llvm_cbe_i176_0_reg2mem_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp190192;
  unsigned char *llvm_cbe_tmp193;
  unsigned char llvm_cbe_tmp199;
  unsigned long long llvm_cbe_tmp210;
  unsigned int llvm_cbe_tmp234;
  unsigned long long llvm_cbe_tmp240;
  unsigned long long llvm_cbe_gNumConflicts_promoted;
  unsigned long long llvm_cbe_indvar;
  unsigned long long llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp234_pn;
  unsigned int llvm_cbe_tmp234_pn__PHI_TEMPORARY;
  unsigned int llvm_cbe_i225_0_reg2mem_0;
  unsigned long long llvm_cbe_gNumConflicts_tmp_0;
  unsigned int llvm_cbe_hashVal229_0_reg2mem_0;
  unsigned long long llvm_cbe_tmp245247;
  unsigned char *llvm_cbe_tmp248;
  unsigned char llvm_cbe_tmp259;
  unsigned long long llvm_cbe_tmp269;
  unsigned long long llvm_cbe_tmp280;
  unsigned int llvm_cbe_tmp282;
  unsigned long long llvm_cbe_indvar_next464;
  unsigned long long llvm_cbe_gNumConflicts_tmp_1;
  unsigned long long llvm_cbe_gNumConflicts_tmp_1__PHI_TEMPORARY;
  unsigned char *llvm_cbe_tmp175_0_ph;
  unsigned char *llvm_cbe_tmp175_0_ph__PHI_TEMPORARY;
  unsigned char *ltmp_10_2;
  unsigned int llvm_cbe_indvar_next467;
  unsigned int llvm_cbe_tmp353;
  unsigned long long llvm_cbe_tmp359;
  unsigned long long llvm_cbe_tmp374375;
  unsigned long long llvm_cbe_tmp369370;
  unsigned long long llvm_cbe_gNumConflicts_promoted460;
  unsigned long long llvm_cbe_indvar469;
  unsigned long long llvm_cbe_indvar469__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp353_pn;
  unsigned int llvm_cbe_tmp353_pn__PHI_TEMPORARY;
  unsigned int llvm_cbe_i344_0_reg2mem_0;
  unsigned long long llvm_cbe_gNumConflicts_tmp_0461;
  unsigned int llvm_cbe_hashVal348_0_reg2mem_0;
  unsigned long long llvm_cbe_tmp364366;
  unsigned char *llvm_cbe_tmp367;
  unsigned char llvm_cbe_tmp378;
  unsigned long long llvm_cbe_tmp388;
  unsigned long long llvm_cbe_tmp399;
  unsigned int llvm_cbe_tmp401;
  unsigned long long llvm_cbe_indvar_next470;
  unsigned long long llvm_cbe_gNumConflicts_tmp_1462;
  unsigned long long llvm_cbe_gNumConflicts_tmp_1462__PHI_TEMPORARY;
  unsigned char *llvm_cbe_tmp3_0_ph;
  unsigned char *llvm_cbe_tmp3_0_ph__PHI_TEMPORARY;
  unsigned char *llvm_cbe_tmp3_0;
  unsigned char *llvm_cbe_tmp3_0__PHI_TEMPORARY;

  llvm_cbe_tmp5 = *(&gCSEdgeTableSize);
  ltmp_0_1 = *(&gCSEdgeTable);
  llvm_cbe_tmp7 = &ltmp_0_1->field0;
  if ((llvm_cbe_tmp5 == ((unsigned int )0))) {
    goto llvm_cbe_cond_true;
  } else {
    llvm_cbe_basePtr_0__PHI_TEMPORARY = llvm_cbe_tmp7;   /* for PHI node */
    llvm_cbe_numElems_0__PHI_TEMPORARY = llvm_cbe_tmp5;   /* for PHI node */
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_true:
  ltmp_1_2 =  /*tail*/ malloc(((unsigned long long )560ll));
  ltmp_2_3 = ((struct l_struct_2E_csEdgeStruct (*)[7])ltmp_1_2);
  *(&gCSEdgeTable) = (&ltmp_2_3[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  ltmp_3_2 = memset((&ltmp_2_3[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))].field0), (((unsigned int )(unsigned char )((unsigned char )0))), ((unsigned long long )560ll));
  ltmp_4_1 = *(&gCSEdgeTable);
  llvm_cbe_tmp25 = &ltmp_4_1->field0;
  *(&gCSEdgeTableSize) = ((unsigned int )7);
  llvm_cbe_basePtr_0__PHI_TEMPORARY = llvm_cbe_tmp25;   /* for PHI node */
  llvm_cbe_numElems_0__PHI_TEMPORARY = ((unsigned int )7);   /* for PHI node */
  goto llvm_cbe_cond_next;

llvm_cbe_cond_next:
  llvm_cbe_basePtr_0 = llvm_cbe_basePtr_0__PHI_TEMPORARY;
  llvm_cbe_numElems_0 = llvm_cbe_numElems_0__PHI_TEMPORARY;
  *(&llvm_cbe_key46) = llvm_cbe_key;
  llvm_cbe_tmp50 = APHash((((unsigned char *)(&llvm_cbe_key46))));
  llvm_cbe_tmp55 = *(&gNumHashFind);
  *(&gNumHashFind) = (llvm_cbe_tmp55 + ((unsigned long long )1ll));
  if ((llvm_cbe_numElems_0 == ((unsigned int )0))) {
    llvm_cbe_foundValidData_0__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    llvm_cbe_tmp1_0__PHI_TEMPORARY = ((unsigned char *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_bb112;
  } else {
    goto llvm_cbe_bb57_preheader;
  }

llvm_cbe_bb57_preheader:
  llvm_cbe_tmp7071 = ((unsigned long long )(unsigned int )llvm_cbe_validOffSet);
  llvm_cbe_tmp6566 = ((unsigned long long )(unsigned int )llvm_cbe_keyOffSet);
  llvm_cbe_gNumConflicts_promoted5 = *(&gNumConflicts);
  llvm_cbe_gNumConflicts_tmp_06__PHI_TEMPORARY = llvm_cbe_gNumConflicts_promoted5;   /* for PHI node */
  llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_tmp50_pn__PHI_TEMPORARY = llvm_cbe_tmp50;   /* for PHI node */
  goto llvm_cbe_bb57;

  do {     /* Syntactic loop 'bb57' to make GCC happy */
llvm_cbe_bb57:
  llvm_cbe_gNumConflicts_tmp_06 = llvm_cbe_gNumConflicts_tmp_06__PHI_TEMPORARY;
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_tmp50_pn = llvm_cbe_tmp50_pn__PHI_TEMPORARY;
  llvm_cbe_hashVal_0_reg2mem_0 = ((unsigned int )(((unsigned int )llvm_cbe_tmp50_pn) % ((unsigned int )llvm_cbe_numElems_0)));
  llvm_cbe_tmp6062 = ((unsigned long long )(unsigned int )(llvm_cbe_hashVal_0_reg2mem_0 * ((unsigned int )80)));
  llvm_cbe_tmp63 = &llvm_cbe_basePtr_0[((signed long long )llvm_cbe_tmp6062)];
  llvm_cbe_tmp74 = *(&llvm_cbe_basePtr_0[((signed long long )(llvm_cbe_tmp6062 + llvm_cbe_tmp7071))]);
  if ((llvm_cbe_tmp74 == ((unsigned char )0))) {
    llvm_cbe_gNumConflicts_tmp_17__PHI_TEMPORARY = llvm_cbe_gNumConflicts_tmp_06;   /* for PHI node */
    llvm_cbe_foundValidData_0_ph__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    llvm_cbe_tmp1_0_ph__PHI_TEMPORARY = llvm_cbe_tmp63;   /* for PHI node */
    goto llvm_cbe_bb112_loopexit;
  } else {
    goto llvm_cbe_cond_next82;
  }

llvm_cbe_cond_next93:
  llvm_cbe_tmp95 = llvm_cbe_gNumConflicts_tmp_06 + ((unsigned long long )1ll);
  llvm_cbe_tmp97 = llvm_cbe_hashVal_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp102 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  if ((((unsigned int )llvm_cbe_tmp102) < ((unsigned int )llvm_cbe_numElems_0))) {
    llvm_cbe_gNumConflicts_tmp_06__PHI_TEMPORARY = llvm_cbe_tmp95;   /* for PHI node */
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp102;   /* for PHI node */
    llvm_cbe_tmp50_pn__PHI_TEMPORARY = llvm_cbe_tmp97;   /* for PHI node */
    goto llvm_cbe_bb57;
  } else {
    llvm_cbe_gNumConflicts_tmp_17__PHI_TEMPORARY = llvm_cbe_tmp95;   /* for PHI node */
    llvm_cbe_foundValidData_0_ph__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    llvm_cbe_tmp1_0_ph__PHI_TEMPORARY = ((unsigned char *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_bb112_loopexit;
  }

llvm_cbe_cond_next82:
  llvm_cbe_tmp84 = *(((unsigned long long *)(&llvm_cbe_basePtr_0[((signed long long )(llvm_cbe_tmp6062 + llvm_cbe_tmp6566))])));
  if ((llvm_cbe_tmp84 == llvm_cbe_key)) {
    llvm_cbe_gNumConflicts_tmp_17__PHI_TEMPORARY = llvm_cbe_gNumConflicts_tmp_06;   /* for PHI node */
    llvm_cbe_foundValidData_0_ph__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
    llvm_cbe_tmp1_0_ph__PHI_TEMPORARY = llvm_cbe_tmp63;   /* for PHI node */
    goto llvm_cbe_bb112_loopexit;
  } else {
    goto llvm_cbe_cond_next93;
  }

  } while (1); /* end of syntactic loop 'bb57' */
llvm_cbe_bb112_loopexit:
  llvm_cbe_gNumConflicts_tmp_17 = llvm_cbe_gNumConflicts_tmp_17__PHI_TEMPORARY;
  llvm_cbe_foundValidData_0_ph = llvm_cbe_foundValidData_0_ph__PHI_TEMPORARY;
  llvm_cbe_tmp1_0_ph = llvm_cbe_tmp1_0_ph__PHI_TEMPORARY;
  *(&gNumConflicts) = llvm_cbe_gNumConflicts_tmp_17;
  llvm_cbe_foundValidData_0__PHI_TEMPORARY = llvm_cbe_foundValidData_0_ph;   /* for PHI node */
  llvm_cbe_tmp1_0__PHI_TEMPORARY = llvm_cbe_tmp1_0_ph;   /* for PHI node */
  goto llvm_cbe_bb112;

llvm_cbe_bb112:
  llvm_cbe_foundValidData_0 = llvm_cbe_foundValidData_0__PHI_TEMPORARY;
  llvm_cbe_tmp1_0 = llvm_cbe_tmp1_0__PHI_TEMPORARY;
  if (((llvm_cbe_tmp1_0 != ((unsigned char *)/*NULL*/0)) & (llvm_cbe_foundValidData_0 == ((unsigned char )1)))) {
    goto llvm_cbe_UnifiedReturnBlock;
  } else {
    goto llvm_cbe_cond_next127;
  }

llvm_cbe_cond_next127:
  if (((llvm_cbe_tmp1_0 != ((unsigned char *)/*NULL*/0)) & (llvm_cbe_foundValidData_0 == ((unsigned char )0)))) {
    goto llvm_cbe_cond_true137;
  } else {
    goto llvm_cbe_cond_next153;
  }

llvm_cbe_cond_true137:
  *(&llvm_cbe_tmp1_0[((signed long long )(((unsigned long long )(unsigned int )llvm_cbe_validOffSet)))]) = ((unsigned char )1);
  *(((unsigned long long *)(&llvm_cbe_tmp1_0[((signed long long )(((unsigned long long )(unsigned int )llvm_cbe_keyOffSet)))]))) = llvm_cbe_key;
  return llvm_cbe_tmp1_0;
llvm_cbe_cond_next153:
  llvm_cbe_tmp = llvm_cbe_numElems_0 << ((unsigned int )1);
  ltmp_5_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp)) * ((unsigned long long )80ll)));
  ltmp_6_1 = ((struct l_struct_2E_csEdgeStruct *)ltmp_5_2);
  llvm_cbe_tmpcast2 = &ltmp_6_1->field0;
  *(&gCSEdgeTableSize) = llvm_cbe_tmp;
  ltmp_7_2 = memset(llvm_cbe_tmpcast2, (((unsigned int )(unsigned char )((unsigned char )0))), (((unsigned long long )(unsigned int )(llvm_cbe_numElems_0 * ((unsigned int )160)))));
  if ((llvm_cbe_numElems_0 == ((unsigned int )0))) {
    goto llvm_cbe_bb312;
  } else {
    goto llvm_cbe_bb187_preheader;
  }

llvm_cbe_bb187_preheader:
  llvm_cbe_tmp195196 = ((unsigned long long )(unsigned int )llvm_cbe_validOffSet);
  llvm_cbe_tmp205206 = ((unsigned long long )(unsigned int )llvm_cbe_keyOffSet);
  llvm_cbe_key230233 = ((unsigned char *)(&llvm_cbe_key230));
  if ((llvm_cbe_tmp == ((unsigned int )0))) {
    llvm_cbe_i176_0_reg2mem_0_us__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb187_us;
  } else {
    llvm_cbe_i176_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb187;
  }

  do {     /* Syntactic loop 'bb187.us' to make GCC happy */
llvm_cbe_bb187_us:
  llvm_cbe_i176_0_reg2mem_0_us = llvm_cbe_i176_0_reg2mem_0_us__PHI_TEMPORARY;
  llvm_cbe_tmp190192_us = ((unsigned long long )(unsigned int )(llvm_cbe_i176_0_reg2mem_0_us * ((unsigned int )80)));
  llvm_cbe_tmp199_us = *(&llvm_cbe_basePtr_0[((signed long long )(llvm_cbe_tmp190192_us + llvm_cbe_tmp195196))]);
  if ((llvm_cbe_tmp199_us == ((unsigned char )1))) {
    goto llvm_cbe_cond_true203_us;
  } else {
    goto llvm_cbe_cond_next303_us;
  }

llvm_cbe_cond_next303_us:
  llvm_cbe_indvar_next = llvm_cbe_i176_0_reg2mem_0_us + ((unsigned int )1);
  if ((llvm_cbe_indvar_next == llvm_cbe_numElems_0)) {
    goto llvm_cbe_bb312;
  } else {
    llvm_cbe_i176_0_reg2mem_0_us__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb187_us;
  }

llvm_cbe_cond_true203_us:
  llvm_cbe_tmp210_us = *(((unsigned long long *)(&llvm_cbe_basePtr_0[((signed long long )(llvm_cbe_tmp190192_us + llvm_cbe_tmp205206))])));
  *(&llvm_cbe_key230) = llvm_cbe_tmp210_us;
  ltmp_8_4 = APHash(llvm_cbe_key230233);
  llvm_cbe_tmp240_us = *(&gNumHashFind);
  *(&gNumHashFind) = (llvm_cbe_tmp240_us + ((unsigned long long )1ll));
  ltmp_9_2 = memcpy(((unsigned char *)/*NULL*/0), (&llvm_cbe_basePtr_0[((signed long long )llvm_cbe_tmp190192_us)]), ((unsigned long long )80ll));
  goto llvm_cbe_cond_next303_us;

  } while (1); /* end of syntactic loop 'bb187.us' */
  do {     /* Syntactic loop 'bb187' to make GCC happy */
llvm_cbe_bb187:
  llvm_cbe_i176_0_reg2mem_0 = llvm_cbe_i176_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_tmp190192 = ((unsigned long long )(unsigned int )(llvm_cbe_i176_0_reg2mem_0 * ((unsigned int )80)));
  llvm_cbe_tmp193 = &llvm_cbe_basePtr_0[((signed long long )llvm_cbe_tmp190192)];
  llvm_cbe_tmp199 = *(&llvm_cbe_basePtr_0[((signed long long )(llvm_cbe_tmp190192 + llvm_cbe_tmp195196))]);
  if ((llvm_cbe_tmp199 == ((unsigned char )1))) {
    goto llvm_cbe_cond_true203;
  } else {
    goto llvm_cbe_cond_next303;
  }

llvm_cbe_cond_next303:
  llvm_cbe_indvar_next467 = llvm_cbe_i176_0_reg2mem_0 + ((unsigned int )1);
  if ((llvm_cbe_indvar_next467 == llvm_cbe_numElems_0)) {
    goto llvm_cbe_bb312;
  } else {
    llvm_cbe_i176_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_indvar_next467;   /* for PHI node */
    goto llvm_cbe_bb187;
  }

llvm_cbe_bb297_loopexit:
  llvm_cbe_gNumConflicts_tmp_1 = llvm_cbe_gNumConflicts_tmp_1__PHI_TEMPORARY;
  llvm_cbe_tmp175_0_ph = llvm_cbe_tmp175_0_ph__PHI_TEMPORARY;
  *(&gNumConflicts) = llvm_cbe_gNumConflicts_tmp_1;
  ltmp_10_2 = memcpy(llvm_cbe_tmp175_0_ph, llvm_cbe_tmp193, ((unsigned long long )80ll));
  goto llvm_cbe_cond_next303;

  do {     /* Syntactic loop 'bb242' to make GCC happy */
llvm_cbe_bb242:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_tmp234_pn = llvm_cbe_tmp234_pn__PHI_TEMPORARY;
  llvm_cbe_i225_0_reg2mem_0 = ((unsigned int )llvm_cbe_indvar);
  llvm_cbe_gNumConflicts_tmp_0 = llvm_cbe_indvar + llvm_cbe_gNumConflicts_promoted;
  llvm_cbe_hashVal229_0_reg2mem_0 = ((unsigned int )(((unsigned int )llvm_cbe_tmp234_pn) % ((unsigned int )llvm_cbe_tmp)));
  llvm_cbe_tmp245247 = ((unsigned long long )(unsigned int )(llvm_cbe_hashVal229_0_reg2mem_0 * ((unsigned int )80)));
  llvm_cbe_tmp248 = &llvm_cbe_tmpcast2[((signed long long )llvm_cbe_tmp245247)];
  llvm_cbe_tmp259 = *(&llvm_cbe_tmpcast2[((signed long long )(llvm_cbe_tmp245247 + llvm_cbe_tmp195196))]);
  if ((llvm_cbe_tmp259 == ((unsigned char )0))) {
    llvm_cbe_gNumConflicts_tmp_1__PHI_TEMPORARY = llvm_cbe_gNumConflicts_tmp_0;   /* for PHI node */
    llvm_cbe_tmp175_0_ph__PHI_TEMPORARY = llvm_cbe_tmp248;   /* for PHI node */
    goto llvm_cbe_bb297_loopexit;
  } else {
    goto llvm_cbe_cond_next267;
  }

llvm_cbe_cond_next278:
  llvm_cbe_tmp280 = llvm_cbe_gNumConflicts_tmp_0 + ((unsigned long long )1ll);
  llvm_cbe_tmp282 = llvm_cbe_hashVal229_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_indvar_next464 = llvm_cbe_indvar + ((unsigned long long )1ll);
  if ((((unsigned int )(llvm_cbe_i225_0_reg2mem_0 + ((unsigned int )1))) < ((unsigned int )llvm_cbe_tmp))) {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next464;   /* for PHI node */
    llvm_cbe_tmp234_pn__PHI_TEMPORARY = llvm_cbe_tmp282;   /* for PHI node */
    goto llvm_cbe_bb242;
  } else {
    llvm_cbe_gNumConflicts_tmp_1__PHI_TEMPORARY = llvm_cbe_tmp280;   /* for PHI node */
    llvm_cbe_tmp175_0_ph__PHI_TEMPORARY = ((unsigned char *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_bb297_loopexit;
  }

llvm_cbe_cond_next267:
  llvm_cbe_tmp269 = *(((unsigned long long *)(&llvm_cbe_tmpcast2[((signed long long )(llvm_cbe_tmp245247 + llvm_cbe_tmp205206))])));
  if ((llvm_cbe_tmp269 == llvm_cbe_tmp210)) {
    llvm_cbe_gNumConflicts_tmp_1__PHI_TEMPORARY = llvm_cbe_gNumConflicts_tmp_0;   /* for PHI node */
    llvm_cbe_tmp175_0_ph__PHI_TEMPORARY = llvm_cbe_tmp248;   /* for PHI node */
    goto llvm_cbe_bb297_loopexit;
  } else {
    goto llvm_cbe_cond_next278;
  }

  } while (1); /* end of syntactic loop 'bb242' */
llvm_cbe_cond_true203:
  llvm_cbe_tmp210 = *(((unsigned long long *)(&llvm_cbe_basePtr_0[((signed long long )(llvm_cbe_tmp190192 + llvm_cbe_tmp205206))])));
  *(&llvm_cbe_key230) = llvm_cbe_tmp210;
  llvm_cbe_tmp234 = APHash(llvm_cbe_key230233);
  llvm_cbe_tmp240 = *(&gNumHashFind);
  *(&gNumHashFind) = (llvm_cbe_tmp240 + ((unsigned long long )1ll));
  llvm_cbe_gNumConflicts_promoted = *(&gNumConflicts);
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
  llvm_cbe_tmp234_pn__PHI_TEMPORARY = llvm_cbe_tmp234;   /* for PHI node */
  goto llvm_cbe_bb242;

  } while (1); /* end of syntactic loop 'bb187' */
llvm_cbe_bb312:
  if (((llvm_cbe_numElems_0 != ((unsigned int )0)) & (llvm_cbe_basePtr_0 != ((unsigned char *)/*NULL*/0)))) {
    goto llvm_cbe_cond_true324;
  } else {
    goto llvm_cbe_cond_next327;
  }

llvm_cbe_cond_true324:
   /*tail*/ free((((unsigned char *)llvm_cbe_basePtr_0)));
  goto llvm_cbe_cond_next327;

llvm_cbe_cond_next327:
  *(&llvm_cbe_key349) = llvm_cbe_key;
  llvm_cbe_tmp353 = APHash((((unsigned char *)(&llvm_cbe_key349))));
  llvm_cbe_tmp359 = *(&gNumHashFind);
  *(&gNumHashFind) = (llvm_cbe_tmp359 + ((unsigned long long )1ll));
  if ((llvm_cbe_tmp == ((unsigned int )0))) {
    llvm_cbe_tmp3_0__PHI_TEMPORARY = ((unsigned char *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_bb416;
  } else {
    goto llvm_cbe_bb361_preheader;
  }

llvm_cbe_bb361_preheader:
  llvm_cbe_tmp374375 = ((unsigned long long )(unsigned int )llvm_cbe_validOffSet);
  llvm_cbe_tmp369370 = ((unsigned long long )(unsigned int )llvm_cbe_keyOffSet);
  llvm_cbe_gNumConflicts_promoted460 = *(&gNumConflicts);
  llvm_cbe_indvar469__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
  llvm_cbe_tmp353_pn__PHI_TEMPORARY = llvm_cbe_tmp353;   /* for PHI node */
  goto llvm_cbe_bb361;

  do {     /* Syntactic loop 'bb361' to make GCC happy */
llvm_cbe_bb361:
  llvm_cbe_indvar469 = llvm_cbe_indvar469__PHI_TEMPORARY;
  llvm_cbe_tmp353_pn = llvm_cbe_tmp353_pn__PHI_TEMPORARY;
  llvm_cbe_i344_0_reg2mem_0 = ((unsigned int )llvm_cbe_indvar469);
  llvm_cbe_gNumConflicts_tmp_0461 = llvm_cbe_indvar469 + llvm_cbe_gNumConflicts_promoted460;
  llvm_cbe_hashVal348_0_reg2mem_0 = ((unsigned int )(((unsigned int )llvm_cbe_tmp353_pn) % ((unsigned int )llvm_cbe_tmp)));
  llvm_cbe_tmp364366 = ((unsigned long long )(unsigned int )(llvm_cbe_hashVal348_0_reg2mem_0 * ((unsigned int )80)));
  llvm_cbe_tmp367 = &llvm_cbe_tmpcast2[((signed long long )llvm_cbe_tmp364366)];
  llvm_cbe_tmp378 = *(&llvm_cbe_tmpcast2[((signed long long )(llvm_cbe_tmp364366 + llvm_cbe_tmp374375))]);
  if ((llvm_cbe_tmp378 == ((unsigned char )0))) {
    llvm_cbe_gNumConflicts_tmp_1462__PHI_TEMPORARY = llvm_cbe_gNumConflicts_tmp_0461;   /* for PHI node */
    llvm_cbe_tmp3_0_ph__PHI_TEMPORARY = llvm_cbe_tmp367;   /* for PHI node */
    goto llvm_cbe_bb416_loopexit;
  } else {
    goto llvm_cbe_cond_next386;
  }

llvm_cbe_cond_next397:
  llvm_cbe_tmp399 = llvm_cbe_gNumConflicts_tmp_0461 + ((unsigned long long )1ll);
  llvm_cbe_tmp401 = llvm_cbe_hashVal348_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_indvar_next470 = llvm_cbe_indvar469 + ((unsigned long long )1ll);
  if ((((unsigned int )(llvm_cbe_i344_0_reg2mem_0 + ((unsigned int )1))) < ((unsigned int )llvm_cbe_tmp))) {
    llvm_cbe_indvar469__PHI_TEMPORARY = llvm_cbe_indvar_next470;   /* for PHI node */
    llvm_cbe_tmp353_pn__PHI_TEMPORARY = llvm_cbe_tmp401;   /* for PHI node */
    goto llvm_cbe_bb361;
  } else {
    llvm_cbe_gNumConflicts_tmp_1462__PHI_TEMPORARY = llvm_cbe_tmp399;   /* for PHI node */
    llvm_cbe_tmp3_0_ph__PHI_TEMPORARY = ((unsigned char *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_bb416_loopexit;
  }

llvm_cbe_cond_next386:
  llvm_cbe_tmp388 = *(((unsigned long long *)(&llvm_cbe_tmpcast2[((signed long long )(llvm_cbe_tmp364366 + llvm_cbe_tmp369370))])));
  if ((llvm_cbe_tmp388 == llvm_cbe_key)) {
    llvm_cbe_gNumConflicts_tmp_1462__PHI_TEMPORARY = llvm_cbe_gNumConflicts_tmp_0461;   /* for PHI node */
    llvm_cbe_tmp3_0_ph__PHI_TEMPORARY = llvm_cbe_tmp367;   /* for PHI node */
    goto llvm_cbe_bb416_loopexit;
  } else {
    goto llvm_cbe_cond_next397;
  }

  } while (1); /* end of syntactic loop 'bb361' */
llvm_cbe_bb416_loopexit:
  llvm_cbe_gNumConflicts_tmp_1462 = llvm_cbe_gNumConflicts_tmp_1462__PHI_TEMPORARY;
  llvm_cbe_tmp3_0_ph = llvm_cbe_tmp3_0_ph__PHI_TEMPORARY;
  *(&gNumConflicts) = llvm_cbe_gNumConflicts_tmp_1462;
  llvm_cbe_tmp3_0__PHI_TEMPORARY = llvm_cbe_tmp3_0_ph;   /* for PHI node */
  goto llvm_cbe_bb416;

llvm_cbe_bb416:
  llvm_cbe_tmp3_0 = llvm_cbe_tmp3_0__PHI_TEMPORARY;
  *(&llvm_cbe_tmp3_0[((signed long long )(((unsigned long long )(unsigned int )llvm_cbe_validOffSet)))]) = ((unsigned char )1);
  *(((unsigned long long *)(&llvm_cbe_tmp3_0[((signed long long )(((unsigned long long )(unsigned int )llvm_cbe_keyOffSet)))]))) = llvm_cbe_key;
  *(&gCSEdgeTable) = ltmp_6_1;
  return llvm_cbe_tmp3_0;
llvm_cbe_UnifiedReturnBlock:
  return llvm_cbe_tmp1_0;
}


static void CallEdgeProfiler(unsigned int llvm_cbe_functionId, unsigned int llvm_cbe_callSiteId, unsigned int llvm_cbe_calleeId) {
  bool llvm_cbe_tmp_b;
  unsigned int llvm_cbe_tmp;
  unsigned int llvm_cbe_tmp9_rle;
  unsigned int llvm_cbe_tmp9_rle__PHI_TEMPORARY;
  bool llvm_cbe_tmp10_b;
  unsigned char *llvm_cbe_tmp13;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp1314;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp1518;
  unsigned int *llvm_cbe_tmp19;
  unsigned int llvm_cbe_tmp20;
  unsigned int *llvm_cbe_tmp31;
  unsigned int llvm_cbe_tmp32;
  unsigned int llvm_cbe_tmp63;

  llvm_cbe_tmp_b = *(&gCSEdgeValidOffset_2E_b);
  llvm_cbe_tmp = ((llvm_cbe_tmp_b) ? (((unsigned int )0)) : (((unsigned int )1000000)));
  if ((llvm_cbe_tmp == ((unsigned int )1000000))) {
    goto llvm_cbe_cond_true;
  } else {
    llvm_cbe_tmp9_rle__PHI_TEMPORARY = llvm_cbe_tmp;   /* for PHI node */
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_true:
  *(&gCSEdgeValidOffset_2E_b) = ((1) & 1);
  *(&gCSEdgeKeyOffset_2E_b) = ((1) & 1);
  llvm_cbe_tmp9_rle__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_cond_next;

llvm_cbe_cond_next:
  llvm_cbe_tmp9_rle = llvm_cbe_tmp9_rle__PHI_TEMPORARY;
  llvm_cbe_tmp10_b = *(&gCSEdgeKeyOffset_2E_b);
  llvm_cbe_tmp13 =  /*tail*/ hash_insert((((((unsigned long long )(unsigned int )llvm_cbe_functionId)) << ((unsigned long long )32ll)) | (((unsigned long long )(unsigned int )llvm_cbe_callSiteId))), (((llvm_cbe_tmp10_b) ? (((unsigned int )8)) : (((unsigned int )1000000)))), llvm_cbe_tmp9_rle);
  llvm_cbe_tmp1314 = ((struct l_struct_2E_csEdgeStruct *)llvm_cbe_tmp13);
  llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_tmp1518 = ((unsigned long long )(unsigned int )llvm_cbe_i_0_reg2mem_0);
  llvm_cbe_tmp19 = &llvm_cbe_tmp1314->field2[((signed long long )llvm_cbe_tmp1518)];
  llvm_cbe_tmp20 = *llvm_cbe_tmp19;
  if ((llvm_cbe_tmp20 == llvm_cbe_calleeId)) {
    goto llvm_cbe_cond_true25;
  } else {
    goto llvm_cbe_cond_next39;
  }

llvm_cbe_cond_next61:
  llvm_cbe_tmp63 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  if ((((unsigned int )llvm_cbe_tmp63) < ((unsigned int )((unsigned int )8)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp63;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_bb69;
  }

llvm_cbe_cond_next39:
  if ((llvm_cbe_tmp20 == ((unsigned int )0))) {
    goto llvm_cbe_cond_true49;
  } else {
    goto llvm_cbe_cond_next61;
  }

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_cond_true25:
  llvm_cbe_tmp31 = &llvm_cbe_tmp1314->field3[((signed long long )llvm_cbe_tmp1518)];
  llvm_cbe_tmp32 = *llvm_cbe_tmp31;
  *llvm_cbe_tmp31 = (llvm_cbe_tmp32 + ((unsigned int )1));
  return;
llvm_cbe_cond_true49:
  *llvm_cbe_tmp19 = llvm_cbe_calleeId;
  *(&llvm_cbe_tmp1314->field3[((signed long long )llvm_cbe_tmp1518)]) = ((unsigned int )1);
  return;
llvm_cbe_bb69:
   /*tail*/ __assert_fail((&(_2E_str[((signed long long )((unsigned long long )0ll))])), (&(_2E_str1[((signed long long )((unsigned long long )0ll))])), ((unsigned int )95), (&(__PRETTY_FUNCTION___2E_2597[((signed int )((unsigned int )0))])));
  /*UNREACHABLE*/;
}


static void CallProfPrinter(void) {
  struct l_struct_2E_FILE *llvm_cbe_tmp2;
  unsigned int llvm_cbe_tmp7997;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp3100;
  unsigned char *llvm_cbe_tmp7273;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp11_rle;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp11_rle__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp3_reg2mem_0;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp3_reg2mem_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp45;
  unsigned char llvm_cbe_tmp8;
  unsigned long long llvm_cbe_tmp16;
  unsigned int llvm_cbe_tmp28;
  unsigned int llvm_cbe_j_0_reg2mem_0;
  unsigned int llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp30;
  unsigned long long llvm_cbe_tmp3436;
  unsigned int llvm_cbe_tmp38;
  unsigned int llvm_cbe_tmp51;
  unsigned int llvm_cbe_tmp63;
  unsigned int llvm_cbe_tmp65;
  unsigned int llvm_cbe_tmp74;
  unsigned int llvm_cbe_tmp77;
  unsigned int llvm_cbe_tmp79;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp3;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp3_reg2mem_1;
  struct l_struct_2E_csEdgeStruct *llvm_cbe_tmp3_reg2mem_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp88;

  llvm_cbe_tmp2 =  /*tail*/ fopen((&(_2E_str2[((signed long long )((unsigned long long )0ll))])), (&(_2E_str3[((signed long long )((unsigned long long )0ll))])));
  llvm_cbe_tmp7997 = *(&gCSEdgeTableSize);
  llvm_cbe_tmp3100 = *(&gCSEdgeTable);
  if ((llvm_cbe_tmp7997 == ((unsigned int )0))) {
    llvm_cbe_tmp3_reg2mem_1__PHI_TEMPORARY = llvm_cbe_tmp3100;   /* for PHI node */
    goto llvm_cbe_bb84;
  } else {
    goto llvm_cbe_bb_preheader;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp7273 = ((unsigned char *)llvm_cbe_tmp2);
  llvm_cbe_tmp11_rle__PHI_TEMPORARY = llvm_cbe_tmp3100;   /* for PHI node */
  llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_tmp3_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp3100;   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_tmp11_rle = llvm_cbe_tmp11_rle__PHI_TEMPORARY;
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_tmp3_reg2mem_0 = llvm_cbe_tmp3_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_tmp45 = ((unsigned long long )(unsigned int )llvm_cbe_i_0_reg2mem_0);
  llvm_cbe_tmp8 = *(&llvm_cbe_tmp3_reg2mem_0[((signed long long )llvm_cbe_tmp45)].field0);
  if ((llvm_cbe_tmp8 == ((unsigned char )0))) {
    goto llvm_cbe_bb78;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_bb78:
  llvm_cbe_tmp77 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp79 = *(&gCSEdgeTableSize);
  llvm_cbe_tmp3 = *(&gCSEdgeTable);
  if ((((unsigned int )llvm_cbe_tmp77) < ((unsigned int )llvm_cbe_tmp79))) {
    llvm_cbe_tmp11_rle__PHI_TEMPORARY = llvm_cbe_tmp3;   /* for PHI node */
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp77;   /* for PHI node */
    llvm_cbe_tmp3_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp3;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_tmp3_reg2mem_1__PHI_TEMPORARY = llvm_cbe_tmp3;   /* for PHI node */
    goto llvm_cbe_bb84;
  }

llvm_cbe_bb71:
  llvm_cbe_tmp74 =  /*tail*/ fputc(((unsigned int )10), llvm_cbe_tmp7273);
  goto llvm_cbe_bb78;

  do {     /* Syntactic loop 'bb29' to make GCC happy */
llvm_cbe_bb29:
  llvm_cbe_j_0_reg2mem_0 = llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_tmp30 = *(&gCSEdgeTable);
  llvm_cbe_tmp3436 = ((unsigned long long )(unsigned int )llvm_cbe_j_0_reg2mem_0);
  llvm_cbe_tmp38 = *(&llvm_cbe_tmp30[((signed long long )llvm_cbe_tmp45)].field2[((signed long long )llvm_cbe_tmp3436)]);
  if ((llvm_cbe_tmp38 == ((unsigned int )0))) {
    goto llvm_cbe_bb71;
  } else {
    goto llvm_cbe_cond_true42;
  }

llvm_cbe_cond_true42:
  llvm_cbe_tmp51 = *(&llvm_cbe_tmp30[((signed long long )llvm_cbe_tmp45)].field3[((signed long long )llvm_cbe_tmp3436)]);
  llvm_cbe_tmp63 =  /*tail*/ fprintf(llvm_cbe_tmp2, (&(_2E_str5[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp38, llvm_cbe_tmp51);
  llvm_cbe_tmp65 = llvm_cbe_j_0_reg2mem_0 + ((unsigned int )1);
  if ((((unsigned int )llvm_cbe_tmp65) < ((unsigned int )((unsigned int )8)))) {
    llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp65;   /* for PHI node */
    goto llvm_cbe_bb29;
  } else {
    goto llvm_cbe_bb71;
  }

  } while (1); /* end of syntactic loop 'bb29' */
llvm_cbe_cond_true:
  llvm_cbe_tmp16 = *(&llvm_cbe_tmp11_rle[((signed long long )llvm_cbe_tmp45)].field1);
  llvm_cbe_tmp28 =  /*tail*/ fprintf(llvm_cbe_tmp2, (&(_2E_str4[((signed long long )((unsigned long long )0ll))])), (((unsigned int )(((unsigned long long )(((unsigned long long )llvm_cbe_tmp16) >> ((unsigned long long )((unsigned long long )32ll))))))), (((unsigned int )llvm_cbe_tmp16)));
  llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb29;

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_bb84:
  llvm_cbe_tmp3_reg2mem_1 = llvm_cbe_tmp3_reg2mem_1__PHI_TEMPORARY;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp3_reg2mem_1)));
  llvm_cbe_tmp88 =  /*tail*/ fclose(llvm_cbe_tmp2);
  return;
}


static unsigned int APHash(unsigned char *llvm_cbe_str) {
  unsigned long long llvm_cbe_str_addr_0_reg2mem_0_rec;
  unsigned long long llvm_cbe_str_addr_0_reg2mem_0_rec__PHI_TEMPORARY;
  unsigned int llvm_cbe_hash_0_reg2mem_0;
  unsigned int llvm_cbe_hash_0_reg2mem_0__PHI_TEMPORARY;
  unsigned char *llvm_cbe_str_addr_0_reg2mem_0;
  unsigned char llvm_cbe_tmp8;
  unsigned int llvm_cbe_tmp13;
  unsigned char llvm_cbe_tmp17;
  unsigned int llvm_cbe_tmp22not;
  unsigned int llvm_cbe_iftmp_17_0;
  unsigned int llvm_cbe_iftmp_17_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp25;
  unsigned long long llvm_cbe_indvar_next;

  llvm_cbe_str_addr_0_reg2mem_0_rec__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
  llvm_cbe_hash_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )-1431655766);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_str_addr_0_reg2mem_0_rec = llvm_cbe_str_addr_0_reg2mem_0_rec__PHI_TEMPORARY;
  llvm_cbe_hash_0_reg2mem_0 = llvm_cbe_hash_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_str_addr_0_reg2mem_0 = &llvm_cbe_str[((signed long long )llvm_cbe_str_addr_0_reg2mem_0_rec)];
  if (((llvm_cbe_str_addr_0_reg2mem_0_rec & ((unsigned long long )1ll)) == ((unsigned long long )0ll))) {
    goto llvm_cbe_cond_true;
  } else {
    goto llvm_cbe_cond_false;
  }

llvm_cbe_bb30:
  llvm_cbe_iftmp_17_0 = llvm_cbe_iftmp_17_0__PHI_TEMPORARY;
  llvm_cbe_tmp25 = llvm_cbe_iftmp_17_0 ^ llvm_cbe_hash_0_reg2mem_0;
  llvm_cbe_indvar_next = llvm_cbe_str_addr_0_reg2mem_0_rec + ((unsigned long long )1ll);
  if ((llvm_cbe_indvar_next == ((unsigned long long )8ll))) {
    goto llvm_cbe_bb36;
  } else {
    llvm_cbe_str_addr_0_reg2mem_0_rec__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    llvm_cbe_hash_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp25;   /* for PHI node */
    goto llvm_cbe_bb;
  }

llvm_cbe_cond_true:
  llvm_cbe_tmp8 = *llvm_cbe_str_addr_0_reg2mem_0;
  llvm_cbe_tmp13 = ((((signed int )(signed char )llvm_cbe_tmp8)) * (((unsigned int )(((unsigned int )llvm_cbe_hash_0_reg2mem_0) >> ((unsigned int )((unsigned int )3)))))) ^ (llvm_cbe_hash_0_reg2mem_0 << ((unsigned int )7));
  llvm_cbe_iftmp_17_0__PHI_TEMPORARY = llvm_cbe_tmp13;   /* for PHI node */
  goto llvm_cbe_bb30;

llvm_cbe_cond_false:
  llvm_cbe_tmp17 = *llvm_cbe_str_addr_0_reg2mem_0;
  llvm_cbe_tmp22not = (((((signed int )(signed char )llvm_cbe_tmp17)) ^ (((unsigned int )(((unsigned int )llvm_cbe_hash_0_reg2mem_0) >> ((unsigned int )((unsigned int )5)))))) + (llvm_cbe_hash_0_reg2mem_0 << ((unsigned int )11))) ^ ((unsigned int )-1);
  llvm_cbe_iftmp_17_0__PHI_TEMPORARY = llvm_cbe_tmp22not;   /* for PHI node */
  goto llvm_cbe_bb30;

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_bb36:
  return llvm_cbe_tmp25;
}


static void LBM_initializeGrid(double *llvm_cbe_grid) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp;
  unsigned int llvm_cbe_indvar_next;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )1);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )1));
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )8);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )8));
  llvm_cbe_tmp = llvm_cbe_indvar * ((unsigned int )20);
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-400000)))))]) = 0x1.5555555555555p-2;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399999)))))]) = 0x1.c71c71c71c71cp-5;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399998)))))]) = 0x1.c71c71c71c71cp-5;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399997)))))]) = 0x1.c71c71c71c71cp-5;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399996)))))]) = 0x1.c71c71c71c71cp-5;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399995)))))]) = 0x1.c71c71c71c71cp-5;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399994)))))]) = 0x1.c71c71c71c71cp-5;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399993)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399992)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399991)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399990)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399989)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399988)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399987)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399986)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399985)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399984)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399983)))))]) = 0x1.c71c71c71c71cp-6;
  *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399982)))))]) = 0x1.c71c71c71c71cp-6;
  *(((unsigned int *)(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp + ((unsigned int )-399981)))))]))) = ((unsigned int )0);
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next == ((unsigned int )1340000))) {
    goto llvm_cbe_return;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb;
  }

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void LBM_loadObstacleFile(double *llvm_cbe_grid, unsigned char *llvm_cbe_filename) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  struct l_struct_2E_FILE *llvm_cbe_tmp2;
  unsigned int llvm_cbe_z_0_reg2mem_0_ph;
  unsigned int llvm_cbe_z_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp12;
  unsigned int llvm_cbe_y_064_us;
  unsigned int llvm_cbe_y_064_us__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_tmp662_us;
  unsigned int llvm_cbe_tmp13_us;
  unsigned int llvm_cbe_indvar_next68;
  unsigned int llvm_cbe_tmp6_us;
  unsigned int llvm_cbe_indvar_next;
  unsigned int *llvm_cbe_tmp2021_us;
  unsigned int llvm_cbe_tmp23_us;
  unsigned int llvm_cbe_x_060_us;
  unsigned int llvm_cbe_x_060_us__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp663_us;
  unsigned int llvm_cbe_tmp663_us__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_tmp45;
  unsigned int llvm_cbe_indvar_next70;
  unsigned int llvm_cbe_tmp55;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )2);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )2));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )2);
  llvm_cbe_tmp2 =  /*tail*/ fopen(llvm_cbe_filename, (&(_2E_str17[((signed long long )((unsigned long long )0ll))])));
  llvm_cbe_z_0_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb38_outer;

  do {     /* Syntactic loop 'bb38.outer' to make GCC happy */
llvm_cbe_bb38_outer:
  llvm_cbe_z_0_reg2mem_0_ph = llvm_cbe_z_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )9);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )9));
  llvm_cbe_tmp12 = llvm_cbe_z_0_reg2mem_0_ph * ((unsigned int )10000);
  llvm_cbe_y_064_us__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb28_preheader_us;

llvm_cbe_bb43:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )9);
  llvm_cbe_tmp45 =  /*tail*/ fgetc(llvm_cbe_tmp2);
  llvm_cbe_indvar_next70 = llvm_cbe_z_0_reg2mem_0_ph + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next70 == ((unsigned int )130))) {
    goto llvm_cbe_bb53;
  } else {
    llvm_cbe_z_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_indvar_next70;   /* for PHI node */
    goto llvm_cbe_bb38_outer;
  }

  do {     /* Syntactic loop 'bb28.preheader.us' to make GCC happy */
llvm_cbe_bb28_preheader_us:
  llvm_cbe_y_064_us = llvm_cbe_y_064_us__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )10);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )10));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )10);
  llvm_cbe_tmp662_us =  /*tail*/ fgetc(llvm_cbe_tmp2);
  llvm_cbe_tmp13_us = (llvm_cbe_y_064_us * ((unsigned int )100)) + llvm_cbe_tmp12;
  llvm_cbe_x_060_us__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_tmp663_us__PHI_TEMPORARY = llvm_cbe_tmp662_us;   /* for PHI node */
  goto llvm_cbe_bb4_us;

llvm_cbe_bb33_us:
  llvm_cbe_indvar_next68 = llvm_cbe_y_064_us + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_indvar_next68 == ((unsigned int )100))) {
    goto llvm_cbe_bb43;
  } else {
    llvm_cbe_y_064_us__PHI_TEMPORARY = llvm_cbe_indvar_next68;   /* for PHI node */
    goto llvm_cbe_bb28_preheader_us;
  }

  do {     /* Syntactic loop 'bb4.us' to make GCC happy */
llvm_cbe_bb4_us:
  llvm_cbe_x_060_us = llvm_cbe_x_060_us__PHI_TEMPORARY;
  llvm_cbe_tmp663_us = llvm_cbe_tmp663_us__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )11);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )11));
  if ((llvm_cbe_tmp663_us == ((unsigned int )46))) {
    goto llvm_cbe_cond_next_us;
  } else {
    goto llvm_cbe_cond_true_us;
  }

llvm_cbe_cond_next_us:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )11);
  llvm_cbe_tmp6_us =  /*tail*/ fgetc(llvm_cbe_tmp2);
  llvm_cbe_indvar_next = llvm_cbe_x_060_us + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((llvm_cbe_indvar_next == ((unsigned int )100))) {
    goto llvm_cbe_bb33_us;
  } else {
    llvm_cbe_x_060_us__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    llvm_cbe_tmp663_us__PHI_TEMPORARY = llvm_cbe_tmp6_us;   /* for PHI node */
    goto llvm_cbe_bb4_us;
  }

llvm_cbe_cond_true_us:
  llvm_cbe_tmp2021_us = ((unsigned int *)(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(((llvm_cbe_tmp13_us + llvm_cbe_x_060_us) * ((unsigned int )20)) + ((unsigned int )19)))))]));
  llvm_cbe_tmp23_us = *llvm_cbe_tmp2021_us;
  *llvm_cbe_tmp2021_us = (llvm_cbe_tmp23_us | ((unsigned int )1));
  goto llvm_cbe_cond_next_us;

  } while (1); /* end of syntactic loop 'bb4.us' */
  } while (1); /* end of syntactic loop 'bb28.preheader.us' */
  } while (1); /* end of syntactic loop 'bb38.outer' */
llvm_cbe_bb53:
  *(&cg_caller_call_site_var) = ((unsigned int )4);
  *(&cg_caller_id_var) = ((unsigned int )2);
  llvm_cbe_tmp55 =  /*tail*/ fclose(llvm_cbe_tmp2);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void LBM_initializeSpecialCellsForLDC(double *llvm_cbe_grid) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_indvar211;
  unsigned int llvm_cbe_indvar211__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp40;
  unsigned int llvm_cbe_indvar206;
  unsigned int llvm_cbe_indvar206__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0;
  unsigned int *llvm_cbe_tmp4849;
  unsigned int llvm_cbe_tmp51;
  unsigned int llvm_cbe_indvar_next207;
  unsigned int *llvm_cbe_tmp104105;
  unsigned int llvm_cbe_tmp107;
  unsigned int llvm_cbe_tmp115;
  unsigned int llvm_cbe_x_0;
  unsigned int llvm_cbe_x_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_indvar200;
  unsigned int llvm_cbe_indvar200__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0_us;
  unsigned int *llvm_cbe_tmp4849_us;
  unsigned int llvm_cbe_tmp51_us;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0_us168;
  unsigned int *llvm_cbe_tmp4849_us175;
  unsigned int llvm_cbe_tmp51_us176;
  unsigned int llvm_cbe_indvar_next210;
  unsigned int llvm_cbe_y_0191;
  unsigned int llvm_cbe_y_0191__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_tmp41;
  unsigned int llvm_cbe_indvar_next212;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )3);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )3));
  llvm_cbe_indvar211__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb124_outer;

  do {     /* Syntactic loop 'bb124.outer' to make GCC happy */
llvm_cbe_bb124_outer:
  llvm_cbe_indvar211 = llvm_cbe_indvar211__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )12);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )12));
  llvm_cbe_tmp40 = (llvm_cbe_indvar211 * ((unsigned int )10000)) + ((unsigned int )-20000);
  llvm_cbe_y_0191__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb116_preheader;

llvm_cbe_bb129:
  llvm_cbe_indvar_next212 = llvm_cbe_indvar211 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next212 == ((unsigned int )134))) {
    goto llvm_cbe_return_split;
  } else {
    llvm_cbe_indvar211__PHI_TEMPORARY = llvm_cbe_indvar_next212;   /* for PHI node */
    goto llvm_cbe_bb124_outer;
  }

  do {     /* Syntactic loop 'bb116.preheader' to make GCC happy */
llvm_cbe_bb116_preheader:
  llvm_cbe_y_0191 = llvm_cbe_y_0191__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )13);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )13));
  llvm_cbe_tmp41 = (llvm_cbe_y_0191 * ((unsigned int )100)) + llvm_cbe_tmp40;
  llvm_cbe_x_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb116;

llvm_cbe_bb121:
  llvm_cbe_indvar_next210 = llvm_cbe_y_0191 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_indvar_next210 == ((unsigned int )100))) {
    goto llvm_cbe_bb129;
  } else {
    llvm_cbe_y_0191__PHI_TEMPORARY = llvm_cbe_indvar_next210;   /* for PHI node */
    goto llvm_cbe_bb116_preheader;
  }

  do {     /* Syntactic loop 'bb116' to make GCC happy */
llvm_cbe_bb116:
  llvm_cbe_x_0 = llvm_cbe_x_0__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )14);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )14));
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )llvm_cbe_x_0) < ((signed int )((unsigned int )100)))) {
    goto llvm_cbe_bb2_preheader;
  } else {
    goto llvm_cbe_bb121;
  }

llvm_cbe_bb113:
  llvm_cbe_tmp115 = llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_x_0__PHI_TEMPORARY = llvm_cbe_tmp115;   /* for PHI node */
  goto llvm_cbe_bb116;

  do {     /* Syntactic loop 'bb2' to make GCC happy */
llvm_cbe_bb2:
  llvm_cbe_indvar206 = llvm_cbe_indvar206__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )15);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )15));
  llvm_cbe_x_0_reg2mem_0 = llvm_cbe_indvar206 + llvm_cbe_x_0;
  switch (llvm_cbe_x_0_reg2mem_0) {
  default:
    goto llvm_cbe_cond_next;
;
  case ((unsigned int )0):
    goto llvm_cbe_bb36;
  case ((unsigned int )99):
    goto llvm_cbe_bb36;
  }
llvm_cbe_bb36:
  llvm_cbe_tmp4849 = ((unsigned int *)(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(((llvm_cbe_tmp41 + llvm_cbe_x_0_reg2mem_0) * ((unsigned int )20)) + ((unsigned int )19)))))]));
  llvm_cbe_tmp51 = *llvm_cbe_tmp4849;
  *llvm_cbe_tmp4849 = (llvm_cbe_tmp51 | ((unsigned int )1));
  llvm_cbe_indvar_next207 = llvm_cbe_indvar206 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )(llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1))) < ((signed int )((unsigned int )100)))) {
    llvm_cbe_indvar206__PHI_TEMPORARY = llvm_cbe_indvar_next207;   /* for PHI node */
    goto llvm_cbe_bb2;
  } else {
    goto llvm_cbe_bb121;
  }

llvm_cbe_cond_next:
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  switch (llvm_cbe_indvar211) {
  default:
    goto llvm_cbe_bb113;
;
  case ((unsigned int )2):
    goto llvm_cbe_bb36;
    break;
  case ((unsigned int )131):
    goto llvm_cbe_bb36;
    break;
  case ((unsigned int )3):
    goto llvm_cbe_cond_true66;
  case ((unsigned int )130):
    goto llvm_cbe_cond_true66;
  }
  } while (1); /* end of syntactic loop 'bb2' */
llvm_cbe_bb2_preheader:
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  switch (llvm_cbe_y_0191) {
  default:
    llvm_cbe_indvar206__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb2;
;
  case ((unsigned int )0):
    llvm_cbe_indvar200__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb2_us;
    break;
  case ((unsigned int )99):
    llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb2_us167;
  }
llvm_cbe_cond_true66:
  if (((((unsigned int )(llvm_cbe_x_0_reg2mem_0 + ((unsigned int )-2))) < ((unsigned int )((unsigned int )96))) & (((unsigned int )(llvm_cbe_y_0191 + ((unsigned int )-2))) < ((unsigned int )((unsigned int )96))))) {
    goto llvm_cbe_cond_true91;
  } else {
    goto llvm_cbe_bb113;
  }

llvm_cbe_cond_true91:
  llvm_cbe_tmp104105 = ((unsigned int *)(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(((llvm_cbe_tmp41 + llvm_cbe_x_0_reg2mem_0) * ((unsigned int )20)) + ((unsigned int )19)))))]));
  llvm_cbe_tmp107 = *llvm_cbe_tmp104105;
  *llvm_cbe_tmp104105 = (llvm_cbe_tmp107 | ((unsigned int )2));
  goto llvm_cbe_bb113;

  } while (1); /* end of syntactic loop 'bb116' */
  do {     /* Syntactic loop 'bb2.us' to make GCC happy */
llvm_cbe_bb2_us:
  llvm_cbe_indvar200 = llvm_cbe_indvar200__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )16);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )16));
  llvm_cbe_x_0_reg2mem_0_us = llvm_cbe_indvar200 + llvm_cbe_x_0;
  llvm_cbe_tmp4849_us = ((unsigned int *)(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(((llvm_cbe_tmp41 + llvm_cbe_x_0_reg2mem_0_us) * ((unsigned int )20)) + ((unsigned int )19)))))]));
  llvm_cbe_tmp51_us = *llvm_cbe_tmp4849_us;
  *llvm_cbe_tmp4849_us = (llvm_cbe_tmp51_us | ((unsigned int )1));
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )(llvm_cbe_x_0_reg2mem_0_us + ((unsigned int )1))) < ((signed int )((unsigned int )100)))) {
    llvm_cbe_indvar200__PHI_TEMPORARY = (llvm_cbe_indvar200 + ((unsigned int )1));   /* for PHI node */
    goto llvm_cbe_bb2_us;
  } else {
    goto llvm_cbe_bb121;
  }

  } while (1); /* end of syntactic loop 'bb2.us' */
  do {     /* Syntactic loop 'bb2.us167' to make GCC happy */
llvm_cbe_bb2_us167:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )17);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )17));
  llvm_cbe_x_0_reg2mem_0_us168 = llvm_cbe_indvar + llvm_cbe_x_0;
  llvm_cbe_tmp4849_us175 = ((unsigned int *)(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(((llvm_cbe_tmp41 + llvm_cbe_x_0_reg2mem_0_us168) * ((unsigned int )20)) + ((unsigned int )19)))))]));
  llvm_cbe_tmp51_us176 = *llvm_cbe_tmp4849_us175;
  *llvm_cbe_tmp4849_us175 = (llvm_cbe_tmp51_us176 | ((unsigned int )1));
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )(llvm_cbe_x_0_reg2mem_0_us168 + ((unsigned int )1))) < ((signed int )((unsigned int )100)))) {
    llvm_cbe_indvar__PHI_TEMPORARY = (llvm_cbe_indvar + ((unsigned int )1));   /* for PHI node */
    goto llvm_cbe_bb2_us167;
  } else {
    goto llvm_cbe_bb121;
  }

  } while (1); /* end of syntactic loop 'bb2.us167' */
  } while (1); /* end of syntactic loop 'bb116.preheader' */
  } while (1); /* end of syntactic loop 'bb124.outer' */
llvm_cbe_return_split:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void LBM_initializeSpecialCellsForChannel(double *llvm_cbe_grid) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp27;
  unsigned int llvm_cbe_x_0128;
  unsigned int llvm_cbe_x_0128__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int *llvm_cbe_tmp3536;
  unsigned int llvm_cbe_tmp38;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_indvar_next134;
  unsigned int llvm_cbe_y_0130;
  unsigned int llvm_cbe_y_0130__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_tmp28;
  unsigned int llvm_cbe_indvar_next136;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )4);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )4));
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb104_outer;

  do {     /* Syntactic loop 'bb104.outer' to make GCC happy */
llvm_cbe_bb104_outer:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )18);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )18));
  llvm_cbe_tmp27 = (llvm_cbe_indvar * ((unsigned int )10000)) + ((unsigned int )-20000);
  llvm_cbe_y_0130__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb96_preheader;

llvm_cbe_bb109:
  llvm_cbe_indvar_next136 = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next136 == ((unsigned int )134))) {
    goto llvm_cbe_return_split;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next136;   /* for PHI node */
    goto llvm_cbe_bb104_outer;
  }

  do {     /* Syntactic loop 'bb96.preheader' to make GCC happy */
llvm_cbe_bb96_preheader:
  llvm_cbe_y_0130 = llvm_cbe_y_0130__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )19);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )19));
  llvm_cbe_tmp28 = (llvm_cbe_y_0130 * ((unsigned int )100)) + llvm_cbe_tmp27;
  llvm_cbe_x_0128__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb2;

llvm_cbe_bb101:
  llvm_cbe_indvar_next134 = llvm_cbe_y_0130 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_indvar_next134 == ((unsigned int )100))) {
    goto llvm_cbe_bb109;
  } else {
    llvm_cbe_y_0130__PHI_TEMPORARY = llvm_cbe_indvar_next134;   /* for PHI node */
    goto llvm_cbe_bb96_preheader;
  }

  do {     /* Syntactic loop 'bb2' to make GCC happy */
llvm_cbe_bb2:
  llvm_cbe_x_0128 = llvm_cbe_x_0128__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )20);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )20));
  switch (llvm_cbe_x_0128) {
  default:
    goto llvm_cbe_cond_next;
;
  case ((unsigned int )0):
    goto llvm_cbe_bb23;
  case ((unsigned int )99):
    goto llvm_cbe_bb23;
  }
llvm_cbe_bb93:
  llvm_cbe_indvar_next = llvm_cbe_x_0128 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((llvm_cbe_indvar_next == ((unsigned int )100))) {
    goto llvm_cbe_bb101;
  } else {
    llvm_cbe_x_0128__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb2;
  }

llvm_cbe_cond_next:
  switch (llvm_cbe_y_0130) {
  default:
    goto llvm_cbe_bb93;
;
  case ((unsigned int )0):
    goto llvm_cbe_bb23;
    break;
  case ((unsigned int )99):
    goto llvm_cbe_bb23;
    break;
  }
llvm_cbe_bb23:
  llvm_cbe_tmp3536 = ((unsigned int *)(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(((llvm_cbe_tmp28 + llvm_cbe_x_0128) * ((unsigned int )20)) + ((unsigned int )19)))))]));
  llvm_cbe_tmp38 = *llvm_cbe_tmp3536;
  *llvm_cbe_tmp3536 = (llvm_cbe_tmp38 | ((unsigned int )1));
  goto llvm_cbe_bb93;

  } while (1); /* end of syntactic loop 'bb2' */
  } while (1); /* end of syntactic loop 'bb96.preheader' */
  } while (1); /* end of syntactic loop 'bb104.outer' */
llvm_cbe_return_split:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void LBM_performStreamCollide(double *llvm_cbe_srcGrid, double *llvm_cbe_dstGrid) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp6;
  unsigned long long llvm_cbe_tmp1011;
  double llvm_cbe_tmp14;
  double llvm_cbe_tmp26;
  double llvm_cbe_tmp37;
  double llvm_cbe_tmp49;
  double llvm_cbe_tmp60;
  double llvm_cbe_tmp71;
  double llvm_cbe_tmp83;
  double llvm_cbe_tmp94;
  double llvm_cbe_tmp105;
  double llvm_cbe_tmp116;
  double llvm_cbe_tmp127;
  double llvm_cbe_tmp138;
  double llvm_cbe_tmp149;
  double llvm_cbe_tmp160;
  double llvm_cbe_tmp171;
  double llvm_cbe_tmp182;
  double llvm_cbe_tmp193;
  double llvm_cbe_tmp204;
  double llvm_cbe_tmp215;
  unsigned int llvm_cbe_tmp10961237;
  double *llvm_cbe_tmp228;
  double llvm_cbe_tmp229;
  double *llvm_cbe_tmp235;
  double llvm_cbe_tmp236;
  double *llvm_cbe_tmp242;
  double llvm_cbe_tmp243;
  double *llvm_cbe_tmp249;
  double llvm_cbe_tmp250;
  double *llvm_cbe_tmp256;
  double llvm_cbe_tmp257;
  double *llvm_cbe_tmp263;
  double llvm_cbe_tmp264;
  double *llvm_cbe_tmp270;
  double llvm_cbe_tmp271;
  double *llvm_cbe_tmp277;
  double llvm_cbe_tmp278;
  double *llvm_cbe_tmp284;
  double llvm_cbe_tmp285;
  double *llvm_cbe_tmp291;
  double llvm_cbe_tmp292;
  double *llvm_cbe_tmp298;
  double llvm_cbe_tmp299;
  double *llvm_cbe_tmp305;
  double llvm_cbe_tmp306;
  double *llvm_cbe_tmp312;
  double llvm_cbe_tmp313;
  double *llvm_cbe_tmp319;
  double llvm_cbe_tmp320;
  double *llvm_cbe_tmp326;
  double llvm_cbe_tmp327;
  double *llvm_cbe_tmp333;
  double llvm_cbe_tmp334;
  double *llvm_cbe_tmp340;
  double llvm_cbe_tmp341;
  double *llvm_cbe_tmp347;
  double llvm_cbe_tmp348;
  double llvm_cbe_tmp349;
  double llvm_cbe_ux_0;
  double llvm_cbe_uy_0;
  double llvm_cbe_uz_0;
  double llvm_cbe_tmp590;
  double llvm_cbe_tmp614;
  double llvm_cbe_tmp617;
  double llvm_cbe_tmp619;
  double llvm_cbe_tmp638;
  double llvm_cbe_tmp662;
  double llvm_cbe_tmp667;
  double llvm_cbe_tmp686;
  double llvm_cbe_tmp710;
  double llvm_cbe_tmp715;
  double llvm_cbe_tmp734;
  double llvm_cbe_tmp758;
  double llvm_cbe_tmp761;
  double llvm_cbe_tmp764;
  double llvm_cbe_tmp786;
  double llvm_cbe_tmp792;
  double llvm_cbe_tmp814;
  double llvm_cbe_tmp820;
  double llvm_cbe_tmp842;
  double llvm_cbe_tmp847;
  double llvm_cbe_tmp849;
  double llvm_cbe_tmp872;
  double llvm_cbe_tmp878;
  double llvm_cbe_tmp900;
  double llvm_cbe_tmp906;
  double llvm_cbe_tmp928;
  double llvm_cbe_tmp934;
  double llvm_cbe_tmp956;
  double llvm_cbe_tmp963;
  double llvm_cbe_tmp986;
  double llvm_cbe_tmp992;
  double llvm_cbe_tmp1015;
  double llvm_cbe_tmp1021;
  double llvm_cbe_tmp1043;
  double llvm_cbe_tmp1049;
  double llvm_cbe_tmp1071;
  double llvm_cbe_tmp1078;
  unsigned int llvm_cbe_tmp1096;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )5);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )5));
  llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )21);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )21));
  llvm_cbe_tmp6 = *(((unsigned int *)(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )19)))))])));
  llvm_cbe_tmp1011 = ((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0);
  llvm_cbe_tmp14 = *(&llvm_cbe_srcGrid[((signed long long )llvm_cbe_tmp1011)]);
  if (((llvm_cbe_tmp6 & ((unsigned int )1)) == ((unsigned int )0))) {
    goto llvm_cbe_cond_next;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_cond_true:
  *(&llvm_cbe_dstGrid[((signed long long )llvm_cbe_tmp1011)]) = llvm_cbe_tmp14;
  llvm_cbe_tmp26 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-1998)))))]) = llvm_cbe_tmp26;
  llvm_cbe_tmp37 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )2)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )2001)))))]) = llvm_cbe_tmp37;
  llvm_cbe_tmp49 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )3)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-16)))))]) = llvm_cbe_tmp49;
  llvm_cbe_tmp60 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )4)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )23)))))]) = llvm_cbe_tmp60;
  llvm_cbe_tmp71 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )5)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-199994)))))]) = llvm_cbe_tmp71;
  llvm_cbe_tmp83 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )6)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )200005)))))]) = llvm_cbe_tmp83;
  llvm_cbe_tmp94 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )7)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-2010)))))]) = llvm_cbe_tmp94;
  llvm_cbe_tmp105 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )8)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-1971)))))]) = llvm_cbe_tmp105;
  llvm_cbe_tmp116 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )9)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1988)))))]) = llvm_cbe_tmp116;
  llvm_cbe_tmp127 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )10)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )2027)))))]) = llvm_cbe_tmp127;
  llvm_cbe_tmp138 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )11)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-201986)))))]) = llvm_cbe_tmp138;
  llvm_cbe_tmp149 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )12)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )198013)))))]) = llvm_cbe_tmp149;
  llvm_cbe_tmp160 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )13)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-197988)))))]) = llvm_cbe_tmp160;
  llvm_cbe_tmp171 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )14)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )202011)))))]) = llvm_cbe_tmp171;
  llvm_cbe_tmp182 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )15)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-200002)))))]) = llvm_cbe_tmp182;
  llvm_cbe_tmp193 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )16)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )199997)))))]) = llvm_cbe_tmp193;
  llvm_cbe_tmp204 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )17)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-199964)))))]) = llvm_cbe_tmp204;
  llvm_cbe_tmp215 = *(&llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )18)))))]);
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )200035)))))]) = llvm_cbe_tmp215;
  llvm_cbe_tmp10961237 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )20);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp10961237) < ((signed int )((unsigned int )26000000)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp10961237;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_cond_next:
  llvm_cbe_tmp228 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1)))))];
  llvm_cbe_tmp229 = *llvm_cbe_tmp228;
  llvm_cbe_tmp235 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )2)))))];
  llvm_cbe_tmp236 = *llvm_cbe_tmp235;
  llvm_cbe_tmp242 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )3)))))];
  llvm_cbe_tmp243 = *llvm_cbe_tmp242;
  llvm_cbe_tmp249 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )4)))))];
  llvm_cbe_tmp250 = *llvm_cbe_tmp249;
  llvm_cbe_tmp256 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )5)))))];
  llvm_cbe_tmp257 = *llvm_cbe_tmp256;
  llvm_cbe_tmp263 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )6)))))];
  llvm_cbe_tmp264 = *llvm_cbe_tmp263;
  llvm_cbe_tmp270 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )7)))))];
  llvm_cbe_tmp271 = *llvm_cbe_tmp270;
  llvm_cbe_tmp277 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )8)))))];
  llvm_cbe_tmp278 = *llvm_cbe_tmp277;
  llvm_cbe_tmp284 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )9)))))];
  llvm_cbe_tmp285 = *llvm_cbe_tmp284;
  llvm_cbe_tmp291 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )10)))))];
  llvm_cbe_tmp292 = *llvm_cbe_tmp291;
  llvm_cbe_tmp298 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )11)))))];
  llvm_cbe_tmp299 = *llvm_cbe_tmp298;
  llvm_cbe_tmp305 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )12)))))];
  llvm_cbe_tmp306 = *llvm_cbe_tmp305;
  llvm_cbe_tmp312 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )13)))))];
  llvm_cbe_tmp313 = *llvm_cbe_tmp312;
  llvm_cbe_tmp319 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )14)))))];
  llvm_cbe_tmp320 = *llvm_cbe_tmp319;
  llvm_cbe_tmp326 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )15)))))];
  llvm_cbe_tmp327 = *llvm_cbe_tmp326;
  llvm_cbe_tmp333 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )16)))))];
  llvm_cbe_tmp334 = *llvm_cbe_tmp333;
  llvm_cbe_tmp340 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )17)))))];
  llvm_cbe_tmp341 = *llvm_cbe_tmp340;
  llvm_cbe_tmp347 = &llvm_cbe_srcGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )18)))))];
  llvm_cbe_tmp348 = *llvm_cbe_tmp347;
  llvm_cbe_tmp349 = (((((((((((((((((llvm_cbe_tmp14 + llvm_cbe_tmp229) + llvm_cbe_tmp236) + llvm_cbe_tmp243) + llvm_cbe_tmp250) + llvm_cbe_tmp257) + llvm_cbe_tmp264) + llvm_cbe_tmp271) + llvm_cbe_tmp278) + llvm_cbe_tmp285) + llvm_cbe_tmp292) + llvm_cbe_tmp299) + llvm_cbe_tmp306) + llvm_cbe_tmp313) + llvm_cbe_tmp320) + llvm_cbe_tmp327) + llvm_cbe_tmp334) + llvm_cbe_tmp341) + llvm_cbe_tmp348;
  llvm_cbe_ux_0 = ((((llvm_cbe_tmp6 & ((unsigned int )2)) == ((unsigned int )0))) ? (((((((((((llvm_cbe_tmp243 - llvm_cbe_tmp250) + llvm_cbe_tmp271) - llvm_cbe_tmp278) + llvm_cbe_tmp285) - llvm_cbe_tmp292) + llvm_cbe_tmp327) + llvm_cbe_tmp334) - llvm_cbe_tmp341) - llvm_cbe_tmp348) / llvm_cbe_tmp349)) : (0x1.47ae147ae147bp-8));
  llvm_cbe_uy_0 = ((((llvm_cbe_tmp6 & ((unsigned int )2)) == ((unsigned int )0))) ? (((((((((((llvm_cbe_tmp229 - llvm_cbe_tmp236) + llvm_cbe_tmp271) + llvm_cbe_tmp278) - llvm_cbe_tmp285) - llvm_cbe_tmp292) + llvm_cbe_tmp299) + llvm_cbe_tmp306) - llvm_cbe_tmp313) - llvm_cbe_tmp320) / llvm_cbe_tmp349)) : (0x1.0624dd2f1a9fcp-9));
  llvm_cbe_uz_0 = ((((llvm_cbe_tmp6 & ((unsigned int )2)) == ((unsigned int )0))) ? (((((((((((llvm_cbe_tmp257 - llvm_cbe_tmp264) + llvm_cbe_tmp299) - llvm_cbe_tmp306) + llvm_cbe_tmp313) - llvm_cbe_tmp320) + llvm_cbe_tmp327) - llvm_cbe_tmp334) + llvm_cbe_tmp341) - llvm_cbe_tmp348) / llvm_cbe_tmp349)) : (0x0p+0));
  llvm_cbe_tmp590 = (((llvm_cbe_ux_0 * llvm_cbe_ux_0) + (llvm_cbe_uy_0 * llvm_cbe_uy_0)) + (llvm_cbe_uz_0 * llvm_cbe_uz_0)) * 0x1.8p+0;
  *(&llvm_cbe_dstGrid[((signed long long )llvm_cbe_tmp1011)]) = ((llvm_cbe_tmp14 * -0x1.e666666666666p-1) + ((llvm_cbe_tmp349 * 0x1.4ccccccccccccp-1) * (0x1p+0 - llvm_cbe_tmp590)));
  llvm_cbe_tmp614 = *llvm_cbe_tmp228;
  llvm_cbe_tmp617 = llvm_cbe_tmp349 * 0x1.bbbbbbbbbbbbbp-4;
  llvm_cbe_tmp619 = llvm_cbe_uy_0 * 0x1.2p+2;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )2001)))))]) = ((llvm_cbe_tmp614 * -0x1.e666666666666p-1) + (llvm_cbe_tmp617 * ((((llvm_cbe_tmp619 + 0x1.8p+1) * llvm_cbe_uy_0) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp638 = *llvm_cbe_tmp235;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-1998)))))]) = ((llvm_cbe_tmp638 * -0x1.e666666666666p-1) + (llvm_cbe_tmp617 * ((((llvm_cbe_tmp619 - 0x1.8p+1) * llvm_cbe_uy_0) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp662 = *llvm_cbe_tmp242;
  llvm_cbe_tmp667 = llvm_cbe_ux_0 * 0x1.2p+2;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )23)))))]) = ((llvm_cbe_tmp662 * -0x1.e666666666666p-1) + (llvm_cbe_tmp617 * ((((llvm_cbe_tmp667 + 0x1.8p+1) * llvm_cbe_ux_0) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp686 = *llvm_cbe_tmp249;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-16)))))]) = ((llvm_cbe_tmp686 * -0x1.e666666666666p-1) + (llvm_cbe_tmp617 * ((((llvm_cbe_tmp667 - 0x1.8p+1) * llvm_cbe_ux_0) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp710 = *llvm_cbe_tmp256;
  llvm_cbe_tmp715 = llvm_cbe_uz_0 * 0x1.2p+2;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )200005)))))]) = ((llvm_cbe_tmp710 * -0x1.e666666666666p-1) + (llvm_cbe_tmp617 * ((((llvm_cbe_tmp715 + 0x1.8p+1) * llvm_cbe_uz_0) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp734 = *llvm_cbe_tmp263;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-199994)))))]) = ((llvm_cbe_tmp734 * -0x1.e666666666666p-1) + (llvm_cbe_tmp617 * ((((llvm_cbe_tmp715 - 0x1.8p+1) * llvm_cbe_uz_0) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp758 = *llvm_cbe_tmp270;
  llvm_cbe_tmp761 = llvm_cbe_tmp349 * 0x1.bbbbbbbbbbbbbp-5;
  llvm_cbe_tmp764 = llvm_cbe_ux_0 + llvm_cbe_uy_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )2027)))))]) = ((llvm_cbe_tmp758 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp764 * ((llvm_cbe_tmp764 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp786 = *llvm_cbe_tmp277;
  llvm_cbe_tmp792 = llvm_cbe_uy_0 - llvm_cbe_ux_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1988)))))]) = ((llvm_cbe_tmp786 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp792 * ((llvm_cbe_tmp792 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp814 = *llvm_cbe_tmp284;
  llvm_cbe_tmp820 = llvm_cbe_ux_0 - llvm_cbe_uy_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-1971)))))]) = ((llvm_cbe_tmp814 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp820 * ((llvm_cbe_tmp820 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp842 = *llvm_cbe_tmp291;
  llvm_cbe_tmp847 = -(llvm_cbe_ux_0);
  llvm_cbe_tmp849 = llvm_cbe_tmp847 - llvm_cbe_uy_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-2010)))))]) = ((llvm_cbe_tmp842 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp849 * ((llvm_cbe_tmp849 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp872 = *llvm_cbe_tmp298;
  llvm_cbe_tmp878 = llvm_cbe_uy_0 + llvm_cbe_uz_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )202011)))))]) = ((llvm_cbe_tmp872 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp878 * ((llvm_cbe_tmp878 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp900 = *llvm_cbe_tmp305;
  llvm_cbe_tmp906 = llvm_cbe_uy_0 - llvm_cbe_uz_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-197988)))))]) = ((llvm_cbe_tmp900 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp906 * ((llvm_cbe_tmp906 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp928 = *llvm_cbe_tmp312;
  llvm_cbe_tmp934 = llvm_cbe_uz_0 - llvm_cbe_uy_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )198013)))))]) = ((llvm_cbe_tmp928 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp934 * ((llvm_cbe_tmp934 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp956 = *llvm_cbe_tmp319;
  llvm_cbe_tmp963 = (-(llvm_cbe_uy_0)) - llvm_cbe_uz_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-201986)))))]) = ((llvm_cbe_tmp956 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp963 * ((llvm_cbe_tmp963 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp986 = *llvm_cbe_tmp326;
  llvm_cbe_tmp992 = llvm_cbe_ux_0 + llvm_cbe_uz_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )200035)))))]) = ((llvm_cbe_tmp986 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp992 * ((llvm_cbe_tmp992 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp1015 = *llvm_cbe_tmp333;
  llvm_cbe_tmp1021 = llvm_cbe_ux_0 - llvm_cbe_uz_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-199964)))))]) = ((llvm_cbe_tmp1015 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp1021 * ((llvm_cbe_tmp1021 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp1043 = *llvm_cbe_tmp340;
  llvm_cbe_tmp1049 = llvm_cbe_uz_0 - llvm_cbe_ux_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )199997)))))]) = ((llvm_cbe_tmp1043 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp1049 * ((llvm_cbe_tmp1049 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp1071 = *llvm_cbe_tmp347;
  llvm_cbe_tmp1078 = llvm_cbe_tmp847 - llvm_cbe_uz_0;
  *(&llvm_cbe_dstGrid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )-200002)))))]) = ((llvm_cbe_tmp1071 * -0x1.e666666666666p-1) + (llvm_cbe_tmp761 * (((llvm_cbe_tmp1078 * ((llvm_cbe_tmp1078 * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp590)));
  llvm_cbe_tmp1096 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )20);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp1096) < ((signed int )((unsigned int )26000000)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp1096;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_return;
  }

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void LBM_showGridStatistics(double *llvm_cbe_grid) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  double llvm_cbe_maxU2_1_reg2mem_0;
  double llvm_cbe_maxU2_1_reg2mem_0__PHI_TEMPORARY;
  double llvm_cbe_minU2_2_reg2mem_0;
  double llvm_cbe_minU2_2_reg2mem_0__PHI_TEMPORARY;
  double llvm_cbe_minRho_1_reg2mem_0;
  double llvm_cbe_minRho_1_reg2mem_0__PHI_TEMPORARY;
  double llvm_cbe_maxRho_1_reg2mem_0;
  double llvm_cbe_maxRho_1_reg2mem_0__PHI_TEMPORARY;
  double llvm_cbe_mass_0_reg2mem_0;
  double llvm_cbe_mass_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_nFluidCells_2_reg2mem_0;
  unsigned int llvm_cbe_nFluidCells_2_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_nAccelCells_2_reg2mem_0;
  unsigned int llvm_cbe_nAccelCells_2_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_nObstacleCells_1_reg2mem_0;
  unsigned int llvm_cbe_nObstacleCells_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  double llvm_cbe_tmp4;
  double llvm_cbe_tmp10;
  double llvm_cbe_tmp18;
  double llvm_cbe_tmp25;
  double llvm_cbe_tmp32;
  double llvm_cbe_tmp39;
  double llvm_cbe_tmp46;
  double llvm_cbe_tmp53;
  double llvm_cbe_tmp60;
  double llvm_cbe_tmp67;
  double llvm_cbe_tmp75;
  double llvm_cbe_tmp82;
  double llvm_cbe_tmp89;
  double llvm_cbe_tmp96;
  double llvm_cbe_tmp103;
  double llvm_cbe_tmp110;
  double llvm_cbe_tmp117;
  double llvm_cbe_tmp124;
  double llvm_cbe_tmp131;
  double llvm_cbe_tmp132;
  double llvm_cbe_minRho_0;
  double llvm_cbe_maxRho_0;
  double llvm_cbe_tmp148;
  unsigned int llvm_cbe_tmp155;
  unsigned int llvm_cbe_tmp161;
  unsigned int llvm_cbe_tmp170171440_lobit444;
  unsigned int llvm_cbe_nFluidCells_0;
  unsigned int llvm_cbe_nAccelCells_0;
  double llvm_cbe_tmp248;
  double llvm_cbe_tmp317;
  double llvm_cbe_tmp386;
  double llvm_cbe_tmp401;
  double llvm_cbe_minU2_0;
  double llvm_cbe_maxU2_0;
  double llvm_cbe_maxU2_0_reg2mem_0;
  double llvm_cbe_maxU2_0_reg2mem_0__PHI_TEMPORARY;
  double llvm_cbe_minU2_1_reg2mem_0;
  double llvm_cbe_minU2_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_nFluidCells_1_reg2mem_0;
  unsigned int llvm_cbe_nFluidCells_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_nAccelCells_1_reg2mem_0;
  unsigned int llvm_cbe_nAccelCells_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_nObstacleCells_0_reg2mem_0;
  unsigned int llvm_cbe_nObstacleCells_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar_next;
  double llvm_cbe_tmp4281;
  double llvm_cbe_tmp4302;
  unsigned int llvm_cbe_tmp438;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )6);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )6));
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_maxU2_1_reg2mem_0__PHI_TEMPORARY = -0x1.93e5939a08ceap+99;   /* for PHI node */
  llvm_cbe_minU2_2_reg2mem_0__PHI_TEMPORARY = 0x1.93e5939a08ceap+99;   /* for PHI node */
  llvm_cbe_minRho_1_reg2mem_0__PHI_TEMPORARY = 0x1.93e5939a08ceap+99;   /* for PHI node */
  llvm_cbe_maxRho_1_reg2mem_0__PHI_TEMPORARY = -0x1.93e5939a08ceap+99;   /* for PHI node */
  llvm_cbe_mass_0_reg2mem_0__PHI_TEMPORARY = 0x0p+0;   /* for PHI node */
  llvm_cbe_nFluidCells_2_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_nAccelCells_2_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_nObstacleCells_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_maxU2_1_reg2mem_0 = llvm_cbe_maxU2_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_minU2_2_reg2mem_0 = llvm_cbe_minU2_2_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_minRho_1_reg2mem_0 = llvm_cbe_minRho_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_maxRho_1_reg2mem_0 = llvm_cbe_maxRho_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_mass_0_reg2mem_0 = llvm_cbe_mass_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_nFluidCells_2_reg2mem_0 = llvm_cbe_nFluidCells_2_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_nAccelCells_2_reg2mem_0 = llvm_cbe_nAccelCells_2_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_nObstacleCells_1_reg2mem_0 = llvm_cbe_nObstacleCells_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )22);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )22));
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_indvar * ((unsigned int )20);
  llvm_cbe_tmp4 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0)))]);
  llvm_cbe_tmp10 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1)))))]);
  llvm_cbe_tmp18 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )2)))))]);
  llvm_cbe_tmp25 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )3)))))]);
  llvm_cbe_tmp32 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )4)))))]);
  llvm_cbe_tmp39 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )5)))))]);
  llvm_cbe_tmp46 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )6)))))]);
  llvm_cbe_tmp53 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )7)))))]);
  llvm_cbe_tmp60 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )8)))))]);
  llvm_cbe_tmp67 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )9)))))]);
  llvm_cbe_tmp75 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )10)))))]);
  llvm_cbe_tmp82 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )11)))))]);
  llvm_cbe_tmp89 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )12)))))]);
  llvm_cbe_tmp96 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )13)))))]);
  llvm_cbe_tmp103 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )14)))))]);
  llvm_cbe_tmp110 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )15)))))]);
  llvm_cbe_tmp117 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )16)))))]);
  llvm_cbe_tmp124 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )17)))))]);
  llvm_cbe_tmp131 = *(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )18)))))]);
  llvm_cbe_tmp132 = (((((((((((((((((llvm_cbe_tmp4 + llvm_cbe_tmp10) + llvm_cbe_tmp18) + llvm_cbe_tmp25) + llvm_cbe_tmp32) + llvm_cbe_tmp39) + llvm_cbe_tmp46) + llvm_cbe_tmp53) + llvm_cbe_tmp60) + llvm_cbe_tmp67) + llvm_cbe_tmp75) + llvm_cbe_tmp82) + llvm_cbe_tmp89) + llvm_cbe_tmp96) + llvm_cbe_tmp103) + llvm_cbe_tmp110) + llvm_cbe_tmp117) + llvm_cbe_tmp124) + llvm_cbe_tmp131;
  llvm_cbe_minRho_0 = (((llvm_fcmp_olt(llvm_cbe_tmp132, llvm_cbe_minRho_1_reg2mem_0))) ? (llvm_cbe_tmp132) : (llvm_cbe_minRho_1_reg2mem_0));
  llvm_cbe_maxRho_0 = (((llvm_fcmp_ogt(llvm_cbe_tmp132, llvm_cbe_maxRho_1_reg2mem_0))) ? (llvm_cbe_tmp132) : (llvm_cbe_maxRho_1_reg2mem_0));
  llvm_cbe_tmp148 = llvm_cbe_mass_0_reg2mem_0 + llvm_cbe_tmp132;
  llvm_cbe_tmp155 = *(((unsigned int *)(&llvm_cbe_grid[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0 + ((unsigned int )19)))))])));
  if (((llvm_cbe_tmp155 & ((unsigned int )1)) == ((unsigned int )0))) {
    goto llvm_cbe_cond_false;
  } else {
    goto llvm_cbe_cond_true159;
  }

llvm_cbe_bb421:
  llvm_cbe_maxU2_0_reg2mem_0 = llvm_cbe_maxU2_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_minU2_1_reg2mem_0 = llvm_cbe_minU2_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_nFluidCells_1_reg2mem_0 = llvm_cbe_nFluidCells_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_nAccelCells_1_reg2mem_0 = llvm_cbe_nAccelCells_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_nObstacleCells_0_reg2mem_0 = llvm_cbe_nObstacleCells_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next == ((unsigned int )1300000))) {
    goto llvm_cbe_bb426;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    llvm_cbe_maxU2_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_maxU2_0_reg2mem_0;   /* for PHI node */
    llvm_cbe_minU2_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_minU2_1_reg2mem_0;   /* for PHI node */
    llvm_cbe_minRho_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_minRho_0;   /* for PHI node */
    llvm_cbe_maxRho_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_maxRho_0;   /* for PHI node */
    llvm_cbe_mass_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp148;   /* for PHI node */
    llvm_cbe_nFluidCells_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_nFluidCells_1_reg2mem_0;   /* for PHI node */
    llvm_cbe_nAccelCells_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_nAccelCells_1_reg2mem_0;   /* for PHI node */
    llvm_cbe_nObstacleCells_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_nObstacleCells_0_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_bb;
  }

llvm_cbe_cond_true159:
  llvm_cbe_tmp161 = llvm_cbe_nObstacleCells_1_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_maxU2_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_maxU2_1_reg2mem_0;   /* for PHI node */
  llvm_cbe_minU2_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_minU2_2_reg2mem_0;   /* for PHI node */
  llvm_cbe_nFluidCells_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_nFluidCells_2_reg2mem_0;   /* for PHI node */
  llvm_cbe_nAccelCells_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_nAccelCells_2_reg2mem_0;   /* for PHI node */
  llvm_cbe_nObstacleCells_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp161;   /* for PHI node */
  goto llvm_cbe_bb421;

llvm_cbe_cond_false:
  llvm_cbe_tmp170171440_lobit444 = (((unsigned int )(((unsigned int )llvm_cbe_tmp155) >> ((unsigned int )((unsigned int )1))))) & ((unsigned int )1);
  llvm_cbe_nFluidCells_0 = (llvm_cbe_tmp170171440_lobit444 ^ ((unsigned int )1)) + llvm_cbe_nFluidCells_2_reg2mem_0;
  llvm_cbe_nAccelCells_0 = llvm_cbe_tmp170171440_lobit444 + llvm_cbe_nAccelCells_2_reg2mem_0;
  llvm_cbe_tmp248 = ((((((((llvm_cbe_tmp25 - llvm_cbe_tmp32) + llvm_cbe_tmp53) - llvm_cbe_tmp60) + llvm_cbe_tmp67) - llvm_cbe_tmp75) + llvm_cbe_tmp110) + llvm_cbe_tmp117) - llvm_cbe_tmp124) - llvm_cbe_tmp131;
  llvm_cbe_tmp317 = ((((((((llvm_cbe_tmp10 - llvm_cbe_tmp18) + llvm_cbe_tmp53) + llvm_cbe_tmp60) - llvm_cbe_tmp67) - llvm_cbe_tmp75) + llvm_cbe_tmp82) + llvm_cbe_tmp89) - llvm_cbe_tmp96) - llvm_cbe_tmp103;
  llvm_cbe_tmp386 = ((((((((llvm_cbe_tmp39 - llvm_cbe_tmp46) + llvm_cbe_tmp82) - llvm_cbe_tmp89) + llvm_cbe_tmp96) - llvm_cbe_tmp103) + llvm_cbe_tmp110) - llvm_cbe_tmp117) + llvm_cbe_tmp124) - llvm_cbe_tmp131;
  llvm_cbe_tmp401 = (((llvm_cbe_tmp248 * llvm_cbe_tmp248) + (llvm_cbe_tmp317 * llvm_cbe_tmp317)) + (llvm_cbe_tmp386 * llvm_cbe_tmp386)) / (llvm_cbe_tmp132 * llvm_cbe_tmp132);
  llvm_cbe_minU2_0 = (((llvm_fcmp_olt(llvm_cbe_tmp401, llvm_cbe_minU2_2_reg2mem_0))) ? (llvm_cbe_tmp401) : (llvm_cbe_minU2_2_reg2mem_0));
  llvm_cbe_maxU2_0 = (((llvm_fcmp_ogt(llvm_cbe_tmp401, llvm_cbe_maxU2_1_reg2mem_0))) ? (llvm_cbe_tmp401) : (llvm_cbe_maxU2_1_reg2mem_0));
  llvm_cbe_maxU2_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_maxU2_0;   /* for PHI node */
  llvm_cbe_minU2_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_minU2_0;   /* for PHI node */
  llvm_cbe_nFluidCells_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_nFluidCells_0;   /* for PHI node */
  llvm_cbe_nAccelCells_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_nAccelCells_0;   /* for PHI node */
  llvm_cbe_nObstacleCells_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_nObstacleCells_1_reg2mem_0;   /* for PHI node */
  goto llvm_cbe_bb421;

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_bb426:
  llvm_cbe_tmp4281 = sqrt(llvm_cbe_maxU2_0_reg2mem_0);
  llvm_cbe_tmp4302 = sqrt(llvm_cbe_minU2_1_reg2mem_0);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )6);
  llvm_cbe_tmp438 =  /*tail*/ printf((&(_2E_str28[((signed long long )((unsigned long long )0ll))])), llvm_cbe_nObstacleCells_0_reg2mem_0, llvm_cbe_nAccelCells_1_reg2mem_0, llvm_cbe_nFluidCells_1_reg2mem_0, llvm_cbe_minRho_0, llvm_cbe_maxRho_0, llvm_cbe_tmp148, llvm_cbe_tmp4302, llvm_cbe_tmp4281);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


unsigned int main(unsigned int llvm_cbe_nArgs, unsigned char **llvm_cbe_arg) {
  float llvm_cbe_fileUx_i;    /* Address-exposed local */
  float llvm_cbe_fileUy_i;    /* Address-exposed local */
  float llvm_cbe_fileUz_i;    /* Address-exposed local */
  float llvm_cbe_ux_i;    /* Address-exposed local */
  float llvm_cbe_uy_i;    /* Address-exposed local */
  float llvm_cbe_uz_i;    /* Address-exposed local */
  struct l_struct_2E_stat llvm_cbe_fileStat_i;    /* Address-exposed local */
  unsigned int llvm_cbe_tmp10_i;
  unsigned char *llvm_cbe_tmp13_i;
  unsigned long long llvm_cbe_tmp22_i;
  unsigned int llvm_cbe_tmp2425_i;
  unsigned char *llvm_cbe_tmp33_i;
  unsigned char *llvm_cbe_tmp38_i;
  unsigned long long llvm_cbe_tmp50_i;
  unsigned int llvm_cbe_tmp5354_i;
  unsigned char *llvm_cbe_tmp62_i;
  unsigned long long llvm_cbe_tmp74_i;
  unsigned int llvm_cbe_tmp7778_i;
  unsigned char *llvm_cbe_tmp91_i;
  unsigned int llvm_cbe_tmp100_i;
  unsigned int llvm_cbe_tmp112_i;
  unsigned long long llvm_cbe_tmp115_i;
  unsigned int llvm_cbe_tmp127_i;
  unsigned char *llvm_cbe_param_4_0;
  unsigned char *llvm_cbe_param_4_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp147_i;
  unsigned int llvm_cbe_tmp159_i;
  unsigned int llvm_cbe_tmp33;
  unsigned char *ltmp_11_2;
  double (*ltmp_12_5)[26800000];
  unsigned int llvm_cbe_tmp8_i;
  double *llvm_cbe_tmp11_i;
  double (*llvm_cbe_tmp11_i_c)[26000000];
  unsigned char *ltmp_13_2;
  double (*ltmp_14_5)[26800000];
  unsigned int llvm_cbe_tmp8_i125;
  double *llvm_cbe_tmp11_i127;
  double (*llvm_cbe_tmp11_i127_c)[26000000];
  double (*llvm_cbe_srcGrid_2)[26000000];
  double (*llvm_cbe_srcGrid_2__PHI_TEMPORARY)[26000000];
  double (*llvm_cbe_dstGrid_2)[26000000];
  double (*llvm_cbe_dstGrid_2__PHI_TEMPORARY)[26000000];
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val311;
  unsigned int llvm_cbe_val412;
  unsigned int llvm_cbe_t_0_reg2mem_0_us;
  unsigned int llvm_cbe_indvar1808_i;
  unsigned int llvm_cbe_indvar1808_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val315;
  unsigned int llvm_cbe_val416;
  unsigned int llvm_cbe_i_0_reg2mem_0_i;
  double llvm_cbe_tmp5_i132;
  double llvm_cbe_tmp11_i135;
  double llvm_cbe_tmp19_i;
  double llvm_cbe_tmp26_i140;
  double llvm_cbe_tmp33_i142;
  double llvm_cbe_tmp40_i;
  double llvm_cbe_tmp47_i;
  double llvm_cbe_tmp54_i;
  double llvm_cbe_tmp61_i147;
  double llvm_cbe_tmp68_i;
  double llvm_cbe_tmp75_i;
  double llvm_cbe_tmp83_i;
  double llvm_cbe_tmp90_i153;
  double llvm_cbe_tmp97_i;
  double llvm_cbe_tmp104_i156;
  double llvm_cbe_tmp111_i;
  double llvm_cbe_tmp118_i160;
  double llvm_cbe_tmp125_i;
  double llvm_cbe_tmp132_i162;
  double llvm_cbe_tmp139_i;
  double llvm_cbe_tmp145_i;
  double llvm_cbe_tmp152_i;
  double llvm_cbe_tmp159_i168;
  double llvm_cbe_tmp166_i;
  double llvm_cbe_tmp173_i;
  double llvm_cbe_tmp180_i;
  double llvm_cbe_tmp187_i;
  double llvm_cbe_tmp194_i;
  double llvm_cbe_tmp201_i;
  double llvm_cbe_tmp208_i;
  double llvm_cbe_tmp215_i;
  double llvm_cbe_tmp222_i;
  double llvm_cbe_tmp229_i;
  double llvm_cbe_tmp236_i;
  double llvm_cbe_tmp243_i;
  double llvm_cbe_tmp250_i;
  double llvm_cbe_tmp257_i;
  double llvm_cbe_tmp264_i;
  double llvm_cbe_tmp269_i185;
  double llvm_cbe_tmp275_i;
  double llvm_cbe_tmp281_i;
  double llvm_cbe_tmp291_i;
  double llvm_cbe_tmp303_i;
  double llvm_cbe_tmp307_i;
  double llvm_cbe_tmp316_i190;
  double llvm_cbe_tmp325_i;
  double llvm_cbe_tmp382_i;
  double llvm_cbe_tmp412_i;
  double llvm_cbe_tmp425_i;
  double llvm_cbe_tmp497_i;
  double llvm_cbe_tmp507_i;
  double llvm_cbe_tmp517_i;
  double llvm_cbe_tmp527_i;
  double llvm_cbe_tmp537_i;
  double llvm_cbe_tmp547_i;
  double llvm_cbe_tmp558_i;
  double llvm_cbe_tmp569_i;
  unsigned int llvm_cbe_indvar_next1809_i;
  unsigned int llvm_cbe_indvar_i;
  unsigned int llvm_cbe_indvar_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp_i203;
  double llvm_cbe_tmp668_i;
  double llvm_cbe_tmp674_i;
  double llvm_cbe_tmp681_i;
  double llvm_cbe_tmp688_i;
  double llvm_cbe_tmp695_i;
  double llvm_cbe_tmp702_i;
  double llvm_cbe_tmp709_i;
  double llvm_cbe_tmp716_i;
  double llvm_cbe_tmp723_i;
  double llvm_cbe_tmp730_i;
  double llvm_cbe_tmp737_i;
  double llvm_cbe_tmp744_i;
  double llvm_cbe_tmp751_i;
  double llvm_cbe_tmp758_i;
  double llvm_cbe_tmp765_i;
  double llvm_cbe_tmp772_i;
  double llvm_cbe_tmp779_i;
  double llvm_cbe_tmp786_i;
  double llvm_cbe_tmp793_i;
  double llvm_cbe_tmp794_i;
  double llvm_cbe_tmp1016_i;
  double llvm_cbe_tmp1022_i;
  double llvm_cbe_tmp1029_i;
  double llvm_cbe_tmp1036_i;
  double llvm_cbe_tmp1043_i;
  double llvm_cbe_tmp1050_i;
  double llvm_cbe_tmp1057_i;
  double llvm_cbe_tmp1064_i;
  double llvm_cbe_tmp1071_i;
  double llvm_cbe_tmp1078_i;
  double llvm_cbe_tmp1085_i;
  double llvm_cbe_tmp1092_i;
  double llvm_cbe_tmp1099_i;
  double llvm_cbe_tmp1106_i;
  double llvm_cbe_tmp1113_i;
  double llvm_cbe_tmp1120_i;
  double llvm_cbe_tmp1127_i;
  double llvm_cbe_tmp1134_i;
  double llvm_cbe_tmp1141_i;
  double llvm_cbe_tmp1142_i;
  double llvm_cbe_tmp1362_i;
  double llvm_cbe_tmp1366_i;
  double llvm_cbe_tmp1370_i;
  double llvm_cbe_tmp1382_i;
  double llvm_cbe_tmp1397_i;
  double llvm_cbe_tmp1429_i;
  double llvm_cbe_tmp1461_i;
  double llvm_cbe_tmp1494_i;
  double llvm_cbe_tmp1514_i;
  double llvm_cbe_tmp1535_i;
  double llvm_cbe_tmp1554_i;
  double llvm_cbe_tmp1556_i;
  double llvm_cbe_tmp1577_i;
  double llvm_cbe_tmp1597_i;
  double llvm_cbe_tmp1617_i;
  double llvm_cbe_tmp1638_i;
  double llvm_cbe_tmp1659_i;
  double llvm_cbe_tmp1679_i;
  double llvm_cbe_tmp1699_i;
  double llvm_cbe_tmp1720_i;
  unsigned int llvm_cbe_indvar_next_i;
  double *llvm_cbe_tmp4344_us;
  unsigned int llvm_cbe_tmp55_us;
  double (*llvm_cbe_srcGrid_0)[26000000];
  double (*llvm_cbe_srcGrid_0__PHI_TEMPORARY)[26000000];
  double (*llvm_cbe_dstGrid_0)[26000000];
  double (*llvm_cbe_dstGrid_0__PHI_TEMPORARY)[26000000];
  unsigned int llvm_cbe_indvar117;
  unsigned int llvm_cbe_indvar117__PHI_TEMPORARY;
  unsigned int llvm_cbe_val317;
  unsigned int llvm_cbe_val418;
  unsigned int llvm_cbe_t_0_reg2mem_0;
  double *llvm_cbe_tmp4344;
  unsigned int llvm_cbe_tmp55;
  double (*llvm_cbe_srcGrid_1)[26000000];
  double (*llvm_cbe_srcGrid_1__PHI_TEMPORARY)[26000000];
  double (*llvm_cbe_dstGrid_1)[26000000];
  double (*llvm_cbe_dstGrid_1__PHI_TEMPORARY)[26000000];
  struct l_struct_2E_FILE *llvm_cbe_tmp7_i19;
  unsigned char *llvm_cbe_tmp714715_i;
  unsigned char *llvm_cbe_tmp756757_i;
  unsigned char *llvm_cbe_tmp798799_i;
  unsigned int llvm_cbe_z_0_reg2mem_0_ph_i20;
  unsigned int llvm_cbe_z_0_reg2mem_0_ph_i20__PHI_TEMPORARY;
  float llvm_cbe_maxDiff2_2_ph_i;
  float llvm_cbe_maxDiff2_2_ph_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp14_i21;
  unsigned int llvm_cbe_x_0965_i;
  unsigned int llvm_cbe_x_0965_i__PHI_TEMPORARY;
  float llvm_cbe_maxDiff2_1964_i;
  float llvm_cbe_maxDiff2_1964_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_tmp18_i23;
  double llvm_cbe_tmp22_i26;
  double llvm_cbe_tmp35_i30;
  double llvm_cbe_tmp49_i35;
  double llvm_cbe_tmp63_i40;
  double llvm_cbe_tmp77_i45;
  double llvm_cbe_tmp91_i50;
  double llvm_cbe_tmp105_i55;
  double llvm_cbe_tmp119_i60;
  double llvm_cbe_tmp133_i65;
  double llvm_cbe_tmp147_i70;
  double llvm_cbe_tmp161_i75;
  double llvm_cbe_tmp175_i80;
  double llvm_cbe_tmp189_i85;
  double llvm_cbe_tmp203_i90;
  double llvm_cbe_tmp217_i95;
  double llvm_cbe_tmp231_i100;
  double llvm_cbe_tmp245_i105;
  double llvm_cbe_tmp259_i110;
  double llvm_cbe_tmp273_i115;
  double llvm_cbe_tmp274_i116;
  unsigned long long llvm_cbe_tmp741_i;
  unsigned long long llvm_cbe_tmp783_i;
  unsigned long long llvm_cbe_tmp825_i;
  float llvm_cbe_tmp839_i;
  float llvm_cbe_tmp842843_i;
  float llvm_cbe_tmp844_i;
  float llvm_cbe_tmp847848_i;
  float llvm_cbe_tmp849_i;
  float llvm_cbe_tmp852853_i;
  float llvm_cbe_tmp864_i;
  float llvm_cbe_maxDiff2_0_i;
  unsigned int llvm_cbe_indvar_next975_i;
  unsigned int llvm_cbe_indvar_next977_i;
  unsigned int llvm_cbe_y_0969_i;
  unsigned int llvm_cbe_y_0969_i__PHI_TEMPORARY;
  float llvm_cbe_maxDiff2_2968_i;
  float llvm_cbe_maxDiff2_2968_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_tmp15_i121;
  unsigned int llvm_cbe_indvar_next979_i;
  double llvm_cbe_tmp899_i1;
  unsigned int llvm_cbe_tmp901_i;
  unsigned int llvm_cbe_tmp903_i;
  struct l_struct_2E_FILE *llvm_cbe_tmp7_i7;
  unsigned char *llvm_cbe_tmp718719_i;
  unsigned char *llvm_cbe_tmp760761_i;
  unsigned char *llvm_cbe_tmp802803_i;
  unsigned int llvm_cbe_z_0_reg2mem_0_ph_i;
  unsigned int llvm_cbe_z_0_reg2mem_0_ph_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val35;
  unsigned int llvm_cbe_val46;
  unsigned int llvm_cbe_tmp14_i8;
  unsigned int llvm_cbe_indvar983_i;
  unsigned int llvm_cbe_indvar983_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val39;
  unsigned int llvm_cbe_val410;
  unsigned int llvm_cbe_tmp18_i;
  double llvm_cbe_tmp22_i10;
  double llvm_cbe_tmp35_i;
  double llvm_cbe_tmp49_i;
  double llvm_cbe_tmp63_i;
  double llvm_cbe_tmp77_i;
  double llvm_cbe_tmp91_i14;
  double llvm_cbe_tmp105_i;
  double llvm_cbe_tmp119_i;
  double llvm_cbe_tmp133_i;
  double llvm_cbe_tmp147_i17;
  double llvm_cbe_tmp161_i;
  double llvm_cbe_tmp175_i;
  double llvm_cbe_tmp189_i;
  double llvm_cbe_tmp203_i;
  double llvm_cbe_tmp217_i;
  double llvm_cbe_tmp231_i;
  double llvm_cbe_tmp245_i;
  double llvm_cbe_tmp259_i;
  double llvm_cbe_tmp273_i;
  float llvm_cbe_tmp274275_i;
  unsigned int llvm_cbe_tmp843_i;
  unsigned long long llvm_cbe_tmp745_i;
  unsigned long long llvm_cbe_tmp787_i;
  unsigned long long llvm_cbe_tmp829_i;
  unsigned int llvm_cbe_indvar_next986_i;
  unsigned int llvm_cbe_y_0980_i;
  unsigned int llvm_cbe_y_0980_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val37;
  unsigned int llvm_cbe_val48;
  unsigned int llvm_cbe_tmp15_i;
  unsigned int llvm_cbe_indvar_next988_i;
  unsigned int llvm_cbe_tmp867_i;

  CODE_FOR_MAIN();
  *(&cg_caller_id_var) = ((unsigned int )7);
  if ((((unsigned int )(llvm_cbe_nArgs + ((unsigned int )-5))) > ((unsigned int )((unsigned int )1)))) {
    goto llvm_cbe_cond_true_i;
  } else {
    goto llvm_cbe_cond_next_i;
  }

llvm_cbe_cond_true_i:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp10_i = puts((&(_2E_str26[((signed long long )((unsigned long long )0ll))])));
  CallProfPrinter();
  return ((unsigned int )1);
llvm_cbe_cond_next_i:
  llvm_cbe_tmp13_i = *(&llvm_cbe_arg[((signed long long )((unsigned long long )1ll))]);
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp22_i = __strtol_internal(llvm_cbe_tmp13_i, ((unsigned char **)/*NULL*/0), ((unsigned int )10), ((unsigned int )0));
  llvm_cbe_tmp2425_i = ((unsigned int )llvm_cbe_tmp22_i);
  llvm_cbe_tmp33_i = *(&llvm_cbe_arg[((signed long long )((unsigned long long )2ll))]);
  llvm_cbe_tmp38_i = *(&llvm_cbe_arg[((signed long long )((unsigned long long )3ll))]);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp50_i = __strtol_internal(llvm_cbe_tmp38_i, ((unsigned char **)/*NULL*/0), ((unsigned int )10), ((unsigned int )0));
  llvm_cbe_tmp5354_i = ((unsigned int )llvm_cbe_tmp50_i);
  llvm_cbe_tmp62_i = *(&llvm_cbe_arg[((signed long long )((unsigned long long )4ll))]);
  *(&cg_caller_call_site_var) = ((unsigned int )3);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp74_i = __strtol_internal(llvm_cbe_tmp62_i, ((unsigned char **)/*NULL*/0), ((unsigned int )10), ((unsigned int )0));
  llvm_cbe_tmp7778_i = ((unsigned int )llvm_cbe_tmp74_i);
  if ((llvm_cbe_nArgs == ((unsigned int )6))) {
    goto llvm_cbe_cond_true88_i;
  } else {
    llvm_cbe_param_4_0__PHI_TEMPORARY = ((unsigned char *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_cond_next131_i;
  }

llvm_cbe_cond_true88_i:
  llvm_cbe_tmp91_i = *(&llvm_cbe_arg[((signed long long )((unsigned long long )5ll))]);
  *(&cg_caller_call_site_var) = ((unsigned int )4);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp100_i = __xstat(((unsigned int )1), llvm_cbe_tmp91_i, (&llvm_cbe_fileStat_i));
  if ((llvm_cbe_tmp100_i == ((unsigned int )0))) {
    goto llvm_cbe_cond_next113_i;
  } else {
    goto llvm_cbe_cond_true107_i;
  }

llvm_cbe_cond_true107_i:
  *(&cg_caller_call_site_var) = ((unsigned int )5);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp112_i = printf((&(_2E_str37[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp91_i);
  CallProfPrinter();
  return ((unsigned int )1);
llvm_cbe_cond_next113_i:
  llvm_cbe_tmp115_i = *(&llvm_cbe_fileStat_i.field8);
  if ((llvm_cbe_tmp115_i == ((unsigned long long )1313130ll))) {
    llvm_cbe_param_4_0__PHI_TEMPORARY = llvm_cbe_tmp91_i;   /* for PHI node */
    goto llvm_cbe_cond_next131_i;
  } else {
    goto llvm_cbe_cond_true119_i;
  }

llvm_cbe_cond_true119_i:
  *(&cg_caller_call_site_var) = ((unsigned int )6);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp127_i = printf((&(_2E_str48[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp91_i, (((unsigned int )llvm_cbe_tmp115_i)), ((unsigned int )1313130));
  CallProfPrinter();
  return ((unsigned int )1);
llvm_cbe_cond_next131_i:
  llvm_cbe_param_4_0 = llvm_cbe_param_4_0__PHI_TEMPORARY;
  if ((llvm_cbe_tmp5354_i == ((unsigned int )1))) {
    goto llvm_cbe_cond_true138_i;
  } else {
    goto llvm_cbe_MAIN_parseCommandLine_exit;
  }

llvm_cbe_cond_true138_i:
  *(&cg_caller_call_site_var) = ((unsigned int )7);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp147_i = __xstat(((unsigned int )1), llvm_cbe_tmp33_i, (&llvm_cbe_fileStat_i));
  if ((llvm_cbe_tmp147_i == ((unsigned int )0))) {
    goto llvm_cbe_MAIN_parseCommandLine_exit;
  } else {
    goto llvm_cbe_cond_true154_i;
  }

llvm_cbe_cond_true154_i:
  *(&cg_caller_call_site_var) = ((unsigned int )8);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp159_i = printf((&(_2E_str59[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp33_i);
  CallProfPrinter();
  return ((unsigned int )1);
llvm_cbe_MAIN_parseCommandLine_exit:
  *(&cg_caller_call_site_var) = ((unsigned int )9);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp33 = printf((&(_2E_str15[((signed long long )((unsigned long long )0ll))])), ((unsigned int )100), ((unsigned int )100), ((unsigned int )130), 0x1.4ccccccccccccp+0, llvm_cbe_tmp2425_i, llvm_cbe_tmp33_i, (&actionString_2E_2842[((signed long long )(llvm_cbe_tmp50_i & ((unsigned long long )4294967295ll)))][((signed long long )((unsigned long long )0ll))]), (&simTypeString_2E_2843[((signed long long )(llvm_cbe_tmp74_i & ((unsigned long long )4294967295ll)))][((signed long long )((unsigned long long )0ll))]), ((((llvm_cbe_param_4_0 == ((unsigned char *)/*NULL*/0))) ? ((&(_2E_str410[((signed long long )((unsigned long long )0ll))]))) : (llvm_cbe_param_4_0))));
  ltmp_11_2 =  /*tail*/ malloc(((unsigned long long )214400000ll));
  ltmp_12_5 = ((double (*)[26800000])ltmp_11_2);
  if ((ltmp_12_5 == ((double (*)[26800000])/*NULL*/0))) {
    goto llvm_cbe_cond_true_i1;
  } else {
    goto llvm_cbe_LBM_allocateGrid_exit;
  }

llvm_cbe_cond_true_i1:
  *(&cg_caller_call_site_var) = ((unsigned int )10);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp8_i = printf((&(_2E_str6[((signed long long )((unsigned long long )0ll))])), 0x1.98ef8p+7);
  *(&cg_caller_call_site_var) = ((unsigned int )11);
  *(&cg_caller_id_var) = ((unsigned int )7);
  CallProfPrinter();
  exit(((unsigned int )1));
  /*UNREACHABLE*/;
llvm_cbe_LBM_allocateGrid_exit:
  llvm_cbe_tmp11_i = &ltmp_12_5[((signed int )((unsigned int )0))][((signed long long )((unsigned long long )400000ll))];
  llvm_cbe_tmp11_i_c = ((double (*)[26000000])llvm_cbe_tmp11_i);
  ltmp_13_2 =  /*tail*/ malloc(((unsigned long long )214400000ll));
  ltmp_14_5 = ((double (*)[26800000])ltmp_13_2);
  if ((ltmp_14_5 == ((double (*)[26800000])/*NULL*/0))) {
    goto llvm_cbe_cond_true_i126;
  } else {
    goto llvm_cbe_LBM_allocateGrid_exit129;
  }

llvm_cbe_cond_true_i126:
  *(&cg_caller_call_site_var) = ((unsigned int )12);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp8_i125 = printf((&(_2E_str6[((signed long long )((unsigned long long )0ll))])), 0x1.98ef8p+7);
  *(&cg_caller_call_site_var) = ((unsigned int )13);
  *(&cg_caller_id_var) = ((unsigned int )7);
  CallProfPrinter();
  exit(((unsigned int )1));
  /*UNREACHABLE*/;
llvm_cbe_LBM_allocateGrid_exit129:
  llvm_cbe_tmp11_i127 = &ltmp_14_5[((signed int )((unsigned int )0))][((signed long long )((unsigned long long )400000ll))];
  llvm_cbe_tmp11_i127_c = ((double (*)[26000000])llvm_cbe_tmp11_i127);
  *(&cg_caller_call_site_var) = ((unsigned int )14);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_initializeGrid(llvm_cbe_tmp11_i);
  *(&cg_caller_call_site_var) = ((unsigned int )15);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_initializeGrid(llvm_cbe_tmp11_i127);
  if ((llvm_cbe_param_4_0 == ((unsigned char *)/*NULL*/0))) {
    goto llvm_cbe_cond_next_i106;
  } else {
    goto llvm_cbe_cond_true_i104;
  }

llvm_cbe_cond_true_i104:
  *(&cg_caller_call_site_var) = ((unsigned int )16);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_loadObstacleFile(llvm_cbe_tmp11_i, llvm_cbe_param_4_0);
  *(&cg_caller_call_site_var) = ((unsigned int )17);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_loadObstacleFile(llvm_cbe_tmp11_i127, llvm_cbe_param_4_0);
  goto llvm_cbe_cond_next_i106;

llvm_cbe_cond_next_i106:
  if ((llvm_cbe_tmp7778_i == ((unsigned int )1))) {
    goto llvm_cbe_cond_true25_i;
  } else {
    goto llvm_cbe_cond_false_i108;
  }

llvm_cbe_cond_true25_i:
  *(&cg_caller_call_site_var) = ((unsigned int )18);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_initializeSpecialCellsForChannel(llvm_cbe_tmp11_i);
  *(&cg_caller_call_site_var) = ((unsigned int )19);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_initializeSpecialCellsForChannel(llvm_cbe_tmp11_i127);
  goto llvm_cbe_MAIN_initialize_exit;

llvm_cbe_cond_false_i108:
  *(&cg_caller_call_site_var) = ((unsigned int )20);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_initializeSpecialCellsForLDC(llvm_cbe_tmp11_i);
  *(&cg_caller_call_site_var) = ((unsigned int )21);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_initializeSpecialCellsForLDC(llvm_cbe_tmp11_i127);
  goto llvm_cbe_MAIN_initialize_exit;

llvm_cbe_MAIN_initialize_exit:
  *(&cg_caller_call_site_var) = ((unsigned int )22);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_showGridStatistics(llvm_cbe_tmp11_i);
  if ((((signed int )llvm_cbe_tmp2425_i) < ((signed int )((unsigned int )1)))) {
    llvm_cbe_srcGrid_1__PHI_TEMPORARY = llvm_cbe_tmp11_i_c;   /* for PHI node */
    llvm_cbe_dstGrid_1__PHI_TEMPORARY = llvm_cbe_tmp11_i127_c;   /* for PHI node */
    goto llvm_cbe_bb68;
  } else {
    goto llvm_cbe_bb_preheader;
  }

llvm_cbe_bb_preheader:
  if ((llvm_cbe_tmp7778_i == ((unsigned int )1))) {
    llvm_cbe_srcGrid_2__PHI_TEMPORARY = llvm_cbe_tmp11_i_c;   /* for PHI node */
    llvm_cbe_dstGrid_2__PHI_TEMPORARY = llvm_cbe_tmp11_i127_c;   /* for PHI node */
    llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb_us;
  } else {
    llvm_cbe_srcGrid_0__PHI_TEMPORARY = llvm_cbe_tmp11_i_c;   /* for PHI node */
    llvm_cbe_dstGrid_0__PHI_TEMPORARY = llvm_cbe_tmp11_i127_c;   /* for PHI node */
    llvm_cbe_indvar117__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb;
  }

  do {     /* Syntactic loop 'bb.us' to make GCC happy */
llvm_cbe_bb_us:
  llvm_cbe_srcGrid_2 = llvm_cbe_srcGrid_2__PHI_TEMPORARY;
  llvm_cbe_dstGrid_2 = llvm_cbe_dstGrid_2__PHI_TEMPORARY;
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val311 = *(&cg_caller_id_var);
  llvm_cbe_val412 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )29);
  CallEdgeProfiler(llvm_cbe_val311, llvm_cbe_val412, ((unsigned int )29));
  llvm_cbe_t_0_reg2mem_0_us = llvm_cbe_indvar + ((unsigned int )1);
  llvm_cbe_indvar1808_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb_i;

llvm_cbe_bb61_us:
  *(&cg_caller_call_site_var) = llvm_cbe_val412;
  *(&cg_caller_id_var) = llvm_cbe_val311;
  if ((((signed int )llvm_cbe_tmp2425_i) < ((signed int )(llvm_cbe_indvar + ((unsigned int )2))))) {
    llvm_cbe_srcGrid_1__PHI_TEMPORARY = llvm_cbe_dstGrid_2;   /* for PHI node */
    llvm_cbe_dstGrid_1__PHI_TEMPORARY = llvm_cbe_srcGrid_2;   /* for PHI node */
    goto llvm_cbe_bb68;
  } else {
    llvm_cbe_srcGrid_2__PHI_TEMPORARY = llvm_cbe_dstGrid_2;   /* for PHI node */
    llvm_cbe_dstGrid_2__PHI_TEMPORARY = llvm_cbe_srcGrid_2;   /* for PHI node */
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_t_0_reg2mem_0_us;   /* for PHI node */
    goto llvm_cbe_bb_us;
  }

llvm_cbe_LBM_handleInOutFlow_exit:
  llvm_cbe_tmp4344_us = &llvm_cbe_dstGrid_2[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))];
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )29);
  LBM_performStreamCollide((&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]), llvm_cbe_tmp4344_us);
  if (((llvm_cbe_t_0_reg2mem_0_us & ((unsigned int )63)) == ((unsigned int )0))) {
    goto llvm_cbe_cond_true52_us;
  } else {
    goto llvm_cbe_bb61_us;
  }

  do {     /* Syntactic loop 'bb662.i' to make GCC happy */
llvm_cbe_bb662_i:
  llvm_cbe_indvar_i = llvm_cbe_indvar_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )30);
  CallEdgeProfiler(llvm_cbe_val315, llvm_cbe_val416, ((unsigned int )30));
  llvm_cbe_tmp_i203 = llvm_cbe_indvar_i * ((unsigned int )20);
  llvm_cbe_tmp668_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600000)))))]);
  llvm_cbe_tmp674_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600001)))))]);
  llvm_cbe_tmp681_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600002)))))]);
  llvm_cbe_tmp688_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600003)))))]);
  llvm_cbe_tmp695_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600004)))))]);
  llvm_cbe_tmp702_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600005)))))]);
  llvm_cbe_tmp709_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600006)))))]);
  llvm_cbe_tmp716_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600007)))))]);
  llvm_cbe_tmp723_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600008)))))]);
  llvm_cbe_tmp730_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600009)))))]);
  llvm_cbe_tmp737_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600010)))))]);
  llvm_cbe_tmp744_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600011)))))]);
  llvm_cbe_tmp751_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600012)))))]);
  llvm_cbe_tmp758_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600013)))))]);
  llvm_cbe_tmp765_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600014)))))]);
  llvm_cbe_tmp772_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600015)))))]);
  llvm_cbe_tmp779_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600016)))))]);
  llvm_cbe_tmp786_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600017)))))]);
  llvm_cbe_tmp793_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25600018)))))]);
  llvm_cbe_tmp794_i = (((((((((((((((((llvm_cbe_tmp668_i + llvm_cbe_tmp674_i) + llvm_cbe_tmp681_i) + llvm_cbe_tmp688_i) + llvm_cbe_tmp695_i) + llvm_cbe_tmp702_i) + llvm_cbe_tmp709_i) + llvm_cbe_tmp716_i) + llvm_cbe_tmp723_i) + llvm_cbe_tmp730_i) + llvm_cbe_tmp737_i) + llvm_cbe_tmp744_i) + llvm_cbe_tmp751_i) + llvm_cbe_tmp758_i) + llvm_cbe_tmp765_i) + llvm_cbe_tmp772_i) + llvm_cbe_tmp779_i) + llvm_cbe_tmp786_i) + llvm_cbe_tmp793_i;
  llvm_cbe_tmp1016_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400000)))))]);
  llvm_cbe_tmp1022_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400001)))))]);
  llvm_cbe_tmp1029_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400002)))))]);
  llvm_cbe_tmp1036_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400003)))))]);
  llvm_cbe_tmp1043_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400004)))))]);
  llvm_cbe_tmp1050_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400005)))))]);
  llvm_cbe_tmp1057_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400006)))))]);
  llvm_cbe_tmp1064_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400007)))))]);
  llvm_cbe_tmp1071_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400008)))))]);
  llvm_cbe_tmp1078_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400009)))))]);
  llvm_cbe_tmp1085_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400010)))))]);
  llvm_cbe_tmp1092_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400011)))))]);
  llvm_cbe_tmp1099_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400012)))))]);
  llvm_cbe_tmp1106_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400013)))))]);
  llvm_cbe_tmp1113_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400014)))))]);
  llvm_cbe_tmp1120_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400015)))))]);
  llvm_cbe_tmp1127_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400016)))))]);
  llvm_cbe_tmp1134_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400017)))))]);
  llvm_cbe_tmp1141_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25400018)))))]);
  llvm_cbe_tmp1142_i = (((((((((((((((((llvm_cbe_tmp1016_i + llvm_cbe_tmp1022_i) + llvm_cbe_tmp1029_i) + llvm_cbe_tmp1036_i) + llvm_cbe_tmp1043_i) + llvm_cbe_tmp1050_i) + llvm_cbe_tmp1057_i) + llvm_cbe_tmp1064_i) + llvm_cbe_tmp1071_i) + llvm_cbe_tmp1078_i) + llvm_cbe_tmp1085_i) + llvm_cbe_tmp1092_i) + llvm_cbe_tmp1099_i) + llvm_cbe_tmp1106_i) + llvm_cbe_tmp1113_i) + llvm_cbe_tmp1120_i) + llvm_cbe_tmp1127_i) + llvm_cbe_tmp1134_i) + llvm_cbe_tmp1141_i;
  llvm_cbe_tmp1362_i = (((((((((((llvm_cbe_tmp688_i - llvm_cbe_tmp695_i) + llvm_cbe_tmp716_i) - llvm_cbe_tmp723_i) + llvm_cbe_tmp730_i) - llvm_cbe_tmp737_i) + llvm_cbe_tmp772_i) + llvm_cbe_tmp779_i) - llvm_cbe_tmp786_i) - llvm_cbe_tmp793_i) / llvm_cbe_tmp794_i) * 0x1p+1) - ((((((((((llvm_cbe_tmp1036_i - llvm_cbe_tmp1043_i) + llvm_cbe_tmp1064_i) - llvm_cbe_tmp1071_i) + llvm_cbe_tmp1078_i) - llvm_cbe_tmp1085_i) + llvm_cbe_tmp1120_i) + llvm_cbe_tmp1127_i) - llvm_cbe_tmp1134_i) - llvm_cbe_tmp1141_i) / llvm_cbe_tmp1142_i);
  llvm_cbe_tmp1366_i = (((((((((((llvm_cbe_tmp674_i - llvm_cbe_tmp681_i) + llvm_cbe_tmp716_i) + llvm_cbe_tmp723_i) - llvm_cbe_tmp730_i) - llvm_cbe_tmp737_i) + llvm_cbe_tmp744_i) + llvm_cbe_tmp751_i) - llvm_cbe_tmp758_i) - llvm_cbe_tmp765_i) / llvm_cbe_tmp794_i) * 0x1p+1) - ((((((((((llvm_cbe_tmp1022_i - llvm_cbe_tmp1029_i) + llvm_cbe_tmp1064_i) + llvm_cbe_tmp1071_i) - llvm_cbe_tmp1078_i) - llvm_cbe_tmp1085_i) + llvm_cbe_tmp1092_i) + llvm_cbe_tmp1099_i) - llvm_cbe_tmp1106_i) - llvm_cbe_tmp1113_i) / llvm_cbe_tmp1142_i);
  llvm_cbe_tmp1370_i = (((((((((((llvm_cbe_tmp702_i - llvm_cbe_tmp709_i) + llvm_cbe_tmp744_i) - llvm_cbe_tmp751_i) + llvm_cbe_tmp758_i) - llvm_cbe_tmp765_i) + llvm_cbe_tmp772_i) - llvm_cbe_tmp779_i) + llvm_cbe_tmp786_i) - llvm_cbe_tmp793_i) / llvm_cbe_tmp794_i) * 0x1p+1) - ((((((((((llvm_cbe_tmp1050_i - llvm_cbe_tmp1057_i) + llvm_cbe_tmp1092_i) - llvm_cbe_tmp1099_i) + llvm_cbe_tmp1106_i) - llvm_cbe_tmp1113_i) + llvm_cbe_tmp1120_i) - llvm_cbe_tmp1127_i) + llvm_cbe_tmp1134_i) - llvm_cbe_tmp1141_i) / llvm_cbe_tmp1142_i);
  llvm_cbe_tmp1382_i = (((llvm_cbe_tmp1362_i * llvm_cbe_tmp1362_i) + (llvm_cbe_tmp1366_i * llvm_cbe_tmp1366_i)) + (llvm_cbe_tmp1370_i * llvm_cbe_tmp1370_i)) * 0x1.8p+0;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800000)))))]) = ((0x1p+0 - llvm_cbe_tmp1382_i) * 0x1.5555555555555p-2);
  llvm_cbe_tmp1397_i = llvm_cbe_tmp1366_i * 0x1.2p+2;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800001)))))]) = (((((llvm_cbe_tmp1397_i + 0x1.8p+1) * llvm_cbe_tmp1366_i) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-5);
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800002)))))]) = (((((llvm_cbe_tmp1397_i - 0x1.8p+1) * llvm_cbe_tmp1366_i) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-5);
  llvm_cbe_tmp1429_i = llvm_cbe_tmp1362_i * 0x1.2p+2;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800003)))))]) = (((((llvm_cbe_tmp1429_i + 0x1.8p+1) * llvm_cbe_tmp1362_i) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-5);
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800004)))))]) = (((((llvm_cbe_tmp1429_i - 0x1.8p+1) * llvm_cbe_tmp1362_i) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-5);
  llvm_cbe_tmp1461_i = llvm_cbe_tmp1370_i * 0x1.2p+2;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800005)))))]) = (((((llvm_cbe_tmp1461_i + 0x1.8p+1) * llvm_cbe_tmp1370_i) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-5);
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800006)))))]) = (((((llvm_cbe_tmp1461_i - 0x1.8p+1) * llvm_cbe_tmp1370_i) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-5);
  llvm_cbe_tmp1494_i = llvm_cbe_tmp1362_i + llvm_cbe_tmp1366_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800007)))))]) = ((((llvm_cbe_tmp1494_i * ((llvm_cbe_tmp1494_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1514_i = llvm_cbe_tmp1366_i - llvm_cbe_tmp1362_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800008)))))]) = ((((llvm_cbe_tmp1514_i * ((llvm_cbe_tmp1514_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1535_i = llvm_cbe_tmp1362_i - llvm_cbe_tmp1366_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800009)))))]) = ((((llvm_cbe_tmp1535_i * ((llvm_cbe_tmp1535_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1554_i = -(llvm_cbe_tmp1362_i);
  llvm_cbe_tmp1556_i = llvm_cbe_tmp1554_i - llvm_cbe_tmp1366_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800010)))))]) = ((((llvm_cbe_tmp1556_i * ((llvm_cbe_tmp1556_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1577_i = llvm_cbe_tmp1366_i + llvm_cbe_tmp1370_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800011)))))]) = ((((llvm_cbe_tmp1577_i * ((llvm_cbe_tmp1577_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1597_i = llvm_cbe_tmp1366_i - llvm_cbe_tmp1370_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800012)))))]) = ((((llvm_cbe_tmp1597_i * ((llvm_cbe_tmp1597_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1617_i = llvm_cbe_tmp1370_i - llvm_cbe_tmp1366_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800013)))))]) = ((((llvm_cbe_tmp1617_i * ((llvm_cbe_tmp1617_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1638_i = (-(llvm_cbe_tmp1366_i)) - llvm_cbe_tmp1370_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800014)))))]) = ((((llvm_cbe_tmp1638_i * ((llvm_cbe_tmp1638_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1659_i = llvm_cbe_tmp1362_i + llvm_cbe_tmp1370_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800015)))))]) = ((((llvm_cbe_tmp1659_i * ((llvm_cbe_tmp1659_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1679_i = llvm_cbe_tmp1362_i - llvm_cbe_tmp1370_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800016)))))]) = ((((llvm_cbe_tmp1679_i * ((llvm_cbe_tmp1679_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1699_i = llvm_cbe_tmp1370_i - llvm_cbe_tmp1362_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800017)))))]) = ((((llvm_cbe_tmp1699_i * ((llvm_cbe_tmp1699_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_tmp1720_i = llvm_cbe_tmp1554_i - llvm_cbe_tmp1370_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp_i203 + ((unsigned int )25800018)))))]) = ((((llvm_cbe_tmp1720_i * ((llvm_cbe_tmp1720_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp1382_i) * 0x1.c71c71c71c71cp-6);
  llvm_cbe_indvar_next_i = llvm_cbe_indvar_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val416;
  *(&cg_caller_id_var) = llvm_cbe_val315;
  if ((llvm_cbe_indvar_next_i == ((unsigned int )10000))) {
    goto llvm_cbe_LBM_handleInOutFlow_exit;
  } else {
    llvm_cbe_indvar_i__PHI_TEMPORARY = llvm_cbe_indvar_next_i;   /* for PHI node */
    goto llvm_cbe_bb662_i;
  }

  } while (1); /* end of syntactic loop 'bb662.i' */
  do {     /* Syntactic loop 'bb.i' to make GCC happy */
llvm_cbe_bb_i:
  llvm_cbe_indvar1808_i = llvm_cbe_indvar1808_i__PHI_TEMPORARY;
  llvm_cbe_val315 = *(&cg_caller_id_var);
  llvm_cbe_val416 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )31);
  CallEdgeProfiler(llvm_cbe_val315, llvm_cbe_val416, ((unsigned int )31));
  llvm_cbe_i_0_reg2mem_0_i = llvm_cbe_indvar1808_i * ((unsigned int )20);
  llvm_cbe_tmp5_i132 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200000)))))]);
  llvm_cbe_tmp11_i135 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200001)))))]);
  llvm_cbe_tmp19_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200002)))))]);
  llvm_cbe_tmp26_i140 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200003)))))]);
  llvm_cbe_tmp33_i142 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200004)))))]);
  llvm_cbe_tmp40_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200005)))))]);
  llvm_cbe_tmp47_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200006)))))]);
  llvm_cbe_tmp54_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200007)))))]);
  llvm_cbe_tmp61_i147 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200008)))))]);
  llvm_cbe_tmp68_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200009)))))]);
  llvm_cbe_tmp75_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200010)))))]);
  llvm_cbe_tmp83_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200011)))))]);
  llvm_cbe_tmp90_i153 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200012)))))]);
  llvm_cbe_tmp97_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200013)))))]);
  llvm_cbe_tmp104_i156 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200014)))))]);
  llvm_cbe_tmp111_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200015)))))]);
  llvm_cbe_tmp118_i160 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200016)))))]);
  llvm_cbe_tmp125_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200017)))))]);
  llvm_cbe_tmp132_i162 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )200018)))))]);
  llvm_cbe_tmp139_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400000)))))]);
  llvm_cbe_tmp145_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400001)))))]);
  llvm_cbe_tmp152_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400002)))))]);
  llvm_cbe_tmp159_i168 = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400003)))))]);
  llvm_cbe_tmp166_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400004)))))]);
  llvm_cbe_tmp173_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400005)))))]);
  llvm_cbe_tmp180_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400006)))))]);
  llvm_cbe_tmp187_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400007)))))]);
  llvm_cbe_tmp194_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400008)))))]);
  llvm_cbe_tmp201_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400009)))))]);
  llvm_cbe_tmp208_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400010)))))]);
  llvm_cbe_tmp215_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400011)))))]);
  llvm_cbe_tmp222_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400012)))))]);
  llvm_cbe_tmp229_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400013)))))]);
  llvm_cbe_tmp236_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400014)))))]);
  llvm_cbe_tmp243_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400015)))))]);
  llvm_cbe_tmp250_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400016)))))]);
  llvm_cbe_tmp257_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400017)))))]);
  llvm_cbe_tmp264_i = *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )400018)))))]);
  llvm_cbe_tmp269_i185 = (((((((((((((((((((llvm_cbe_tmp5_i132 + llvm_cbe_tmp11_i135) + llvm_cbe_tmp19_i) + llvm_cbe_tmp26_i140) + llvm_cbe_tmp33_i142) + llvm_cbe_tmp40_i) + llvm_cbe_tmp47_i) + llvm_cbe_tmp54_i) + llvm_cbe_tmp61_i147) + llvm_cbe_tmp68_i) + llvm_cbe_tmp75_i) + llvm_cbe_tmp83_i) + llvm_cbe_tmp90_i153) + llvm_cbe_tmp97_i) + llvm_cbe_tmp104_i156) + llvm_cbe_tmp111_i) + llvm_cbe_tmp118_i160) + llvm_cbe_tmp125_i) + llvm_cbe_tmp132_i162) * 0x1p+1) - ((((((((((((((((((llvm_cbe_tmp139_i + llvm_cbe_tmp145_i) + llvm_cbe_tmp152_i) + llvm_cbe_tmp159_i168) + llvm_cbe_tmp166_i) + llvm_cbe_tmp173_i) + llvm_cbe_tmp180_i) + llvm_cbe_tmp187_i) + llvm_cbe_tmp194_i) + llvm_cbe_tmp201_i) + llvm_cbe_tmp208_i) + llvm_cbe_tmp215_i) + llvm_cbe_tmp222_i) + llvm_cbe_tmp229_i) + llvm_cbe_tmp236_i) + llvm_cbe_tmp243_i) + llvm_cbe_tmp250_i) + llvm_cbe_tmp257_i) + llvm_cbe_tmp264_i);
  llvm_cbe_tmp275_i = ((((double )(signed int )(((signed int )(((signed int )(((signed int )(((signed int )llvm_cbe_i_0_reg2mem_0_i) / ((signed int )((unsigned int )20)))))) % ((signed int )((unsigned int )100))))))) / 0x1.8cp+5) - 0x1p+0;
  llvm_cbe_tmp281_i = ((((double )(signed int )(((signed int )(((signed int )(((signed int )(((signed int )llvm_cbe_i_0_reg2mem_0_i) / ((signed int )((unsigned int )2000)))))) % ((signed int )((unsigned int )100))))))) / 0x1.8cp+5) - 0x1p+0;
  llvm_cbe_tmp291_i = ((0x1p+0 - (llvm_cbe_tmp275_i * llvm_cbe_tmp275_i)) * 0x1.47ae147ae147bp-7) * (0x1p+0 - (llvm_cbe_tmp281_i * llvm_cbe_tmp281_i));
  llvm_cbe_tmp303_i = ((llvm_cbe_tmp291_i * llvm_cbe_tmp291_i) + 0x0p+0) * 0x1.8p+0;
  llvm_cbe_tmp307_i = 0x1p+0 - llvm_cbe_tmp303_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i)))]) = ((llvm_cbe_tmp269_i185 * 0x1.5555555555555p-2) * llvm_cbe_tmp307_i);
  llvm_cbe_tmp316_i190 = llvm_cbe_tmp269_i185 * 0x1.c71c71c71c71cp-5;
  llvm_cbe_tmp325_i = llvm_cbe_tmp316_i190 * llvm_cbe_tmp307_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )1)))))]) = llvm_cbe_tmp325_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )2)))))]) = llvm_cbe_tmp325_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )3)))))]) = llvm_cbe_tmp325_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )4)))))]) = llvm_cbe_tmp325_i;
  llvm_cbe_tmp382_i = llvm_cbe_tmp291_i * 0x1.2p+2;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )5)))))]) = (llvm_cbe_tmp316_i190 * ((((llvm_cbe_tmp382_i + 0x1.8p+1) * llvm_cbe_tmp291_i) + 0x1p+0) - llvm_cbe_tmp303_i));
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )6)))))]) = (llvm_cbe_tmp316_i190 * ((((llvm_cbe_tmp382_i - 0x1.8p+1) * llvm_cbe_tmp291_i) + 0x1p+0) - llvm_cbe_tmp303_i));
  llvm_cbe_tmp412_i = llvm_cbe_tmp269_i185 * 0x1.c71c71c71c71cp-6;
  llvm_cbe_tmp425_i = llvm_cbe_tmp412_i * llvm_cbe_tmp307_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )7)))))]) = llvm_cbe_tmp425_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )8)))))]) = llvm_cbe_tmp425_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )9)))))]) = llvm_cbe_tmp425_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )10)))))]) = llvm_cbe_tmp425_i;
  llvm_cbe_tmp497_i = llvm_cbe_tmp291_i + 0x0p+0;
  llvm_cbe_tmp507_i = llvm_cbe_tmp412_i * (((llvm_cbe_tmp497_i * ((llvm_cbe_tmp497_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp303_i);
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )11)))))]) = llvm_cbe_tmp507_i;
  llvm_cbe_tmp517_i = 0x0p+0 - llvm_cbe_tmp291_i;
  llvm_cbe_tmp527_i = llvm_cbe_tmp412_i * (((llvm_cbe_tmp517_i * ((llvm_cbe_tmp517_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp303_i);
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )12)))))]) = llvm_cbe_tmp527_i;
  llvm_cbe_tmp537_i = llvm_cbe_tmp291_i - 0x0p+0;
  llvm_cbe_tmp547_i = llvm_cbe_tmp412_i * (((llvm_cbe_tmp537_i * ((llvm_cbe_tmp537_i * 0x1.2p+2) + 0x1.8p+1)) + 0x1p+0) - llvm_cbe_tmp303_i);
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )13)))))]) = llvm_cbe_tmp547_i;
  llvm_cbe_tmp558_i = -(llvm_cbe_tmp291_i);
  llvm_cbe_tmp569_i = llvm_cbe_tmp412_i * (((((llvm_cbe_tmp558_i * 0x1.2p+2) + 0x1.8p+1) * llvm_cbe_tmp558_i) + 0x1p+0) - llvm_cbe_tmp303_i);
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )14)))))]) = llvm_cbe_tmp569_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )15)))))]) = llvm_cbe_tmp507_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )16)))))]) = llvm_cbe_tmp527_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )17)))))]) = llvm_cbe_tmp547_i;
  *(&llvm_cbe_srcGrid_2[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )18)))))]) = llvm_cbe_tmp569_i;
  llvm_cbe_indvar_next1809_i = llvm_cbe_indvar1808_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val416;
  *(&cg_caller_id_var) = llvm_cbe_val315;
  if ((llvm_cbe_indvar_next1809_i == ((unsigned int )10000))) {
    llvm_cbe_indvar_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb662_i;
  } else {
    llvm_cbe_indvar1808_i__PHI_TEMPORARY = llvm_cbe_indvar_next1809_i;   /* for PHI node */
    goto llvm_cbe_bb_i;
  }

  } while (1); /* end of syntactic loop 'bb.i' */
llvm_cbe_cond_true52_us:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )29);
  llvm_cbe_tmp55_us = printf((&(_2E_str610[((signed long long )((unsigned long long )0ll))])), llvm_cbe_t_0_reg2mem_0_us);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )29);
  LBM_showGridStatistics(llvm_cbe_tmp4344_us);
  goto llvm_cbe_bb61_us;

  } while (1); /* end of syntactic loop 'bb.us' */
  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_srcGrid_0 = llvm_cbe_srcGrid_0__PHI_TEMPORARY;
  llvm_cbe_dstGrid_0 = llvm_cbe_dstGrid_0__PHI_TEMPORARY;
  llvm_cbe_indvar117 = llvm_cbe_indvar117__PHI_TEMPORARY;
  llvm_cbe_val317 = *(&cg_caller_id_var);
  llvm_cbe_val418 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )32);
  CallEdgeProfiler(llvm_cbe_val317, llvm_cbe_val418, ((unsigned int )32));
  llvm_cbe_t_0_reg2mem_0 = llvm_cbe_indvar117 + ((unsigned int )1);
  llvm_cbe_tmp4344 = &llvm_cbe_dstGrid_0[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))];
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )32);
  LBM_performStreamCollide((&llvm_cbe_srcGrid_0[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]), llvm_cbe_tmp4344);
  if (((llvm_cbe_t_0_reg2mem_0 & ((unsigned int )63)) == ((unsigned int )0))) {
    goto llvm_cbe_cond_true52;
  } else {
    goto llvm_cbe_bb61;
  }

llvm_cbe_bb61:
  *(&cg_caller_call_site_var) = llvm_cbe_val418;
  *(&cg_caller_id_var) = llvm_cbe_val317;
  if ((((signed int )llvm_cbe_tmp2425_i) < ((signed int )(llvm_cbe_indvar117 + ((unsigned int )2))))) {
    llvm_cbe_srcGrid_1__PHI_TEMPORARY = llvm_cbe_dstGrid_0;   /* for PHI node */
    llvm_cbe_dstGrid_1__PHI_TEMPORARY = llvm_cbe_srcGrid_0;   /* for PHI node */
    goto llvm_cbe_bb68;
  } else {
    llvm_cbe_srcGrid_0__PHI_TEMPORARY = llvm_cbe_dstGrid_0;   /* for PHI node */
    llvm_cbe_dstGrid_0__PHI_TEMPORARY = llvm_cbe_srcGrid_0;   /* for PHI node */
    llvm_cbe_indvar117__PHI_TEMPORARY = llvm_cbe_t_0_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_bb;
  }

llvm_cbe_cond_true52:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )32);
  llvm_cbe_tmp55 = printf((&(_2E_str610[((signed long long )((unsigned long long )0ll))])), llvm_cbe_t_0_reg2mem_0);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )32);
  LBM_showGridStatistics(llvm_cbe_tmp4344);
  goto llvm_cbe_bb61;

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_bb68:
  llvm_cbe_srcGrid_1 = llvm_cbe_srcGrid_1__PHI_TEMPORARY;
  llvm_cbe_dstGrid_1 = llvm_cbe_dstGrid_1__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = ((unsigned int )29);
  *(&cg_caller_id_var) = ((unsigned int )7);
  LBM_showGridStatistics((&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]));
  switch (llvm_cbe_tmp5354_i) {
  default:
    goto llvm_cbe_cond_next97;
;
  case ((unsigned int )1):
    goto llvm_cbe_cond_true78;
    break;
  case ((unsigned int )2):
    goto llvm_cbe_cond_true91;
  }
llvm_cbe_cond_true78:
  *(&cg_caller_call_site_var) = ((unsigned int )30);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp7_i19 = fopen(llvm_cbe_tmp33_i, (&(_2E_str17[((signed long long )((unsigned long long )0ll))])));
  llvm_cbe_tmp714715_i = ((unsigned char *)(&llvm_cbe_fileUx_i));
  llvm_cbe_tmp756757_i = ((unsigned char *)(&llvm_cbe_fileUy_i));
  llvm_cbe_tmp798799_i = ((unsigned char *)(&llvm_cbe_fileUz_i));
  llvm_cbe_z_0_reg2mem_0_ph_i20__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_maxDiff2_2_ph_i__PHI_TEMPORARY = -0x1.93e594p+99;   /* for PHI node */
  goto llvm_cbe_bb883_outer_i;

  do {     /* Syntactic loop 'bb883.outer.i' to make GCC happy */
llvm_cbe_bb883_outer_i:
  llvm_cbe_z_0_reg2mem_0_ph_i20 = llvm_cbe_z_0_reg2mem_0_ph_i20__PHI_TEMPORARY;
  llvm_cbe_maxDiff2_2_ph_i = llvm_cbe_maxDiff2_2_ph_i__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )23);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )23));
  llvm_cbe_tmp14_i21 = llvm_cbe_z_0_reg2mem_0_ph_i20 * ((unsigned int )10000);
  llvm_cbe_y_0969_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_maxDiff2_2968_i__PHI_TEMPORARY = llvm_cbe_maxDiff2_2_ph_i;   /* for PHI node */
  goto llvm_cbe_bb875_preheader_i;

llvm_cbe_bb891_i:
  llvm_cbe_indvar_next979_i = llvm_cbe_z_0_reg2mem_0_ph_i20 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next979_i == ((unsigned int )130))) {
    goto llvm_cbe_LBM_compareVelocityField_exit;
  } else {
    llvm_cbe_z_0_reg2mem_0_ph_i20__PHI_TEMPORARY = llvm_cbe_indvar_next979_i;   /* for PHI node */
    llvm_cbe_maxDiff2_2_ph_i__PHI_TEMPORARY = llvm_cbe_maxDiff2_0_i;   /* for PHI node */
    goto llvm_cbe_bb883_outer_i;
  }

  do {     /* Syntactic loop 'bb875.preheader.i' to make GCC happy */
llvm_cbe_bb875_preheader_i:
  llvm_cbe_y_0969_i = llvm_cbe_y_0969_i__PHI_TEMPORARY;
  llvm_cbe_maxDiff2_2968_i = llvm_cbe_maxDiff2_2968_i__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )24);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )24));
  llvm_cbe_tmp15_i121 = (llvm_cbe_y_0969_i * ((unsigned int )100)) + llvm_cbe_tmp14_i21;
  llvm_cbe_x_0965_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_maxDiff2_1964_i__PHI_TEMPORARY = llvm_cbe_maxDiff2_2968_i;   /* for PHI node */
  goto llvm_cbe_bb9_i119;

llvm_cbe_bb880_i:
  llvm_cbe_indvar_next977_i = llvm_cbe_y_0969_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_indvar_next977_i == ((unsigned int )100))) {
    goto llvm_cbe_bb891_i;
  } else {
    llvm_cbe_y_0969_i__PHI_TEMPORARY = llvm_cbe_indvar_next977_i;   /* for PHI node */
    llvm_cbe_maxDiff2_2968_i__PHI_TEMPORARY = llvm_cbe_maxDiff2_0_i;   /* for PHI node */
    goto llvm_cbe_bb875_preheader_i;
  }

  do {     /* Syntactic loop 'bb9.i119' to make GCC happy */
llvm_cbe_bb9_i119:
  llvm_cbe_x_0965_i = llvm_cbe_x_0965_i__PHI_TEMPORARY;
  llvm_cbe_maxDiff2_1964_i = llvm_cbe_maxDiff2_1964_i__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )25);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )25));
  llvm_cbe_tmp18_i23 = (llvm_cbe_tmp15_i121 + llvm_cbe_x_0965_i) * ((unsigned int )20);
  llvm_cbe_tmp22_i26 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )llvm_cbe_tmp18_i23)))]);
  llvm_cbe_tmp35_i30 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )1)))))]);
  llvm_cbe_tmp49_i35 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )2)))))]);
  llvm_cbe_tmp63_i40 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )3)))))]);
  llvm_cbe_tmp77_i45 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )4)))))]);
  llvm_cbe_tmp91_i50 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )5)))))]);
  llvm_cbe_tmp105_i55 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )6)))))]);
  llvm_cbe_tmp119_i60 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )7)))))]);
  llvm_cbe_tmp133_i65 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )8)))))]);
  llvm_cbe_tmp147_i70 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )9)))))]);
  llvm_cbe_tmp161_i75 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )10)))))]);
  llvm_cbe_tmp175_i80 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )11)))))]);
  llvm_cbe_tmp189_i85 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )12)))))]);
  llvm_cbe_tmp203_i90 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )13)))))]);
  llvm_cbe_tmp217_i95 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )14)))))]);
  llvm_cbe_tmp231_i100 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )15)))))]);
  llvm_cbe_tmp245_i105 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )16)))))]);
  llvm_cbe_tmp259_i110 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )17)))))]);
  llvm_cbe_tmp273_i115 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i23 + ((unsigned int )18)))))]);
  llvm_cbe_tmp274_i116 = (((((((((((((((((llvm_cbe_tmp22_i26 + llvm_cbe_tmp35_i30) + llvm_cbe_tmp49_i35) + llvm_cbe_tmp63_i40) + llvm_cbe_tmp77_i45) + llvm_cbe_tmp91_i50) + llvm_cbe_tmp105_i55) + llvm_cbe_tmp119_i60) + llvm_cbe_tmp133_i65) + llvm_cbe_tmp147_i70) + llvm_cbe_tmp161_i75) + llvm_cbe_tmp175_i80) + llvm_cbe_tmp189_i85) + llvm_cbe_tmp203_i90) + llvm_cbe_tmp217_i95) + llvm_cbe_tmp231_i100) + llvm_cbe_tmp245_i105) + llvm_cbe_tmp259_i110) + llvm_cbe_tmp273_i115;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )25);
  llvm_cbe_tmp741_i = fread(llvm_cbe_tmp714715_i, ((unsigned long long )4ll), ((unsigned long long )1ll), llvm_cbe_tmp7_i19);
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )25);
  llvm_cbe_tmp783_i = fread(llvm_cbe_tmp756757_i, ((unsigned long long )4ll), ((unsigned long long )1ll), llvm_cbe_tmp7_i19);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )25);
  llvm_cbe_tmp825_i = fread(llvm_cbe_tmp798799_i, ((unsigned long long )4ll), ((unsigned long long )1ll), llvm_cbe_tmp7_i19);
  llvm_cbe_tmp839_i = *(&llvm_cbe_fileUx_i);
  llvm_cbe_tmp842843_i = ((float )(((((((((((llvm_cbe_tmp63_i40 - llvm_cbe_tmp77_i45) + llvm_cbe_tmp119_i60) - llvm_cbe_tmp133_i65) + llvm_cbe_tmp147_i70) - llvm_cbe_tmp161_i75) + llvm_cbe_tmp231_i100) + llvm_cbe_tmp245_i105) - llvm_cbe_tmp259_i110) - llvm_cbe_tmp273_i115) / llvm_cbe_tmp274_i116) - (((double )llvm_cbe_tmp839_i))));
  llvm_cbe_tmp844_i = *(&llvm_cbe_fileUy_i);
  llvm_cbe_tmp847848_i = ((float )(((((((((((llvm_cbe_tmp35_i30 - llvm_cbe_tmp49_i35) + llvm_cbe_tmp119_i60) + llvm_cbe_tmp133_i65) - llvm_cbe_tmp147_i70) - llvm_cbe_tmp161_i75) + llvm_cbe_tmp175_i80) + llvm_cbe_tmp189_i85) - llvm_cbe_tmp203_i90) - llvm_cbe_tmp217_i95) / llvm_cbe_tmp274_i116) - (((double )llvm_cbe_tmp844_i))));
  llvm_cbe_tmp849_i = *(&llvm_cbe_fileUz_i);
  llvm_cbe_tmp852853_i = ((float )(((((((((((llvm_cbe_tmp91_i50 - llvm_cbe_tmp105_i55) + llvm_cbe_tmp175_i80) - llvm_cbe_tmp189_i85) + llvm_cbe_tmp203_i90) - llvm_cbe_tmp217_i95) + llvm_cbe_tmp231_i100) - llvm_cbe_tmp245_i105) + llvm_cbe_tmp259_i110) - llvm_cbe_tmp273_i115) / llvm_cbe_tmp274_i116) - (((double )llvm_cbe_tmp849_i))));
  llvm_cbe_tmp864_i = ((float )((((float )((((float )(llvm_cbe_tmp842843_i * llvm_cbe_tmp842843_i))) + (((float )(llvm_cbe_tmp847848_i * llvm_cbe_tmp847848_i)))))) + (((float )(llvm_cbe_tmp852853_i * llvm_cbe_tmp852853_i)))));
  llvm_cbe_maxDiff2_0_i = (((llvm_fcmp_ogt(llvm_cbe_tmp864_i, llvm_cbe_maxDiff2_1964_i))) ? (llvm_cbe_tmp864_i) : (llvm_cbe_maxDiff2_1964_i));
  llvm_cbe_indvar_next975_i = llvm_cbe_x_0965_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((llvm_cbe_indvar_next975_i == ((unsigned int )100))) {
    goto llvm_cbe_bb880_i;
  } else {
    llvm_cbe_x_0965_i__PHI_TEMPORARY = llvm_cbe_indvar_next975_i;   /* for PHI node */
    llvm_cbe_maxDiff2_1964_i__PHI_TEMPORARY = llvm_cbe_maxDiff2_0_i;   /* for PHI node */
    goto llvm_cbe_bb9_i119;
  }

  } while (1); /* end of syntactic loop 'bb9.i119' */
  } while (1); /* end of syntactic loop 'bb875.preheader.i' */
  } while (1); /* end of syntactic loop 'bb883.outer.i' */
llvm_cbe_LBM_compareVelocityField_exit:
  llvm_cbe_tmp899_i1 = sqrt((((double )llvm_cbe_maxDiff2_0_i)));
  *(&cg_caller_call_site_var) = ((unsigned int )35);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp901_i = printf((&(_2E_str69[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp899_i1);
  *(&cg_caller_call_site_var) = ((unsigned int )36);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp903_i = fclose(llvm_cbe_tmp7_i19);
  goto llvm_cbe_cond_next97;

llvm_cbe_cond_true91:
  *(&cg_caller_call_site_var) = ((unsigned int )37);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp7_i7 = fopen(llvm_cbe_tmp33_i, (&(_2E_str7[((signed long long )((unsigned long long )0ll))])));
  llvm_cbe_tmp718719_i = ((unsigned char *)(&llvm_cbe_ux_i));
  llvm_cbe_tmp760761_i = ((unsigned char *)(&llvm_cbe_uy_i));
  llvm_cbe_tmp802803_i = ((unsigned char *)(&llvm_cbe_uz_i));
  llvm_cbe_z_0_reg2mem_0_ph_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb852_outer_i;

  do {     /* Syntactic loop 'bb852.outer.i' to make GCC happy */
llvm_cbe_bb852_outer_i:
  llvm_cbe_z_0_reg2mem_0_ph_i = llvm_cbe_z_0_reg2mem_0_ph_i__PHI_TEMPORARY;
  llvm_cbe_val35 = *(&cg_caller_id_var);
  llvm_cbe_val46 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )26);
  CallEdgeProfiler(llvm_cbe_val35, llvm_cbe_val46, ((unsigned int )26));
  llvm_cbe_tmp14_i8 = llvm_cbe_z_0_reg2mem_0_ph_i * ((unsigned int )10000);
  llvm_cbe_y_0980_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb844_preheader_i;

llvm_cbe_bb857_i:
  llvm_cbe_indvar_next988_i = llvm_cbe_z_0_reg2mem_0_ph_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((llvm_cbe_indvar_next988_i == ((unsigned int )130))) {
    goto llvm_cbe_LBM_storeVelocityField_exit;
  } else {
    llvm_cbe_z_0_reg2mem_0_ph_i__PHI_TEMPORARY = llvm_cbe_indvar_next988_i;   /* for PHI node */
    goto llvm_cbe_bb852_outer_i;
  }

  do {     /* Syntactic loop 'bb844.preheader.i' to make GCC happy */
llvm_cbe_bb844_preheader_i:
  llvm_cbe_y_0980_i = llvm_cbe_y_0980_i__PHI_TEMPORARY;
  llvm_cbe_val37 = *(&cg_caller_id_var);
  llvm_cbe_val48 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )27);
  CallEdgeProfiler(llvm_cbe_val37, llvm_cbe_val48, ((unsigned int )27));
  llvm_cbe_tmp15_i = (llvm_cbe_y_0980_i * ((unsigned int )100)) + llvm_cbe_tmp14_i8;
  llvm_cbe_indvar983_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb9_i;

llvm_cbe_bb849_i:
  llvm_cbe_indvar_next986_i = llvm_cbe_y_0980_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val48;
  *(&cg_caller_id_var) = llvm_cbe_val37;
  if ((llvm_cbe_indvar_next986_i == ((unsigned int )100))) {
    goto llvm_cbe_bb857_i;
  } else {
    llvm_cbe_y_0980_i__PHI_TEMPORARY = llvm_cbe_indvar_next986_i;   /* for PHI node */
    goto llvm_cbe_bb844_preheader_i;
  }

  do {     /* Syntactic loop 'bb9.i' to make GCC happy */
llvm_cbe_bb9_i:
  llvm_cbe_indvar983_i = llvm_cbe_indvar983_i__PHI_TEMPORARY;
  llvm_cbe_val39 = *(&cg_caller_id_var);
  llvm_cbe_val410 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )28);
  CallEdgeProfiler(llvm_cbe_val39, llvm_cbe_val410, ((unsigned int )28));
  llvm_cbe_tmp18_i = (llvm_cbe_tmp15_i + llvm_cbe_indvar983_i) * ((unsigned int )20);
  llvm_cbe_tmp22_i10 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )llvm_cbe_tmp18_i)))]);
  llvm_cbe_tmp35_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )1)))))]);
  llvm_cbe_tmp49_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )2)))))]);
  llvm_cbe_tmp63_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )3)))))]);
  llvm_cbe_tmp77_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )4)))))]);
  llvm_cbe_tmp91_i14 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )5)))))]);
  llvm_cbe_tmp105_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )6)))))]);
  llvm_cbe_tmp119_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )7)))))]);
  llvm_cbe_tmp133_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )8)))))]);
  llvm_cbe_tmp147_i17 = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )9)))))]);
  llvm_cbe_tmp161_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )10)))))]);
  llvm_cbe_tmp175_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )11)))))]);
  llvm_cbe_tmp189_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )12)))))]);
  llvm_cbe_tmp203_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )13)))))]);
  llvm_cbe_tmp217_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )14)))))]);
  llvm_cbe_tmp231_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )15)))))]);
  llvm_cbe_tmp245_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )16)))))]);
  llvm_cbe_tmp259_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )17)))))]);
  llvm_cbe_tmp273_i = *(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp18_i + ((unsigned int )18)))))]);
  llvm_cbe_tmp274275_i = ((float )((((((((((((((((((llvm_cbe_tmp22_i10 + llvm_cbe_tmp35_i) + llvm_cbe_tmp49_i) + llvm_cbe_tmp63_i) + llvm_cbe_tmp77_i) + llvm_cbe_tmp91_i14) + llvm_cbe_tmp105_i) + llvm_cbe_tmp119_i) + llvm_cbe_tmp133_i) + llvm_cbe_tmp147_i17) + llvm_cbe_tmp161_i) + llvm_cbe_tmp175_i) + llvm_cbe_tmp189_i) + llvm_cbe_tmp203_i) + llvm_cbe_tmp217_i) + llvm_cbe_tmp231_i) + llvm_cbe_tmp245_i) + llvm_cbe_tmp259_i) + llvm_cbe_tmp273_i));
  *(&llvm_cbe_ux_i) = (((float )((((float )(((((((((llvm_cbe_tmp63_i - llvm_cbe_tmp77_i) + llvm_cbe_tmp119_i) - llvm_cbe_tmp133_i) + llvm_cbe_tmp147_i17) - llvm_cbe_tmp161_i) + llvm_cbe_tmp231_i) + llvm_cbe_tmp245_i) - llvm_cbe_tmp259_i) - llvm_cbe_tmp273_i))) / llvm_cbe_tmp274275_i)));
  *(&llvm_cbe_uy_i) = (((float )((((float )(((((((((llvm_cbe_tmp35_i - llvm_cbe_tmp49_i) + llvm_cbe_tmp119_i) + llvm_cbe_tmp133_i) - llvm_cbe_tmp147_i17) - llvm_cbe_tmp161_i) + llvm_cbe_tmp175_i) + llvm_cbe_tmp189_i) - llvm_cbe_tmp203_i) - llvm_cbe_tmp217_i))) / llvm_cbe_tmp274275_i)));
  *(&llvm_cbe_uz_i) = (((float )((((float )(((((((((llvm_cbe_tmp91_i14 - llvm_cbe_tmp105_i) + llvm_cbe_tmp175_i) - llvm_cbe_tmp189_i) + llvm_cbe_tmp203_i) - llvm_cbe_tmp217_i) + llvm_cbe_tmp231_i) - llvm_cbe_tmp245_i) + llvm_cbe_tmp259_i) - llvm_cbe_tmp273_i))) / llvm_cbe_tmp274275_i)));
  llvm_cbe_tmp843_i = llvm_cbe_indvar983_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )28);
  llvm_cbe_tmp745_i = fwrite(llvm_cbe_tmp718719_i, ((unsigned long long )4ll), ((unsigned long long )1ll), llvm_cbe_tmp7_i7);
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )28);
  llvm_cbe_tmp787_i = fwrite(llvm_cbe_tmp760761_i, ((unsigned long long )4ll), ((unsigned long long )1ll), llvm_cbe_tmp7_i7);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )28);
  llvm_cbe_tmp829_i = fwrite(llvm_cbe_tmp802803_i, ((unsigned long long )4ll), ((unsigned long long )1ll), llvm_cbe_tmp7_i7);
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )llvm_cbe_tmp843_i) < ((signed int )((unsigned int )100)))) {
    llvm_cbe_indvar983_i__PHI_TEMPORARY = llvm_cbe_tmp843_i;   /* for PHI node */
    goto llvm_cbe_bb9_i;
  } else {
    goto llvm_cbe_bb849_i;
  }

  } while (1); /* end of syntactic loop 'bb9.i' */
  } while (1); /* end of syntactic loop 'bb844.preheader.i' */
  } while (1); /* end of syntactic loop 'bb852.outer.i' */
llvm_cbe_LBM_storeVelocityField_exit:
  *(&cg_caller_call_site_var) = ((unsigned int )41);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp867_i = fclose(llvm_cbe_tmp7_i7);
  goto llvm_cbe_cond_next97;

llvm_cbe_cond_next97:
   /*tail*/ free((((unsigned char *)(&llvm_cbe_srcGrid_1[((signed int )((unsigned int )0))][((signed long long )((unsigned long long )-400000ll))]))));
   /*tail*/ free((((unsigned char *)(&llvm_cbe_dstGrid_1[((signed int )((unsigned int )0))][((signed long long )((unsigned long long )-400000ll))]))));
  CallProfPrinter();
  return ((unsigned int )0);
}

