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

/* Typedefs */
typedef struct l_struct_2E_FILE l_struct_2E_FILE;
typedef struct l_struct_2E__IO_marker l_struct_2E__IO_marker;

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


/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void foo(unsigned int llvm_cbe_i);
unsigned int func_enter();
unsigned int loop_enter();
void denoise_CPU_stage1(float *llvm_cbe_T0, float *llvm_cbe_g, float *llvm_cbe_u);
unsigned int printf(unsigned char *, ...);
void denoise_CPU_stage2(float *llvm_cbe_T0, float *llvm_cbe_g, float *llvm_cbe_u);
void denoise(float *llvm_cbe_T0);
unsigned int puts(unsigned char *);
unsigned char *calloc(unsigned long long , unsigned long long );
unsigned int main(unsigned int llvm_cbe_argc, unsigned char **llvm_cbe_argv);
struct l_struct_2E_FILE *fopen(unsigned char *, unsigned char *);
unsigned long long fread(unsigned char *, unsigned long long , unsigned long long , struct l_struct_2E_FILE *);
unsigned int fclose(struct l_struct_2E_FILE *);
unsigned char *malloc();
void free(unsigned char *);
void abort(void);
float sqrtf(float );
double sqrt(float );
float sqrtl(float );
unsigned char *memcpy(unsigned char *, unsigned char *, unsigned long long );


/* Global Variable Declarations */
static unsigned char _2E_str[24];
static unsigned char _2E_str1[17];
static unsigned char _2E_str2[11];
static unsigned char _2E_str3[11];
static unsigned char _2E_str4[3];
static unsigned char _2E_str5[14];


/* Global Variable Definitions and Initialization */
static unsigned char _2E_str[24] = "m = %d; n = %d; p = %d\n";
static unsigned char _2E_str1[17] = "Now at denoise \r";
static unsigned char _2E_str2[11] = "iter = %d\n";
static unsigned char _2E_str3[11] = "data/T.img";
static unsigned char _2E_str4[3] = "rb";
static unsigned char _2E_str5[14] = "reading error";


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

void foo(unsigned int llvm_cbe_i) {
  unsigned int ltmp_0_1;
  unsigned int llvm_cbe_tmp1;
  unsigned int llvm_cbe_tmp3;

  ltmp_0_1 = func_enter(((unsigned int )1));
  llvm_cbe_tmp1 =  /*tail*/ func_enter(llvm_cbe_i);
  llvm_cbe_tmp3 =  /*tail*/ loop_enter(llvm_cbe_i);
  return;
}


