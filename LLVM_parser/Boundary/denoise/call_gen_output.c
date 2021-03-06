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

/* Typedefs */
typedef struct l_struct_2E_FILE l_struct_2E_FILE;
typedef struct l_struct_2E__IO_marker l_struct_2E__IO_marker;
typedef struct l_struct_2E_csEdgeStruct l_struct_2E_csEdgeStruct;

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
static void denoise_CPU_stage1(float *llvm_cbe_g, float *llvm_cbe_u);
unsigned int printf(unsigned char *, ...);
static void denoise_CPU_stage2(float *llvm_cbe_T0, float *llvm_cbe_g, float *llvm_cbe_u);
static void denoise(float *llvm_cbe_T0);
unsigned int puts(unsigned char *);
unsigned char *calloc(unsigned long long , unsigned long long );
unsigned int main(unsigned int llvm_cbe_argc, unsigned char **llvm_cbe_argv);
unsigned long long fread(unsigned char *, unsigned long long , unsigned long long , struct l_struct_2E_FILE *);
unsigned char *malloc();
void free(unsigned char *);
void abort(void);
unsigned char *memset(unsigned char *, unsigned int , unsigned long long );
unsigned char *memcpy(unsigned char *, unsigned char *, unsigned long long );
float sqrtf(float );
double sqrt(float );
float sqrtl(float );


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
static unsigned char _2E_str6[24];
static unsigned char _2E_str17[17];
static unsigned char _2E_str28[11];
static unsigned char _2E_str39[11];
static unsigned char _2E_str410[3];
static unsigned char _2E_str511[14];
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
static unsigned char _2E_str6[24] = "m = %d; n = %d; p = %d\n";
static unsigned char _2E_str17[17] = "Now at denoise \r";
static unsigned char _2E_str28[11] = "iter = %d\n";
static unsigned char _2E_str39[11] = "data/T.img";
static unsigned char _2E_str410[3] = "rb";
static unsigned char _2E_str511[14] = "reading error";
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


static void denoise_CPU_stage1(float *llvm_cbe_g, float *llvm_cbe_u) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_indvar448;
  unsigned int llvm_cbe_indvar448__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_p_0_reg2mem_0_ph;
  unsigned int llvm_cbe_tmp5;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_m_0437;
  unsigned long long llvm_cbe_tmp2022;
  float llvm_cbe_tmp24;
  float llvm_cbe_tmp39;
  float llvm_cbe_tmp40;
  float llvm_cbe_tmp100;
  float llvm_cbe_tmp101;
  float llvm_cbe_tmp159;
  float llvm_cbe_tmp160;
  float llvm_cbe_tmp217;
  float llvm_cbe_tmp218;
  float llvm_cbe_tmp276;
  float llvm_cbe_tmp277;
  float llvm_cbe_tmp336;
  float llvm_cbe_tmp337;
  float llvm_cbe_tmp3691;
  unsigned int llvm_cbe_tmp378;
  unsigned int llvm_cbe_indvar445;
  unsigned int llvm_cbe_indvar445__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_n_0439;
  unsigned int llvm_cbe_tmp9;
  unsigned int llvm_cbe_tmp33;
  unsigned int llvm_cbe_tmp94;
  unsigned int llvm_cbe_tmp154444;
  unsigned int llvm_cbe_tmp212;
  unsigned int llvm_cbe_tmp270;
  unsigned int llvm_cbe_tmp330;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )1);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )1));
  llvm_cbe_indvar448__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb390_outer;

  do {     /* Syntactic loop 'bb390.outer' to make GCC happy */
llvm_cbe_bb390_outer:
  llvm_cbe_indvar448 = llvm_cbe_indvar448__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )5);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )5));
  llvm_cbe_p_0_reg2mem_0_ph = llvm_cbe_indvar448 + ((unsigned int )1);
  llvm_cbe_tmp5 = llvm_cbe_p_0_reg2mem_0_ph << ((unsigned int )4);
  llvm_cbe_indvar445__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb381_preheader;

