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

/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void foo(unsigned int llvm_cbe_i);
unsigned int loop_enter();
unsigned int func(unsigned int llvm_cbe_val);
unsigned int main(void);
unsigned int printf(unsigned char *, ...);
unsigned char *malloc();
void free(unsigned char *);
void abort(void);


/* Global Variable Declarations */
extern unsigned int B[100] __ATTRIBUTE_WEAK__;
extern unsigned int A[200] __ATTRIBUTE_WEAK__;
static unsigned char _2E_str[25];
static unsigned char _2E_str1[25];


/* Global Variable Definitions and Initialization */
unsigned int B[100] __ATTRIBUTE_WEAK__ = { 0 };
unsigned int A[200] __ATTRIBUTE_WEAK__ = { 0 };
static unsigned char _2E_str[25] = "The value of A[99] : %d\n";
static unsigned char _2E_str1[25] = "The value of B[99] : %d\n";


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
  unsigned int llvm_cbe_tmp1;

  llvm_cbe_tmp1 =  /*tail*/ loop_enter(llvm_cbe_i);
  return;
}


unsigned int func(unsigned int llvm_cbe_val) {
  unsigned int llvm_cbe_tmp37;
  unsigned int ltmp_0_1;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_tmp6;
  unsigned long long llvm_cbe_phitmp;
  unsigned long long llvm_cbe_i_0_reg2mem_1;
  unsigned long long llvm_cbe_i_0_reg2mem_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp22;

  if ((((signed int )llvm_cbe_val) > ((signed int )((unsigned int )1)))) {
    goto llvm_cbe_bb_preheader;
  } else {
    llvm_cbe_i_0_reg2mem_1__PHI_TEMPORARY = ((unsigned long long )1ll);   /* for PHI node */
    goto llvm_cbe_bb17;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp37 = (((((signed int )(llvm_cbe_val + ((unsigned int )-2))) < ((signed int )((unsigned int )0)))) ? (((unsigned int )1)) : ((llvm_cbe_val + ((unsigned int )-1))));
  ltmp_0_1 = loop_enter(((unsigned int )1));
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_indvar + ((unsigned int )1);
  llvm_cbe_tmp6 = *(&B[((signed long long )(((signed long long )(signed int )llvm_cbe_indvar)))]);
  *(&B[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0)))]) = (llvm_cbe_tmp6 + ((unsigned int )1));
  if ((llvm_cbe_i_0_reg2mem_0 == llvm_cbe_tmp37)) {
    goto llvm_cbe_bb17_loopexit;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_i_0_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_bb;
  }

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_bb17_loopexit:
  llvm_cbe_phitmp = (((((signed int )(llvm_cbe_val + ((unsigned int )-2))) < ((signed int )((unsigned int )0)))) ? (((unsigned long long )2ll)) : ((((signed long long )(signed int )llvm_cbe_val))));
  llvm_cbe_i_0_reg2mem_1__PHI_TEMPORARY = llvm_cbe_phitmp;   /* for PHI node */
  goto llvm_cbe_bb17;

llvm_cbe_bb17:
  llvm_cbe_i_0_reg2mem_1 = llvm_cbe_i_0_reg2mem_1__PHI_TEMPORARY;
  llvm_cbe_tmp22 = *(&B[((signed long long )llvm_cbe_i_0_reg2mem_1)]);
  return llvm_cbe_tmp22;
}


unsigned int main(void) {
  unsigned int ltmp_1_1;
  unsigned int llvm_cbe_i_0_reg2mem_0_ph;
  unsigned int llvm_cbe_i_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int *llvm_cbe_tmp8;
  unsigned int *llvm_cbe_tmp22;
  unsigned int ltmp_2_1;
  unsigned int llvm_cbe_j_056;
  unsigned int llvm_cbe_j_056__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp5;
  unsigned int llvm_cbe_tmp9;
  unsigned int llvm_cbe_tmp11;
  unsigned int llvm_cbe_tmp19;
  unsigned int llvm_cbe_indvar_next58;
  unsigned int llvm_cbe_tmp39;
  unsigned int llvm_cbe_tmp41;
  unsigned int llvm_cbe_tmp43;
  unsigned int llvm_cbe_tmp45;
  unsigned int llvm_cbe_tmp47;

  CODE_FOR_MAIN();
  *(&(A[((signed long long )((unsigned long long )0ll))])) = ((unsigned int )1);
  *(&(B[((signed long long )((unsigned long long )0ll))])) = ((unsigned int )1);
  ltmp_1_1 = loop_enter(((unsigned int )2));
  llvm_cbe_i_0_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb25_outer;

  do {     /* Syntactic loop 'bb25.outer' to make GCC happy */
llvm_cbe_bb25_outer:
  llvm_cbe_i_0_reg2mem_0_ph = llvm_cbe_i_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_tmp8 = &A[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_ph)))];
  llvm_cbe_tmp22 = &A[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_reg2mem_0_ph + ((unsigned int )1)))))];
  ltmp_2_1 = loop_enter(((unsigned int )3));
  llvm_cbe_j_056__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb3;

llvm_cbe_bb29:
  llvm_cbe_indvar_next58 = llvm_cbe_i_0_reg2mem_0_ph + ((unsigned int )1);
  if ((llvm_cbe_indvar_next58 == ((unsigned int )100))) {
    goto llvm_cbe_bb37_split;
  } else {
    llvm_cbe_i_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_indvar_next58;   /* for PHI node */
    goto llvm_cbe_bb25_outer;
  }

  do {     /* Syntactic loop 'bb3' to make GCC happy */
llvm_cbe_bb3:
  llvm_cbe_j_056 = llvm_cbe_j_056__PHI_TEMPORARY;
  llvm_cbe_tmp5 = llvm_cbe_j_056 + ((unsigned int )1);
  llvm_cbe_tmp9 = *llvm_cbe_tmp8;
  llvm_cbe_tmp11 =  /*tail*/ func((llvm_cbe_tmp9 + ((unsigned int )1)));
  *(&B[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp5)))]) = llvm_cbe_tmp11;
  llvm_cbe_tmp19 = *llvm_cbe_tmp8;
  *llvm_cbe_tmp22 = (llvm_cbe_tmp19 + ((unsigned int )1));
  if ((llvm_cbe_tmp5 == ((unsigned int )100))) {
    goto llvm_cbe_bb29;
  } else {
    llvm_cbe_j_056__PHI_TEMPORARY = llvm_cbe_tmp5;   /* for PHI node */
    goto llvm_cbe_bb3;
  }

  } while (1); /* end of syntactic loop 'bb3' */
  } while (1); /* end of syntactic loop 'bb25.outer' */
llvm_cbe_bb37_split:
  llvm_cbe_tmp39 = *(&(A[((signed long long )((unsigned long long )99ll))]));
  llvm_cbe_tmp41 =  /*tail*/ printf((&(_2E_str[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp39);
  llvm_cbe_tmp43 = *(&(B[((signed long long )((unsigned long long )99ll))]));
  llvm_cbe_tmp45 =  /*tail*/ printf((&(_2E_str1[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp43);
  llvm_cbe_tmp47 = *(&(A[((signed long long )((unsigned long long )100ll))]));
  return llvm_cbe_tmp47;
}