void denoise_CPU_stage1(float *llvm_cbe_T0, float *llvm_cbe_g, float *llvm_cbe_u) {
  unsigned int ltmp_1_1;
  unsigned int ltmp_2_1;
  unsigned int llvm_cbe_indvar448;
  unsigned int llvm_cbe_indvar448__PHI_TEMPORARY;
  unsigned int llvm_cbe_p_0_reg2mem_0_ph;
  unsigned int llvm_cbe_tmp5;
  unsigned int ltmp_3_1;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
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
  unsigned int llvm_cbe_n_0439;
  unsigned int llvm_cbe_tmp9;
  unsigned int llvm_cbe_tmp33;
  unsigned int llvm_cbe_tmp94;
  unsigned int llvm_cbe_tmp154444;
  unsigned int llvm_cbe_tmp212;
  unsigned int llvm_cbe_tmp270;
  unsigned int llvm_cbe_tmp330;
  unsigned int ltmp_4_1;

  ltmp_1_1 = func_enter(((unsigned int )2));
  ltmp_2_1 = loop_enter(((unsigned int )6));
  llvm_cbe_indvar448__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb390_outer;

  do {     /* Syntactic loop 'bb390.outer' to make GCC happy */
llvm_cbe_bb390_outer:
  llvm_cbe_indvar448 = llvm_cbe_indvar448__PHI_TEMPORARY;
  llvm_cbe_p_0_reg2mem_0_ph = llvm_cbe_indvar448 + ((unsigned int )1);
  llvm_cbe_tmp5 = llvm_cbe_p_0_reg2mem_0_ph << ((unsigned int )4);
  ltmp_3_1 = loop_enter(((unsigned int )7));
  llvm_cbe_indvar445__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb381_preheader;

llvm_cbe_bb397:
  if ((llvm_cbe_p_0_reg2mem_0_ph == ((unsigned int )14))) {
    goto llvm_cbe_return_split;
  } else {
    llvm_cbe_indvar448__PHI_TEMPORARY = llvm_cbe_p_0_reg2mem_0_ph;   /* for PHI node */
    goto llvm_cbe_bb390_outer;
  }

  do {     /* Syntactic loop 'bb381.preheader' to make GCC happy */
llvm_cbe_bb381_preheader:
  llvm_cbe_indvar445 = llvm_cbe_indvar445__PHI_TEMPORARY;
  llvm_cbe_n_0439 = llvm_cbe_indvar445 + ((unsigned int )1);
  llvm_cbe_tmp9 = (llvm_cbe_tmp5 + llvm_cbe_n_0439) << ((unsigned int )4);
  llvm_cbe_tmp33 = llvm_cbe_tmp9 + ((unsigned int )16);
  llvm_cbe_tmp94 = llvm_cbe_tmp9 + ((unsigned int )-16);
  llvm_cbe_tmp154444 = llvm_cbe_tmp9 | ((unsigned int )1);
  llvm_cbe_tmp212 = llvm_cbe_tmp9 + ((unsigned int )-1);
  llvm_cbe_tmp270 = llvm_cbe_tmp9 + ((unsigned int )256);
  llvm_cbe_tmp330 = llvm_cbe_tmp9 + ((unsigned int )-256);
  ltmp_4_1 = loop_enter(((unsigned int )8));
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb2;

llvm_cbe_bb387:
  if ((llvm_cbe_n_0439 == ((unsigned int )14))) {
    goto llvm_cbe_bb397;
  } else {
    llvm_cbe_indvar445__PHI_TEMPORARY = llvm_cbe_n_0439;   /* for PHI node */
    goto llvm_cbe_bb381_preheader;
  }

  do {     /* Syntactic loop 'bb2' to make GCC happy */
llvm_cbe_bb2:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
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
  llvm_cbe_tmp378 =  /*tail*/ printf((&(_2E_str[((signed long long )((unsigned long long )0ll))])), llvm_cbe_m_0437, llvm_cbe_n_0439, llvm_cbe_p_0_reg2mem_0_ph);
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
  return;
}


void denoise_CPU_stage2(float *llvm_cbe_T0, float *llvm_cbe_g, float *llvm_cbe_u) {
  unsigned int ltmp_5_1;
  unsigned int ltmp_6_1;
  unsigned int llvm_cbe_indvar461;
  unsigned int llvm_cbe_indvar461__PHI_TEMPORARY;
  unsigned int llvm_cbe_p_0_reg2mem_0_ph;
  unsigned int llvm_cbe_tmp13;
  unsigned int ltmp_7_1;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
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
  unsigned int llvm_cbe_n_0451;
  unsigned int llvm_cbe_tmp17;
  unsigned int llvm_cbe_tmp86;
  unsigned int llvm_cbe_tmp117;
  unsigned int llvm_cbe_tmp149457;
  unsigned int llvm_cbe_tmp179;
  unsigned int llvm_cbe_tmp209;
  unsigned int llvm_cbe_tmp241;
  unsigned int ltmp_8_1;

  ltmp_5_1 = func_enter(((unsigned int )3));
  ltmp_6_1 = loop_enter(((unsigned int )10));
  llvm_cbe_indvar461__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb404_outer;

  do {     /* Syntactic loop 'bb404.outer' to make GCC happy */
llvm_cbe_bb404_outer:
  llvm_cbe_indvar461 = llvm_cbe_indvar461__PHI_TEMPORARY;
  llvm_cbe_p_0_reg2mem_0_ph = llvm_cbe_indvar461 + ((unsigned int )1);
  llvm_cbe_tmp13 = llvm_cbe_p_0_reg2mem_0_ph << ((unsigned int )4);
  ltmp_7_1 = loop_enter(((unsigned int )9));
  llvm_cbe_indvar458__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb395_preheader;

llvm_cbe_bb411:
  if ((llvm_cbe_p_0_reg2mem_0_ph == ((unsigned int )14))) {
    goto llvm_cbe_return_split;
  } else {
    llvm_cbe_indvar461__PHI_TEMPORARY = llvm_cbe_p_0_reg2mem_0_ph;   /* for PHI node */
    goto llvm_cbe_bb404_outer;
  }

  do {     /* Syntactic loop 'bb395.preheader' to make GCC happy */
llvm_cbe_bb395_preheader:
  llvm_cbe_indvar458 = llvm_cbe_indvar458__PHI_TEMPORARY;
  llvm_cbe_n_0451 = llvm_cbe_indvar458 + ((unsigned int )1);
  llvm_cbe_tmp17 = (llvm_cbe_tmp13 + llvm_cbe_n_0451) << ((unsigned int )4);
  llvm_cbe_tmp86 = llvm_cbe_tmp17 + ((unsigned int )16);
  llvm_cbe_tmp117 = llvm_cbe_tmp17 + ((unsigned int )-16);
  llvm_cbe_tmp149457 = llvm_cbe_tmp17 | ((unsigned int )1);
  llvm_cbe_tmp179 = llvm_cbe_tmp17 + ((unsigned int )-1);
  llvm_cbe_tmp209 = llvm_cbe_tmp17 + ((unsigned int )256);
  llvm_cbe_tmp241 = llvm_cbe_tmp17 + ((unsigned int )-256);
  ltmp_8_1 = loop_enter(((unsigned int )11));
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb10;

llvm_cbe_bb401:
  if ((llvm_cbe_n_0451 == ((unsigned int )14))) {
    goto llvm_cbe_bb411;
  } else {
    llvm_cbe_indvar458__PHI_TEMPORARY = llvm_cbe_n_0451;   /* for PHI node */
    goto llvm_cbe_bb395_preheader;
  }

  do {     /* Syntactic loop 'bb10' to make GCC happy */
llvm_cbe_bb10:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
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
  llvm_cbe_tmp392 =  /*tail*/ printf((&(_2E_str[((signed long long )((unsigned long long )0ll))])), llvm_cbe_m_0449, llvm_cbe_n_0451, llvm_cbe_p_0_reg2mem_0_ph);
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
  return;
}


void denoise(float *llvm_cbe_T0) {
  unsigned int ltmp_9_1;
  unsigned int llvm_cbe_tmp1;
  unsigned char *llvm_cbe_tmp9;
  float *llvm_cbe_tmp910;
  unsigned char *llvm_cbe_tmp2123;
  unsigned char *ltmp_10_2;
  unsigned char *llvm_cbe_tmp30;
  float *llvm_cbe_tmp3031;
  unsigned int llvm_cbe_tmp40;
  unsigned int llvm_cbe_tmp40_1;
  unsigned int llvm_cbe_tmp40_2;
  unsigned char *ltmp_11_2;

  ltmp_9_1 = func_enter(((unsigned int )4));
  llvm_cbe_tmp1 =  /*tail*/ puts((&(_2E_str1[((signed long long )((unsigned long long )0ll))])));
  llvm_cbe_tmp9 =  /*tail*/ calloc(((unsigned long long )4096ll), ((unsigned long long )4ll));
  llvm_cbe_tmp910 = ((float *)llvm_cbe_tmp9);
  llvm_cbe_tmp2123 = ((unsigned char *)llvm_cbe_T0);
  ltmp_10_2 = memcpy(llvm_cbe_tmp9, llvm_cbe_tmp2123, ((unsigned long long )16384ll));
  llvm_cbe_tmp30 =  /*tail*/ calloc(((unsigned long long )4096ll), ((unsigned long long )4ll));
  llvm_cbe_tmp3031 = ((float *)llvm_cbe_tmp30);
   /*tail*/ denoise_CPU_stage1(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
   /*tail*/ denoise_CPU_stage2(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
  llvm_cbe_tmp40 =  /*tail*/ printf((&(_2E_str2[((signed long long )((unsigned long long )0ll))])), ((unsigned int )0));
   /*tail*/ denoise_CPU_stage1(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
   /*tail*/ denoise_CPU_stage2(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
  llvm_cbe_tmp40_1 =  /*tail*/ printf((&(_2E_str2[((signed long long )((unsigned long long )0ll))])), ((unsigned int )1));
   /*tail*/ denoise_CPU_stage1(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
   /*tail*/ denoise_CPU_stage2(llvm_cbe_T0, llvm_cbe_tmp3031, llvm_cbe_tmp910);
  llvm_cbe_tmp40_2 =  /*tail*/ printf((&(_2E_str2[((signed long long )((unsigned long long )0ll))])), ((unsigned int )2));
  ltmp_11_2 = memcpy(llvm_cbe_tmp2123, llvm_cbe_tmp9, ((unsigned long long )16384ll));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp9)));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp30)));
  return;
}


unsigned int main(unsigned int llvm_cbe_argc, unsigned char **llvm_cbe_argv) {
  unsigned int ltmp_12_1;
  unsigned short llvm_cbe_num;    /* Address-exposed local */
  unsigned char *llvm_cbe_tmp8;
  float *llvm_cbe_tmp89;
  unsigned char *llvm_cbe_tmp16;
  float *llvm_cbe_tmp1617;
  struct l_struct_2E_FILE *llvm_cbe_tmp20;
  unsigned char *llvm_cbe_num28;
  unsigned int ltmp_13_1;
  unsigned int llvm_cbe_tmp25;
  unsigned int llvm_cbe_i_093;
  unsigned int llvm_cbe_i_093__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp30;
  unsigned short llvm_cbe_tmp31;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_indvar_next103;
  unsigned int llvm_cbe_j_095;
  unsigned int llvm_cbe_j_095__PHI_TEMPORARY;
  unsigned int ltmp_14_1;
  unsigned int llvm_cbe_indvar_next105;
  unsigned int llvm_cbe_k_098;
  unsigned int llvm_cbe_k_098__PHI_TEMPORARY;
  unsigned int ltmp_15_1;
  unsigned int llvm_cbe_tmp78;
  unsigned char *ltmp_16_2;

  CODE_FOR_MAIN();
  ltmp_12_1 = func_enter(((unsigned int )5));
  llvm_cbe_tmp8 = calloc(((unsigned long long )4096ll), ((unsigned long long )4ll));
  llvm_cbe_tmp89 = ((float *)llvm_cbe_tmp8);
  llvm_cbe_tmp16 = calloc(((unsigned long long )4096ll), ((unsigned long long )4ll));
  llvm_cbe_tmp1617 = ((float *)llvm_cbe_tmp16);
  llvm_cbe_tmp20 = fopen((&(_2E_str3[((signed long long )((unsigned long long )0ll))])), (&(_2E_str4[((signed long long )((unsigned long long )0ll))])));
  if ((llvm_cbe_tmp20 == ((struct l_struct_2E_FILE *)/*NULL*/0))) {
    goto llvm_cbe_cond_true;
  } else {
    goto llvm_cbe_bb70_preheader;
  }

llvm_cbe_bb70_preheader:
  llvm_cbe_num28 = ((unsigned char *)(&llvm_cbe_num));
  ltmp_13_1 = loop_enter(((unsigned int )14));
  llvm_cbe_k_098__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb60_preheader;

llvm_cbe_cond_true:
  llvm_cbe_tmp25 = puts((&(_2E_str5[((signed long long )((unsigned long long )0ll))])));
  return ((unsigned int )1);
  do {     /* Syntactic loop 'bb60.preheader' to make GCC happy */
llvm_cbe_bb60_preheader:
  llvm_cbe_k_098 = llvm_cbe_k_098__PHI_TEMPORARY;
  ltmp_15_1 = loop_enter(((unsigned int )12));
  llvm_cbe_j_095__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb51_preheader;

llvm_cbe_bb66:
  llvm_cbe_indvar_next105 = llvm_cbe_k_098 + ((unsigned int )1);
  if ((llvm_cbe_indvar_next105 == ((unsigned int )16))) {
    goto llvm_cbe_bb76;
  } else {
    llvm_cbe_k_098__PHI_TEMPORARY = llvm_cbe_indvar_next105;   /* for PHI node */
    goto llvm_cbe_bb60_preheader;
  }

  do {     /* Syntactic loop 'bb51.preheader' to make GCC happy */
llvm_cbe_bb51_preheader:
  llvm_cbe_j_095 = llvm_cbe_j_095__PHI_TEMPORARY;
  ltmp_14_1 = loop_enter(((unsigned int )13));
  llvm_cbe_i_093__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb27;

llvm_cbe_bb57:
  llvm_cbe_indvar_next103 = llvm_cbe_j_095 + ((unsigned int )1);
  if ((llvm_cbe_indvar_next103 == ((unsigned int )16))) {
    goto llvm_cbe_bb66;
  } else {
    llvm_cbe_j_095__PHI_TEMPORARY = llvm_cbe_indvar_next103;   /* for PHI node */
    goto llvm_cbe_bb51_preheader;
  }

  do {     /* Syntactic loop 'bb27' to make GCC happy */
llvm_cbe_bb27:
  llvm_cbe_i_093 = llvm_cbe_i_093__PHI_TEMPORARY;
  llvm_cbe_tmp30 = fread(llvm_cbe_num28, ((unsigned long long )2ll), ((unsigned long long )1ll), llvm_cbe_tmp20);
  llvm_cbe_tmp31 = *(&llvm_cbe_num);
  *(&llvm_cbe_tmp89[((signed long long )(((signed long long )(signed int )((((llvm_cbe_i_093 << ((unsigned int )4)) + llvm_cbe_j_095) << ((unsigned int )4)) + llvm_cbe_k_098))))]) = (((float )((((float )((((float )(unsigned short )llvm_cbe_tmp31)) / 0x1.ff4p+12))) * 0x1.fep+7)));
  llvm_cbe_indvar_next = llvm_cbe_i_093 + ((unsigned int )1);
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
  llvm_cbe_tmp78 = fclose(llvm_cbe_tmp20);
  ltmp_16_2 = memcpy(llvm_cbe_tmp16, llvm_cbe_tmp8, ((unsigned long long )16384ll));
  denoise(llvm_cbe_tmp1617);
  return ((unsigned int )0);
}