llvm_cbe_bb397:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_p_0_reg2mem_0_ph == ((unsigned int )14))) {
    goto llvm_cbe_return_split;
  } else {
    llvm_cbe_indvar448__PHI_TEMPORARY = llvm_cbe_p_0_reg2mem_0_ph;   /* for PHI node */
    goto llvm_cbe_bb390_outer;
  }

  do {     /* Syntactic loop 'bb381.preheader' to make GCC happy */
llvm_cbe_bb381_preheader:
  llvm_cbe_indvar445 = llvm_cbe_indvar445__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )6);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )6));
  llvm_cbe_n_0439 = llvm_cbe_indvar445 + ((unsigned int )1);
  llvm_cbe_tmp9 = (llvm_cbe_tmp5 + llvm_cbe_n_0439) << ((unsigned int )4);
  llvm_cbe_tmp33 = llvm_cbe_tmp9 + ((unsigned int )16);
  llvm_cbe_tmp94 = llvm_cbe_tmp9 + ((unsigned int )-16);
  llvm_cbe_tmp154444 = llvm_cbe_tmp9 | ((unsigned int )1);
  llvm_cbe_tmp212 = llvm_cbe_tmp9 + ((unsigned int )-1);
  llvm_cbe_tmp270 = llvm_cbe_tmp9 + ((unsigned int )256);
  llvm_cbe_tmp330 = llvm_cbe_tmp9 + ((unsigned int )-256);
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb2;

llvm_cbe_bb387:
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_n_0439 == ((unsigned int )14))) {
    goto llvm_cbe_bb397;
  } else {
    llvm_cbe_indvar445__PHI_TEMPORARY = llvm_cbe_n_0439;   /* for PHI node */
    goto llvm_cbe_bb381_preheader;
  }

  do {     /* Syntactic loop 'bb2' to make GCC happy */
llvm_cbe_bb2:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )7);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )7));
  llvm_cbe_m_0437 = llvm_cbe_indvar + ((unsigned int )1);
  llvm_cbe_tmp2022 = ((signed long long )(signed int )(llvm_cbe_m_0437 + llvm_cbe_tmp9));
  llvm_cbe_tmp24 = *(&llvm_cbe_u[((signed long long )llvm_cbe_tmp2022)]);
  llvm_cbe_tmp39 = *(&llvm_cbe_u[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp33 + llvm_cbe_m_0437))))]);
  llvm_cbe_tmp40 = ((float )(llvm_cbe_tmp24 - llvm_cbe_tmp39));
  llvm_cbe_tmp100 = *(&llvm_cbe_u[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp94 + llvm_cbe_m_0437))))]);
  llvm_cbe_tmp101 = ((float )(llvm_cbe_tmp24 - llvm_cbe_tmp100));
  llvm_cbe_tmp159 = *(&llvm_cbe_u[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp154444 + llvm_cbe_m_0437))))]);
  llvm_cbe_tmp160 = ((float )(llvm_cbe_tmp24 - llvm_cbe_tmp159));
  llvm_cbe_tmp217 = *(&llvm_cbe_u[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp212 + llvm_cbe_m_0437))))]);
  llvm_cbe_tmp218 = ((float )(llvm_cbe_tmp24 - llvm_cbe_tmp217));
  llvm_cbe_tmp276 = *(&llvm_cbe_u[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp270 + llvm_cbe_m_0437))))]);
  llvm_cbe_tmp277 = ((float )(llvm_cbe_tmp24 - llvm_cbe_tmp276));
  llvm_cbe_tmp336 = *(&llvm_cbe_u[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp330 + llvm_cbe_m_0437))))]);
  llvm_cbe_tmp337 = ((float )(llvm_cbe_tmp24 - llvm_cbe_tmp336));
  llvm_cbe_tmp3691 = sqrtf((((float )((((float )((((float )((((float )((((float )((((float )((((float )(llvm_cbe_tmp40 * llvm_cbe_tmp40))) + 0x1.a36e2ep-15))) + (((float )(llvm_cbe_tmp101 * llvm_cbe_tmp101)))))) + (((float )(llvm_cbe_tmp160 * llvm_cbe_tmp160)))))) + (((float )(llvm_cbe_tmp218 * llvm_cbe_tmp218)))))) + (((float )(llvm_cbe_tmp277 * llvm_cbe_tmp277)))))) + (((float )(llvm_cbe_tmp337 * llvm_cbe_tmp337)))))));
  *(&llvm_cbe_g[((signed long long )llvm_cbe_tmp2022)]) = (((float )(0x1p+0 / llvm_cbe_tmp3691)));
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )7);
  llvm_cbe_tmp378 =  /*tail*/ printf((&(_2E_str6[((signed long long )((unsigned long long )0ll))])), llvm_cbe_m_0437, llvm_cbe_n_0439, llvm_cbe_p_0_reg2mem_0_ph);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((llvm_cbe_m_0437 == ((unsigned int )14))) {
    goto llvm_cbe_bb387;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_m_0437;   /* for PHI node */
    goto llvm_cbe_bb2;
  }

  } while (1); /* end of syntactic loop 'bb2' */
  } while (1); /* end of syntactic loop 'bb381.preheader' */
  } while (1); /* end of syntactic loop 'bb390.outer' */
