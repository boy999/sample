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

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void foo(unsigned int llvm_cbe_i);
unsigned int func_enter();
unsigned int loop_enter();
float func2(unsigned int llvm_cbe_a, unsigned int llvm_cbe_b);
void func1(float *llvm_cbe_a, unsigned int llvm_cbe_m, unsigned int llvm_cbe_n, unsigned int llvm_cbe_p);
unsigned int main(void);
unsigned char *malloc();
void free(unsigned char *);
void abort(void);


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


float func2(unsigned int llvm_cbe_a, unsigned int llvm_cbe_b) {
  unsigned int ltmp_1_1;

  ltmp_1_1 = func_enter(((unsigned int )2));
  return (((float )(signed int )(((((((signed int )llvm_cbe_a) > ((signed int )llvm_cbe_b))) ? (llvm_cbe_b) : ((-(llvm_cbe_b))))) + llvm_cbe_a)));
}


void func1(float *llvm_cbe_a, unsigned int llvm_cbe_m, unsigned int llvm_cbe_n, unsigned int llvm_cbe_p) {
  unsigned int ltmp_2_1;
  unsigned int llvm_cbe_tmp67;
  unsigned int ltmp_3_1;
  unsigned int llvm_cbe_i_0_reg2mem_0_ph;
  unsigned int llvm_cbe_i_0_reg2mem_0_ph__PHI_TEMPORARY;
  float *llvm_cbe_tmp5;
  unsigned int llvm_cbe_k_050;
  unsigned int llvm_cbe_k_050__PHI_TEMPORARY;
  float llvm_cbe_tmp6;
  float llvm_cbe_tmp11;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_indvar_next57;
  unsigned int llvm_cbe_tmp61;
  unsigned int ltmp_4_1;
  unsigned int llvm_cbe_j_052;
  unsigned int llvm_cbe_j_052__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp56;
  unsigned int ltmp_5_1;
  unsigned int llvm_cbe_indvar_next63;

  ltmp_2_1 = func_enter(((unsigned int )3));
  if ((((signed int )llvm_cbe_m) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb27_preheader;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_bb27_preheader:
  if ((((signed int )llvm_cbe_n) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb27_preheader_split;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_bb27_preheader_split:
  llvm_cbe_tmp67 = (((((signed int )(llvm_cbe_m + ((unsigned int )-1))) < ((signed int )((unsigned int )0)))) ? (((unsigned int )1)) : (llvm_cbe_m));
  ltmp_3_1 = loop_enter(((unsigned int )5));
  llvm_cbe_i_0_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb27_outer;

  do {     /* Syntactic loop 'bb27.outer' to make GCC happy */
llvm_cbe_bb27_outer:
  llvm_cbe_i_0_reg2mem_0_ph = llvm_cbe_i_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_tmp5 = &llvm_cbe_a[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_ph)))];
  if ((((signed int )llvm_cbe_p) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_nph54_split;
  } else {
    goto llvm_cbe_bb33;
  }

llvm_cbe_bb33:
  llvm_cbe_indvar_next63 = llvm_cbe_i_0_reg2mem_0_ph + ((unsigned int )1);
  if ((llvm_cbe_indvar_next63 == llvm_cbe_tmp67)) {
    goto llvm_cbe_return;
  } else {
    llvm_cbe_i_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_indvar_next63;   /* for PHI node */
    goto llvm_cbe_bb27_outer;
  }

  do {     /* Syntactic loop 'bb19.preheader' to make GCC happy */
llvm_cbe_bb19_preheader:
  llvm_cbe_j_052 = llvm_cbe_j_052__PHI_TEMPORARY;
  llvm_cbe_tmp56 = (((((signed int )(llvm_cbe_p + ((unsigned int )-1))) < ((signed int )((unsigned int )0)))) ? (((unsigned int )1)) : (llvm_cbe_p));
  ltmp_5_1 = loop_enter(((unsigned int )6));
  llvm_cbe_k_050__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb2;

llvm_cbe_bb24:
  llvm_cbe_indvar_next57 = llvm_cbe_j_052 + ((unsigned int )1);
  if ((llvm_cbe_indvar_next57 == llvm_cbe_tmp61)) {
    goto llvm_cbe_bb33;
  } else {
    llvm_cbe_j_052__PHI_TEMPORARY = llvm_cbe_indvar_next57;   /* for PHI node */
    goto llvm_cbe_bb19_preheader;
  }

  do {     /* Syntactic loop 'bb2' to make GCC happy */
llvm_cbe_bb2:
  llvm_cbe_k_050 = llvm_cbe_k_050__PHI_TEMPORARY;
  llvm_cbe_tmp6 = *llvm_cbe_tmp5;
  llvm_cbe_tmp11 =  /*tail*/ func2(llvm_cbe_i_0_reg2mem_0_ph, (llvm_cbe_k_050 + llvm_cbe_j_052));
  *llvm_cbe_tmp5 = (((float )(llvm_cbe_tmp6 + llvm_cbe_tmp11)));
  llvm_cbe_indvar_next = llvm_cbe_k_050 + ((unsigned int )1);
  if ((llvm_cbe_indvar_next == llvm_cbe_tmp56)) {
    goto llvm_cbe_bb24;
  } else {
    llvm_cbe_k_050__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb2;
  }

  } while (1); /* end of syntactic loop 'bb2' */
  } while (1); /* end of syntactic loop 'bb19.preheader' */
llvm_cbe_bb_nph54_split:
  llvm_cbe_tmp61 = (((((signed int )(llvm_cbe_n + ((unsigned int )-1))) < ((signed int )((unsigned int )0)))) ? (((unsigned int )1)) : (llvm_cbe_n));
  ltmp_4_1 = loop_enter(((unsigned int )7));
  llvm_cbe_j_052__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb19_preheader;

  } while (1); /* end of syntactic loop 'bb27.outer' */
llvm_cbe_return:
  return;
}


unsigned int main(void) {
  unsigned int ltmp_6_1;
  float llvm_cbe_A[10];    /* Address-exposed local */
  float llvm_cbe_B[100];    /* Address-exposed local */
  float llvm_cbe_tmp4;
  float llvm_cbe_tmp6;

  CODE_FOR_MAIN();
  ltmp_6_1 = func_enter(((unsigned int )4));
  func1((&llvm_cbe_A[((signed int )((unsigned int )0))]), ((unsigned int )10), ((unsigned int )10), ((unsigned int )10));
  func1((&llvm_cbe_B[((signed int )((unsigned int )0))]), ((unsigned int )100), ((unsigned int )100), ((unsigned int )100));
  llvm_cbe_tmp4 = *(&llvm_cbe_A[((signed long long )((unsigned long long )0ll))]);
  llvm_cbe_tmp6 = *(&llvm_cbe_B[((signed long long )((unsigned long long )0ll))]);
  return (((signed int )(((float )(llvm_cbe_tmp4 + llvm_cbe_tmp6)))));
}