llvm_cbe_return_split:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void denoise_CPU_stage2(float *llvm_cbe_T0, float *llvm_cbe_g, float *llvm_cbe_u) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_indvar461;
  unsigned int llvm_cbe_indvar461__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_p_0_reg2mem_0_ph;
  unsigned int llvm_cbe_tmp13;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_m_0449;
  unsigned long long llvm_cbe_tmp1921;
  float *llvm_cbe_tmp22;
  float llvm_cbe_tmp23;
  float llvm_cbe_tmp36;
  float llvm_cbe_tmp39;
  unsigned long long llvm_cbe_tmp8890;
  float llvm_cbe_tmp92;
  float llvm_cbe_tmp107;
  unsigned long long llvm_cbe_tmp119121;
  float llvm_cbe_tmp123;
  float llvm_cbe_tmp138;
  unsigned long long llvm_cbe_tmp150152;
  float llvm_cbe_tmp154;
  float llvm_cbe_tmp168;
  unsigned long long llvm_cbe_tmp180182;
  float llvm_cbe_tmp184;
  float llvm_cbe_tmp198;
  unsigned long long llvm_cbe_tmp211213;
  float llvm_cbe_tmp215;
  float llvm_cbe_tmp230;
  unsigned long long llvm_cbe_tmp243245;
  float llvm_cbe_tmp247;
  float llvm_cbe_tmp262;
  unsigned int llvm_cbe_tmp392;
  unsigned int llvm_cbe_indvar458;
  unsigned int llvm_cbe_indvar458__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_n_0451;
  unsigned int llvm_cbe_tmp17;
  unsigned int llvm_cbe_tmp86;
  unsigned int llvm_cbe_tmp117;
  unsigned int llvm_cbe_tmp149457;
  unsigned int llvm_cbe_tmp179;
  unsigned int llvm_cbe_tmp209;
  unsigned int llvm_cbe_tmp241;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )2);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )2));
  llvm_cbe_indvar461__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb404_outer;

  do {     /* Syntactic loop 'bb404.outer' to make GCC happy */
llvm_cbe_bb404_outer:
  llvm_cbe_indvar461 = llvm_cbe_indvar461__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )8);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )8));
  llvm_cbe_p_0_reg2mem_0_ph = llvm_cbe_indvar461 + ((unsigned int )1);
  llvm_cbe_tmp13 = llvm_cbe_p_0_reg2mem_0_ph << ((unsigned int )4);
  llvm_cbe_indvar458__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb395_preheader;

llvm_cbe_bb411:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_p_0_reg2mem_0_ph == ((unsigned int )14))) {
    goto llvm_cbe_return_split;
  } else {
    llvm_cbe_indvar461__PHI_TEMPORARY = llvm_cbe_p_0_reg2mem_0_ph;   /* for PHI node */
    goto llvm_cbe_bb404_outer;
  }

  do {     /* Syntactic loop 'bb395.preheader' to make GCC happy */
llvm_cbe_bb395_preheader:
  llvm_cbe_indvar458 = llvm_cbe_indvar458__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )9);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )9));
  llvm_cbe_n_0451 = llvm_cbe_indvar458 + ((unsigned int )1);
  llvm_cbe_tmp17 = (llvm_cbe_tmp13 + llvm_cbe_n_0451) << ((unsigned int )4);
  llvm_cbe_tmp86 = llvm_cbe_tmp17 + ((unsigned int )16);
  llvm_cbe_tmp117 = llvm_cbe_tmp17 + ((unsigned int )-16);
  llvm_cbe_tmp149457 = llvm_cbe_tmp17 | ((unsigned int )1);
  llvm_cbe_tmp179 = llvm_cbe_tmp17 + ((unsigned int )-1);
  llvm_cbe_tmp209 = llvm_cbe_tmp17 + ((unsigned int )256);
  llvm_cbe_tmp241 = llvm_cbe_tmp17 + ((unsigned int )-256);
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb10;

llvm_cbe_bb401:
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_n_0451 == ((unsigned int )14))) {
    goto llvm_cbe_bb411;
  } else {
    llvm_cbe_indvar458__PHI_TEMPORARY = llvm_cbe_n_0451;   /* for PHI node */
    goto llvm_cbe_bb395_preheader;
  }

  do {     /* Syntactic loop 'bb10' to make GCC happy */
llvm_cbe_bb10:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )10);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )10));
  llvm_cbe_m_0449 = llvm_cbe_indvar + ((unsigned int )1);
  llvm_cbe_tmp1921 = ((signed long long )(signed int )(llvm_cbe_m_0449 + llvm_cbe_tmp17));
  llvm_cbe_tmp22 = &llvm_cbe_u[((signed long long )llvm_cbe_tmp1921)];
  llvm_cbe_tmp23 = *llvm_cbe_tmp22;
  llvm_cbe_tmp36 = *(&llvm_cbe_T0[((signed long long )llvm_cbe_tmp1921)]);
  llvm_cbe_tmp39 = ((float )((((float )(llvm_cbe_tmp23 * llvm_cbe_tmp36))) / 0x1.47ae16p-9));
  llvm_cbe_tmp8890 = ((signed long long )(signed int )(llvm_cbe_tmp86 + llvm_cbe_m_0449));
  llvm_cbe_tmp92 = *(&llvm_cbe_u[((signed long long )llvm_cbe_tmp8890)]);
  llvm_cbe_tmp107 = *(&llvm_cbe_g[((signed long long )llvm_cbe_tmp8890)]);
  llvm_cbe_tmp119121 = ((signed long long )(signed int )(llvm_cbe_tmp117 + llvm_cbe_m_0449));
  llvm_cbe_tmp123 = *(&llvm_cbe_u[((signed long long )llvm_cbe_tmp119121)]);
  llvm_cbe_tmp138 = *(&llvm_cbe_g[((signed long long )llvm_cbe_tmp119121)]);
  llvm_cbe_tmp150152 = ((signed long long )(signed int )(llvm_cbe_tmp149457 + llvm_cbe_m_0449));
  llvm_cbe_tmp154 = *(&llvm_cbe_u[((signed long long )llvm_cbe_tmp150152)]);
  llvm_cbe_tmp168 = *(&llvm_cbe_g[((signed long long )llvm_cbe_tmp150152)]);
  llvm_cbe_tmp180182 = ((signed long long )(signed int )(llvm_cbe_tmp179 + llvm_cbe_m_0449));
  llvm_cbe_tmp184 = *(&llvm_cbe_u[((signed long long )llvm_cbe_tmp180182)]);
  llvm_cbe_tmp198 = *(&llvm_cbe_g[((signed long long )llvm_cbe_tmp180182)]);
  llvm_cbe_tmp211213 = ((signed long long )(signed int )(llvm_cbe_tmp209 + llvm_cbe_m_0449));
  llvm_cbe_tmp215 = *(&llvm_cbe_u[((signed long long )llvm_cbe_tmp211213)]);
  llvm_cbe_tmp230 = *(&llvm_cbe_g[((signed long long )llvm_cbe_tmp211213)]);
  llvm_cbe_tmp243245 = ((signed long long )(signed int )(llvm_cbe_tmp241 + llvm_cbe_m_0449));
  llvm_cbe_tmp247 = *(&llvm_cbe_u[((signed long long )llvm_cbe_tmp243245)]);
  llvm_cbe_tmp262 = *(&llvm_cbe_g[((signed long long )llvm_cbe_tmp243245)]);
  *llvm_cbe_tmp22 = (((float )((((float )(llvm_cbe_tmp23 + (((float )((((float )((((float )((((float )((((float )((((float )((((float )((((float )(llvm_cbe_tmp92 * llvm_cbe_tmp107))) + (((float )(llvm_cbe_tmp123 * llvm_cbe_tmp138)))))) + (((float )(llvm_cbe_tmp154 * llvm_cbe_tmp168)))))) + (((float )(llvm_cbe_tmp184 * llvm_cbe_tmp198)))))) + (((float )(llvm_cbe_tmp215 * llvm_cbe_tmp230)))))) + (((float )(llvm_cbe_tmp247 * llvm_cbe_tmp262)))))) + (((float )((((float )(llvm_cbe_tmp36 * 0x1.9ffffep+4))) * (((float )((((float )((((float )((((float )((((float )(llvm_cbe_tmp39 + 0x1.e66b4p-1))) * llvm_cbe_tmp39))) + 0x1.31d92cp+1))) * llvm_cbe_tmp39))) / (((float )((((float )((((float )((((float )((((float )(llvm_cbe_tmp39 + 0x1.7d475ap+0))) * llvm_cbe_tmp39))) + 0x1.49a708p+1))) * llvm_cbe_tmp39))) + 0x1.29cd0cp+2)))))))))))) * 0x1.4p+2)))))) / (((float )((((float )((((float )((((float )((((float )((((float )((((float )((((float )(llvm_cbe_tmp107 + llvm_cbe_tmp138))) + llvm_cbe_tmp168))) + llvm_cbe_tmp198))) + llvm_cbe_tmp230))) + llvm_cbe_tmp262))) + 0x1.9ffffep+4))) * 0x1.4p+2))) + 0x1p+0))))));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )10);
  llvm_cbe_tmp392 =  /*tail*/ printf((&(_2E_str6[((signed long long )((unsigned long long )0ll))])), llvm_cbe_m_0449, llvm_cbe_n_0451, llvm_cbe_p_0_reg2mem_0_ph);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((llvm_cbe_m_0449 == ((unsigned int )14))) {
    goto llvm_cbe_bb401;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_m_0449;   /* for PHI node */
    goto llvm_cbe_bb10;
  }

  } while (1); /* end of syntactic loop 'bb10' */
  } while (1); /* end of syntactic loop 'bb395.preheader' */
  } while (1); /* end of syntactic loop 'bb404.outer' */
llvm_cbe_return_split:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void denoise(float *llvm_cbe_T0) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp1;
  unsigned char *llvm_cbe_tmp9;
  float *llvm_cbe_tmp910;
  unsigned char *llvm_cbe_tmp2123;
  unsigned char *ltmp_11_2;
  unsigned char *llvm_cbe_tmp30;
  float *llvm_cbe_tmp3031;
  unsigned int llvm_cbe_tmp40;
  unsigned int llvm_cbe_tmp40_1;
  unsigned int llvm_cbe_tmp40_2;
  unsigned char *ltmp_12_2;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )3);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )3));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )3);
  llvm_cbe_tmp1 =  /*tail*/ puts((&(_2E_str17[((signed long long )((unsigned long long )0ll))])));
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )3);
  llvm_cbe_tmp9 =  /*tail*/ calloc(((unsigned long long )4096ll), ((unsigned long long )4ll));
  llvm_cbe_tmp910 = ((float *)llvm_cbe_tmp9);
  llvm_cbe_tmp2123 = ((unsigned char *)llvm_cbe_T0);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )3);
  ltmp_11_2 = memcpy(llvm_cbe_tmp9, llvm_cbe_tmp2123, ((unsigned long long )16384ll));
  *(&cg_caller_call_site_var) = ((unsigned int )3);
  *(&cg_caller_id_var) = ((unsigned int )3);
  llvm_cbe_tmp30 =  /*tail*/ calloc(((unsigned long long )4096ll), ((unsigned long long )4ll));
  llvm_cbe_tmp3031 = ((float *)llvm_cbe_tmp30);
  *(&cg_caller_call_site_var) = ((unsigned int )4);
  *(&cg_caller_id_var) = ((unsigned int )3);
   /*tail*/ denoise_CPU_stage1(llvm_cbe_tmp3031, llvm_cbe_tmp910);
  *(&cg_caller_call_site_var) = ((unsigned int )5);
  *(&cg_caller_id_var) = ((unsigned int )3);
   /*tail*/ denoise_CPU_stage2(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
  *(&cg_caller_call_site_var) = ((unsigned int )6);
  *(&cg_caller_id_var) = ((unsigned int )3);
  llvm_cbe_tmp40 =  /*tail*/ printf((&(_2E_str28[((signed long long )((unsigned long long )0ll))])), ((unsigned int )0));
  *(&cg_caller_call_site_var) = ((unsigned int )7);
  *(&cg_caller_id_var) = ((unsigned int )3);
   /*tail*/ denoise_CPU_stage1(llvm_cbe_tmp3031, llvm_cbe_tmp910);
  *(&cg_caller_call_site_var) = ((unsigned int )8);
  *(&cg_caller_id_var) = ((unsigned int )3);
   /*tail*/ denoise_CPU_stage2(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
  *(&cg_caller_call_site_var) = ((unsigned int )9);
  *(&cg_caller_id_var) = ((unsigned int )3);
  llvm_cbe_tmp40_1 =  /*tail*/ printf((&(_2E_str28[((signed long long )((unsigned long long )0ll))])), ((unsigned int )1));
  *(&cg_caller_call_site_var) = ((unsigned int )10);
  *(&cg_caller_id_var) = ((unsigned int )3);
   /*tail*/ denoise_CPU_stage1(llvm_cbe_tmp3031, llvm_cbe_tmp910);
  *(&cg_caller_call_site_var) = ((unsigned int )11);
  *(&cg_caller_id_var) = ((unsigned int )3);
   /*tail*/ denoise_CPU_stage2(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
  *(&cg_caller_call_site_var) = ((unsigned int )12);
  *(&cg_caller_id_var) = ((unsigned int )3);
  llvm_cbe_tmp40_2 =  /*tail*/ printf((&(_2E_str28[((signed long long )((unsigned long long )0ll))])), ((unsigned int )2));
  *(&cg_caller_call_site_var) = ((unsigned int )13);
  *(&cg_caller_id_var) = ((unsigned int )3);
  ltmp_12_2 = memcpy(llvm_cbe_tmp2123, llvm_cbe_tmp9, ((unsigned long long )16384ll));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp9)));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp30)));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


unsigned int main(unsigned int llvm_cbe_argc, unsigned char **llvm_cbe_argv) {
  unsigned short llvm_cbe_num;    /* Address-exposed local */
  unsigned char *llvm_cbe_tmp8;
  float *llvm_cbe_tmp89;
  unsigned char *llvm_cbe_tmp16;
  float *llvm_cbe_tmp1617;
  struct l_struct_2E_FILE *llvm_cbe_tmp20;
  unsigned char *llvm_cbe_num28;
  unsigned int llvm_cbe_tmp25;
  unsigned int llvm_cbe_i_093;
  unsigned int llvm_cbe_i_093__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned long long llvm_cbe_tmp30;
  unsigned short llvm_cbe_tmp31;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_indvar_next103;
  unsigned int llvm_cbe_j_095;
  unsigned int llvm_cbe_j_095__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_indvar_next105;
  unsigned int llvm_cbe_k_098;
  unsigned int llvm_cbe_k_098__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp78;
  unsigned char *ltmp_13_2;

  CODE_FOR_MAIN();
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )4);
  llvm_cbe_tmp8 = calloc(((unsigned long long )4096ll), ((unsigned long long )4ll));
  llvm_cbe_tmp89 = ((float *)llvm_cbe_tmp8);
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )4);
  llvm_cbe_tmp16 = calloc(((unsigned long long )4096ll), ((unsigned long long )4ll));
  llvm_cbe_tmp1617 = ((float *)llvm_cbe_tmp16);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )4);
  llvm_cbe_tmp20 = fopen((&(_2E_str39[((signed long long )((unsigned long long )0ll))])), (&(_2E_str410[((signed long long )((unsigned long long )0ll))])));
  if ((llvm_cbe_tmp20 == ((struct l_struct_2E_FILE *)/*NULL*/0))) {
    goto llvm_cbe_cond_true;
  } else {
    goto llvm_cbe_bb70_preheader;
  }

llvm_cbe_bb70_preheader:
  llvm_cbe_num28 = ((unsigned char *)(&llvm_cbe_num));
  llvm_cbe_k_098__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb60_preheader;

llvm_cbe_cond_true:
  *(&cg_caller_call_site_var) = ((unsigned int )3);
  *(&cg_caller_id_var) = ((unsigned int )4);
  llvm_cbe_tmp25 = puts((&(_2E_str511[((signed long long )((unsigned long long )0ll))])));
  CallProfPrinter();
  return ((unsigned int )1);
  do {     /* Syntactic loop 'bb60.preheader' to make GCC happy */
llvm_cbe_bb60_preheader:
  llvm_cbe_k_098 = llvm_cbe_k_098__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )11);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )11));
  llvm_cbe_j_095__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb51_preheader;

llvm_cbe_bb66:
  llvm_cbe_indvar_next105 = llvm_cbe_k_098 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next105 == ((unsigned int )16))) {
    goto llvm_cbe_bb76;
  } else {
    llvm_cbe_k_098__PHI_TEMPORARY = llvm_cbe_indvar_next105;   /* for PHI node */
    goto llvm_cbe_bb60_preheader;
  }

  do {     /* Syntactic loop 'bb51.preheader' to make GCC happy */
llvm_cbe_bb51_preheader:
  llvm_cbe_j_095 = llvm_cbe_j_095__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )12);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )12));
  llvm_cbe_i_093__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb27;

llvm_cbe_bb57:
  llvm_cbe_indvar_next103 = llvm_cbe_j_095 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_indvar_next103 == ((unsigned int )16))) {
    goto llvm_cbe_bb66;
  } else {
    llvm_cbe_j_095__PHI_TEMPORARY = llvm_cbe_indvar_next103;   /* for PHI node */
    goto llvm_cbe_bb51_preheader;
  }

  do {     /* Syntactic loop 'bb27' to make GCC happy */
llvm_cbe_bb27:
  llvm_cbe_i_093 = llvm_cbe_i_093__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )13);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )13));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )13);
  llvm_cbe_tmp30 = fread(llvm_cbe_num28, ((unsigned long long )2ll), ((unsigned long long )1ll), llvm_cbe_tmp20);
  llvm_cbe_tmp31 = *(&llvm_cbe_num);
  *(&llvm_cbe_tmp89[((signed long long )(((signed long long )(signed int )((((llvm_cbe_i_093 << ((unsigned int )4)) + llvm_cbe_j_095) << ((unsigned int )4)) + llvm_cbe_k_098))))]) = (((float )((((float )((((float )(unsigned short )llvm_cbe_tmp31)) / 0x1.ff4p+12))) * 0x1.fep+7)));
  llvm_cbe_indvar_next = llvm_cbe_i_093 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((llvm_cbe_indvar_next == ((unsigned int )16))) {
    goto llvm_cbe_bb57;
  } else {
    llvm_cbe_i_093__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb27;
  }

  } while (1); /* end of syntactic loop 'bb27' */
  } while (1); /* end of syntactic loop 'bb51.preheader' */
  } while (1); /* end of syntactic loop 'bb60.preheader' */
llvm_cbe_bb76:
  *(&cg_caller_call_site_var) = ((unsigned int )5);
  *(&cg_caller_id_var) = ((unsigned int )4);
  llvm_cbe_tmp78 = fclose(llvm_cbe_tmp20);
  *(&cg_caller_call_site_var) = ((unsigned int )6);
  *(&cg_caller_id_var) = ((unsigned int )4);
  ltmp_13_2 = memcpy(llvm_cbe_tmp16, llvm_cbe_tmp8, ((unsigned long long )16384ll));
  *(&cg_caller_call_site_var) = ((unsigned int )7);
  *(&cg_caller_id_var) = ((unsigned int )4);
  denoise(llvm_cbe_tmp1617);
  CallProfPrinter();
  return ((unsigned int )0);
}

