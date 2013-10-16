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
struct l_struct_2E__2E_0_2E__27;
struct l_struct_2E__2E_1_2E__38;
struct l_struct_2E_FILE;
struct l_struct_2E__IO_marker;
struct l_struct_2E___class_type_info_pseudo;
struct l_struct_2E___type_info_pseudo;
struct l_struct_2E_boundart;
struct l_struct_2E_createwaymnginfot;
struct l_struct_2E_csEdgeStruct;
struct l_struct_2E_flexarray_3C_i32_3E_;
struct l_struct_2E_flexarray_3C_regobj_2A__3E_;
struct l_struct_2E_largesolidarray_3C_regobj_2A__3E_;
struct l_struct_2E_point16t;
struct l_struct_2E_pointt;
struct l_struct_2E_regboundobj;
struct l_struct_2E_regmngobj;
struct l_struct_2E_regobj;
struct l_struct_2E_regwayobj;
struct l_struct_2E_way2obj;
struct l_struct_2E_workinfot;
struct l_unnamed0;
struct l_unnamed1;

/* Typedefs */
typedef struct l_struct_2E__2E_0_2E__27 l_struct_2E__2E_0_2E__27;
typedef struct l_struct_2E__2E_1_2E__38 l_struct_2E__2E_1_2E__38;
typedef struct l_struct_2E_FILE l_struct_2E_FILE;
typedef struct l_struct_2E__IO_marker l_struct_2E__IO_marker;
typedef struct l_struct_2E___class_type_info_pseudo l_struct_2E___class_type_info_pseudo;
typedef struct l_struct_2E___type_info_pseudo l_struct_2E___type_info_pseudo;
typedef struct l_struct_2E_boundart l_struct_2E_boundart;
typedef struct l_struct_2E_createwaymnginfot l_struct_2E_createwaymnginfot;
typedef struct l_struct_2E_csEdgeStruct l_struct_2E_csEdgeStruct;
typedef struct l_struct_2E_flexarray_3C_i32_3E_ l_struct_2E_flexarray_3C_i32_3E_;
typedef struct l_struct_2E_flexarray_3C_regobj_2A__3E_ l_struct_2E_flexarray_3C_regobj_2A__3E_;
typedef struct l_struct_2E_largesolidarray_3C_regobj_2A__3E_ l_struct_2E_largesolidarray_3C_regobj_2A__3E_;
typedef struct l_struct_2E_point16t l_struct_2E_point16t;
typedef struct l_struct_2E_pointt l_struct_2E_pointt;
typedef struct l_struct_2E_regboundobj l_struct_2E_regboundobj;
typedef struct l_struct_2E_regmngobj l_struct_2E_regmngobj;
typedef struct l_struct_2E_regobj l_struct_2E_regobj;
typedef struct l_struct_2E_regwayobj l_struct_2E_regwayobj;
typedef struct l_struct_2E_way2obj l_struct_2E_way2obj;
typedef struct l_struct_2E_workinfot l_struct_2E_workinfot;
typedef struct l_unnamed0 l_unnamed0;
typedef struct l_unnamed1 l_unnamed1;

/* Structure contents */
struct l_struct_2E__2E_0_2E__27 {
  unsigned char field0;
  unsigned char field1;
  unsigned char field2;
  unsigned char field3;
};

struct l_struct_2E__2E_1_2E__38 {
  unsigned int field0;
};

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

struct l_struct_2E___type_info_pseudo {
  unsigned char *field0;
  unsigned char *field1;
};

struct l_struct_2E___class_type_info_pseudo {
  struct l_struct_2E___type_info_pseudo field0;
};

struct l_struct_2E_boundart {
  struct l_struct_2E_pointt *field0;
  unsigned int field1;
  unsigned int field2;
};

struct l_struct_2E_createwaymnginfot {
  float field0;
  float field1;
  float field2;
  float field3;
  unsigned int field4;
  unsigned int field5;
  float field6;
  float field7;
};

struct l_struct_2E_csEdgeStruct {
  unsigned char field0;
  unsigned long long field1;
  unsigned int field2[8];
  unsigned int field3[8];
};

struct l_struct_2E_flexarray_3C_i32_3E_ {
  unsigned int *field0;
  unsigned int field1;
  unsigned int field2;
};

struct l_struct_2E_flexarray_3C_regobj_2A__3E_ {
  struct l_struct_2E_regobj **field0;
  unsigned int field1;
  unsigned int field2;
};

struct l_struct_2E_largesolidarray_3C_regobj_2A__3E_ {
  struct l_struct_2E_regobj **field0;
  struct l_struct_2E_flexarray_3C_i32_3E_ field1;
  struct l_struct_2E_flexarray_3C_i32_3E_ field2;
  struct l_struct_2E_flexarray_3C_i32_3E_ field3;
  unsigned int field4;
  unsigned int field5;
};

struct l_struct_2E_point16t {
  unsigned short field0;
  unsigned short field1;
};

struct l_struct_2E_pointt {
  unsigned int field0;
  unsigned int field1;
};

struct l_struct_2E_regboundobj {
  struct l_struct_2E_boundart field0;
  struct l_struct_2E_boundart field1;
  unsigned char field2;
  unsigned int field3;
  struct l_struct_2E_regobj *field4;
  unsigned int field5;
  unsigned int field6;
  unsigned int field7;
  unsigned int field8;
  struct l_struct_2E_regobj **field9;
  unsigned char *field10;
  unsigned int field11;
  unsigned int field12;
  unsigned int field13;
  unsigned int field14;
  struct l_struct_2E_regmngobj *field15;
  unsigned char field16;
};

struct l_struct_2E_regmngobj {
  unsigned short *field0;
  unsigned short field1;
  unsigned int field2;
  unsigned int field3;
  unsigned char field4;
  unsigned int field5;
  struct l_struct_2E_regobj **field6;
  unsigned char *field7;
  unsigned char field8[256];
  unsigned int field9;
  unsigned int field10;
  float field11;
  unsigned int field12;
  unsigned int field13;
  struct l_struct_2E__2E_1_2E__38 field14;
  struct l_struct_2E__2E_1_2E__38 field15;
  unsigned int field16;
  unsigned int field17;
  struct l_struct_2E_largesolidarray_3C_regobj_2A__3E_ field18;
};

struct l_struct_2E_regobj {
  unsigned int field0;
  unsigned char field1;
  unsigned char field2;
  struct l_struct_2E_regmngobj *field3;
  unsigned int field4;
  struct l_struct_2E_pointt field5;
  unsigned int field6;
  unsigned int field7;
  unsigned int field8;
  struct l_struct_2E_flexarray_3C_regobj_2A__3E_ field9;
};

struct l_struct_2E_regwayobj {
  unsigned int  (**field0) ();
  struct l_struct_2E_flexarray_3C_regobj_2A__3E_ field1;
  struct l_struct_2E_flexarray_3C_regobj_2A__3E_ field2;
  unsigned int field3;
  unsigned int field4;
  struct l_struct_2E_regmngobj *field5;
  unsigned char field6;
  struct l_struct_2E_regobj *field7;
  struct l_struct_2E_regobj *field8;
};

struct l_struct_2E_way2obj {
  unsigned char *field0;
  struct l_struct_2E_point16t *field1;
  unsigned short field2;
  unsigned char field3[256];
  struct l_struct_2E_boundart field4[256];
  unsigned int field5;
  unsigned int field6;
  unsigned int field7;
  unsigned int field8;
  unsigned int field9;
  unsigned int field10;
  unsigned int field11;
  unsigned char field12;
  unsigned int field13;
  unsigned int field14;
  struct l_struct_2E__2E_1_2E__38 field15;
  struct l_struct_2E__2E_1_2E__38 field16;
  unsigned int field17;
  unsigned int field18;
};

struct l_struct_2E_workinfot {
  unsigned char field0[4096];
  unsigned int field1;
  unsigned int field2;
  unsigned int field3;
  unsigned int field4;
  unsigned int field5;
  unsigned int field6;
  unsigned int field7;
  float field8;
  unsigned int field9;
  unsigned int field10;
  unsigned int field11;
};

struct l_unnamed0 {
  unsigned int field0;
  void  (*field1) (void);
};

struct l_unnamed1 {
  unsigned int field0[8];
};


/* External Global Variable Declarations */
extern unsigned int  (*_ZTVN10__cxxabiv117__class_type_infoE[1]) ();

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
static unsigned char _ZN6wayobj9createwayEiiiiRP8point16tRi(unsigned int llvm_cbe_startx, unsigned int llvm_cbe_starty, unsigned int llvm_cbe_endx, unsigned int llvm_cbe_endy, struct l_struct_2E_point16t **llvm_cbe_wayar, unsigned int *llvm_cbe_waylength);
unsigned char *_Znam(unsigned long long );
void _ZdaPv(unsigned char *);
static unsigned char _ZN6wayobj13findfreepointEiiRiS0_(unsigned int llvm_cbe_startx, unsigned int llvm_cbe_starty, unsigned int *llvm_cbe_freepointx, unsigned int *llvm_cbe_freepointy);
static void _ZN11regboundobj10addtoboundER9flexarrayI6pointtEii(struct l_struct_2E_regboundobj *llvm_cbe_this, struct l_struct_2E_boundart *llvm_cbe_barp, unsigned int llvm_cbe_x, unsigned int llvm_cbe_y);
static void _ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_(struct l_struct_2E_regboundobj *llvm_cbe_this, struct l_struct_2E_boundart *llvm_cbe_b1arp, struct l_struct_2E_boundart *llvm_cbe_b2arp);
static unsigned char _ZN11regboundobj4stepEv(struct l_struct_2E_regboundobj *llvm_cbe_this);
static void _ZN11regboundobj9firststepEiiP6regobjP9regmngobj(struct l_struct_2E_regboundobj *llvm_cbe_this, unsigned int llvm_cbe_x0, unsigned int llvm_cbe_y0, struct l_struct_2E_regobj *llvm_cbe_regionpin);
static void _ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_(struct l_struct_2E_boundart *llvm_cbe_b1arp, struct l_struct_2E_boundart *llvm_cbe_b2arp);
static unsigned char _ZN9regmngobj13findfreeplaceEiiRiS0_(unsigned int llvm_cbe_x0, unsigned int llvm_cbe_y0, unsigned int *llvm_cbe_xpl, unsigned int *llvm_cbe_ypl);
static void _ZN9regmngobj6createEv(void);
unsigned int open(unsigned char *, unsigned int , ...);
unsigned long long read(unsigned int , unsigned char *, unsigned long long );
unsigned int close(unsigned int );
static void _ZN9regmngobj20definemiddleregpointEv(void);
static void _ZN9regmngobj7destroyEv(void);
void _ZdlPv(unsigned char *);
static void _ZN9regmngobj15redefineregionsEv(void);
static void _ZN9regmngobj13deleteregionsEv(void);
static void _ZN9regmngobj18enlargeneighborsesEi(unsigned int llvm_cbe_critical);
static void _ZN9regmngobj19defineneighborhood1Ev(void);
static void _ZN15largesolidarrayIP6regobjE8doublingEv(void);
unsigned char *_Znwm(unsigned long long );
static void _ZN6regobj6createEii(struct l_struct_2E_regobj *llvm_cbe_this, unsigned int llvm_cbe_x0, unsigned int llvm_cbe_y0);
static void _ZN9regmngobj13createregionsEi(unsigned int llvm_cbe_regionl);
unsigned int printf(unsigned char *, ...);
static unsigned char _ZN7way2obj9createwayEiiiiPhRP6pointtRi(unsigned int llvm_cbe_startx, unsigned int llvm_cbe_starty, unsigned int llvm_cbe_endx, unsigned int llvm_cbe_endy, unsigned char *llvm_cbe_movetimearp, struct l_struct_2E_pointt **llvm_cbe_wayar, unsigned int *llvm_cbe_waylength);
static void _ZN6wayobj7destroyEv(void);
static void _ZN6wayobj6createE17createwaymnginfot(unsigned int llvm_cbe_info_0_0, unsigned int llvm_cbe_info_0_1, unsigned int llvm_cbe_info_0_2, unsigned int llvm_cbe_info_0_3, unsigned int llvm_cbe_info_0_4, unsigned int llvm_cbe_info_0_5, unsigned int llvm_cbe_info_0_6, unsigned int llvm_cbe_info_0_7);
double log(double );
unsigned int putchar(unsigned int );
unsigned int main(unsigned int llvm_cbe_argc, unsigned char **llvm_cbe_argv);
unsigned int puts(unsigned char *);
unsigned int fscanf(struct l_struct_2E_FILE *, unsigned char *, ...);
static void _ZN9regwayobj6createEP9regmngobj(struct l_struct_2E_regwayobj *llvm_cbe_this, struct l_struct_2E_regmngobj *llvm_cbe_regmngpin);
unsigned long long time(unsigned long long *);
static unsigned char _ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri(struct l_struct_2E_regobj *llvm_cbe_rstart, struct l_struct_2E_regobj *llvm_cbe_rfinish, struct l_struct_2E_regobj ***llvm_cbe_wayar, unsigned int *llvm_cbe_waylength);
static void _ZN9regwayobj7destroyEv(struct l_struct_2E_regwayobj *llvm_cbe_this);
static void _ZN6regobj10makebound2ER9flexarrayI6pointtES3_(struct l_struct_2E_regobj *llvm_cbe_this, struct l_struct_2E_boundart *llvm_cbe_b1arp, struct l_struct_2E_boundart *llvm_cbe_b2arp);
static unsigned char _ZN9regwayobj12isaddtoboundEP6regobjS1_(struct l_struct_2E_regwayobj *llvm_cbe_this, struct l_struct_2E_regobj *llvm_cbe_initialregionp, struct l_struct_2E_regobj *llvm_cbe_regionp);
static void _ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_(struct l_struct_2E_flexarray_3C_regobj_2A__3E_ *llvm_cbe_b1arp, struct l_struct_2E_flexarray_3C_regobj_2A__3E_ *llvm_cbe_b2arp);
static unsigned int _ZN6wayobj10makebound2EPiiS0_(unsigned int *llvm_cbe_bound1p, unsigned int llvm_cbe_bound1l, unsigned int *llvm_cbe_bound2p);
static unsigned int _ZN6wayobj18makeobstaclebound2EPiiS0_(unsigned int *llvm_cbe_bound1p, unsigned int llvm_cbe_bound1l, unsigned int *llvm_cbe_bound2p);
unsigned char *malloc();
void free(unsigned char *);
void abort(void);
unsigned char *memset(unsigned char *, unsigned int , unsigned long long );
unsigned char *memcpy(unsigned char *, unsigned char *, unsigned long long );


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
static unsigned char _2E_str6[23];
static unsigned int way_2E_0;
static unsigned int way_2E_1;
static unsigned int way_2E_2;
static unsigned int way_2E_3;
static unsigned int way_2E_4;
static unsigned int way_2E_5;
static unsigned int way_2E_6;
static unsigned int way_2E_7;
static unsigned int way_2E_8;
static unsigned short *way_2E_16;
static struct l_struct_2E_point16t *way_2E_17;
static unsigned int *way_2E_18;
static unsigned int *way_2E_19;
static unsigned int way_2E_20;
static unsigned int way_2E_21;
static bool way_2E_22_2E_b;
static unsigned int way_2E_23;
static unsigned short way_2E_24;
static unsigned short way_2E_25;
static struct l_struct_2E_regwayobj regway;
static struct l_struct_2E_regmngobj regmng;
static struct l_struct_2E_way2obj way2;
static unsigned char _2E_str17[33];
static unsigned char _2E_str12[25];
static unsigned char _2E_str28[22];
static unsigned char _2E_str39[25];
static unsigned char _2E_str410[29];
static unsigned char _2E_str511[26];
static unsigned char _2E_str612[29];
static unsigned char _2E_str7[31];
static unsigned char _2E_str8[28];
static unsigned char _2E_str9[31];
static unsigned char _2E_str10[30];
static unsigned char _2E_str11[27];
static unsigned char _2E_str123[30];
static unsigned int  (*_ZTV9regwayobj[5]) ();
static unsigned char _2E_str13[27];
static unsigned char _2E_str14[24];
static unsigned char _2E_str15[36];
static unsigned char _2E_str16[2];
static unsigned char _2E_str1713[31];
static unsigned char _2E_str18[3];
static unsigned char _2E_str19[3];
static unsigned char _2E_str20[3];
static unsigned char _2E_str21[12];
static unsigned char _2E_str22[11];
static unsigned int y3rnd;
static unsigned int y2rnd;
static unsigned int y1rnd;
static struct l_struct_2E_boundart _ZN6regobj9bound1arpE;
static struct l_struct_2E_boundart _ZN6regobj9bound2arpE;
static struct l_struct_2E___class_type_info_pseudo _ZTI9regwayobj;
static unsigned char _ZTS9regwayobj[11];
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
static unsigned char _2E_str6[23] = "Error in createregions";
static unsigned int way_2E_0;
static unsigned int way_2E_1;
static unsigned int way_2E_2;
static unsigned int way_2E_3;
static unsigned int way_2E_4;
static unsigned int way_2E_5;
static unsigned int way_2E_6;
static unsigned int way_2E_7;
static unsigned int way_2E_8;
static unsigned short *way_2E_16;
static struct l_struct_2E_point16t *way_2E_17;
static unsigned int *way_2E_18;
static unsigned int *way_2E_19;
static unsigned int way_2E_20;
static unsigned int way_2E_21;
static bool way_2E_22_2E_b;
static unsigned int way_2E_23;
static unsigned short way_2E_24;
static unsigned short way_2E_25;
static struct l_struct_2E_regwayobj regway = { (&(_ZTV9regwayobj[((signed long long )((unsigned long long )2ll))])), { ((struct l_struct_2E_regobj **)/*NULL*/0), ((unsigned int )0), ((unsigned int )0) }, { ((struct l_struct_2E_regobj **)/*NULL*/0), ((unsigned int )0), ((unsigned int )0) }, ((unsigned int )0), ((unsigned int )0), ((struct l_struct_2E_regmngobj *)/*NULL*/0), ((unsigned char )0), ((struct l_struct_2E_regobj *)/*NULL*/0), ((struct l_struct_2E_regobj *)/*NULL*/0) };
static struct l_struct_2E_regmngobj regmng;
static struct l_struct_2E_way2obj way2;
static unsigned char _2E_str17[33] = "Create regional map time : %.0f\n";
static unsigned char _2E_str12[25] = "Create ways time : %.0f\n";
static unsigned char _2E_str28[22] = "Ways quantity : %lld\n";
static unsigned char _2E_str39[25] = "Total way length : %lld\n";
static unsigned char _2E_str410[29] = "Create reg ways time : %.0f\n";
static unsigned char _2E_str511[26] = "Reg ways quantity : %lld\n";
static unsigned char _2E_str612[29] = "Total reg way length : %lld\n";
static unsigned char _2E_str7[31] = "Create river ways time : %.0f\n";
static unsigned char _2E_str8[28] = "River ways quantity : %lld\n";
static unsigned char _2E_str9[31] = "Total river way length : %lld\n";
static unsigned char _2E_str10[30] = "Create land ways time : %.0f\n";
static unsigned char _2E_str11[27] = "Land ways quantity : %lld\n";
static unsigned char _2E_str123[30] = "Total land way length : %lld\n";
static unsigned int  (*_ZTV9regwayobj[5]) () = { ((unsigned int  (*) ())/*NULL*/0), ((unsigned int  (*) ())(&_ZTI9regwayobj)), ((unsigned int  (*) ())_ZN9regwayobj12isaddtoboundEP6regobjS1_), ((unsigned int  (*) ())_ZN9regwayobj6createEP9regmngobj), ((unsigned int  (*) ())_ZN9regwayobj7destroyEv) };
static unsigned char _2E_str13[27] = "Small Path Finding Library";
static unsigned char _2E_str14[24] = "Read configuration file";
static unsigned char _2E_str15[36] = "Cannot read configuration file name";
static unsigned char _2E_str16[2] = "r";
static unsigned char _2E_str1713[31] = "Cannot read configuration file";
static unsigned char _2E_str18[3] = "%s";
static unsigned char _2E_str19[3] = "%d";
static unsigned char _2E_str20[3] = "%f";
static unsigned char _2E_str21[12] = "Create ways";
static unsigned char _2E_str22[11] = "Random map";
static unsigned int y3rnd = ((unsigned int )3007);
static unsigned int y2rnd = ((unsigned int )11);
static unsigned int y1rnd = ((unsigned int )1023);
static struct l_struct_2E_boundart _ZN6regobj9bound1arpE;
static struct l_struct_2E_boundart _ZN6regobj9bound2arpE;
static struct l_struct_2E___class_type_info_pseudo _ZTI9regwayobj = { { ((unsigned char *)(unsigned long)(((unsigned long long )(unsigned long)(&_ZTVN10__cxxabiv117__class_type_infoE)) + ((unsigned long long )16ll))), (&(_ZTS9regwayobj[((signed int )((unsigned int )0))])) } };
static unsigned char _ZTS9regwayobj[11] = "9regwayobj";
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


static unsigned char _ZN6wayobj9createwayEiiiiRP8point16tRi(unsigned int llvm_cbe_startx, unsigned int llvm_cbe_starty, unsigned int llvm_cbe_endx, unsigned int llvm_cbe_endy, struct l_struct_2E_point16t **llvm_cbe_wayar, unsigned int *llvm_cbe_waylength) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  struct l_struct_2E_point16t llvm_cbe_deltaar_i[8];    /* Address-exposed local */
  unsigned int llvm_cbe_tmp14_i;
  unsigned int llvm_cbe_tmp25_i;
  unsigned short *llvm_cbe_tmp33;
  unsigned int llvm_cbe_tmp36;
  unsigned short llvm_cbe_tmp46;
  unsigned char *ltmp_11_2;
  unsigned short llvm_cbe_tmp5_i;
  unsigned int llvm_cbe_tmp10_i;
  unsigned int llvm_cbe_tmp14_i5;
  struct l_struct_2E_point16t *llvm_cbe_tmp20_i;
  unsigned char *ltmp_12_2;
  unsigned short llvm_cbe_tmp26_rle_i;
  unsigned short llvm_cbe_tmp26_rle_i__PHI_TEMPORARY;
  unsigned short llvm_cbe_tmp27_i;
  unsigned int *llvm_cbe_tmp32_i;
  unsigned int llvm_cbe_tmp40_i;
  unsigned int llvm_cbe_tmp44_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp50_i6;
  unsigned long long llvm_cbe_tmp5758_i;
  unsigned int llvm_cbe_tmp93_i;
  unsigned int *llvm_cbe_tmp110_i;
  unsigned int llvm_cbe_tmp116_i;
  unsigned int llvm_cbe_tmp125_i;
  unsigned char llvm_cbe_storemerge162_i;
  unsigned char llvm_cbe_storemerge162_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_storemerge161_i;
  unsigned int llvm_cbe_storemerge161_i__PHI_TEMPORARY;
  unsigned short llvm_cbe_storemerge_i9;
  unsigned short llvm_cbe_storemerge_in_i_rle24;
  unsigned short llvm_cbe_storemerge_in_i_rle24__PHI_TEMPORARY;
  unsigned char llvm_cbe_flodd_1_reg2mem_0_i;
  unsigned char llvm_cbe_flodd_1_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_boundl_1_reg2mem_0_i;
  unsigned int llvm_cbe_boundl_1_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  bool llvm_cbe_tmp142_i_b;
  unsigned short llvm_cbe_tmp132_i_rle;
  unsigned short llvm_cbe_tmp132_i_rle__PHI_TEMPORARY;
  bool llvm_cbe_tmp150_i_b;
  unsigned int llvm_cbe_tmp132133_i;
  unsigned char *ltmp_13_2;
  unsigned int llvm_cbe_tmp154_i;
  unsigned int llvm_cbe_tmp156_i;
  unsigned int llvm_cbe_tmp168_i;
  unsigned int llvm_cbe_tmp173_i;
  unsigned int llvm_cbe_tmp592_i_rle55;
  unsigned int llvm_cbe_tmp592_i_rle55__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp577_i_rle44;
  unsigned int llvm_cbe_tmp577_i_rle44__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar_i;
  unsigned int llvm_cbe_indvar_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_index_1_reg2mem_0_i;
  unsigned int llvm_cbe_index_1_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_0_reg2mem_0_i;
  unsigned int llvm_cbe_tmp184_i;
  unsigned int llvm_cbe_tmp197_i;
  unsigned int llvm_cbe_tmp203_i;
  unsigned int llvm_cbe_tmp206_i;
  unsigned int llvm_cbe_dpx_0_i;
  unsigned int llvm_cbe_dpx_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_dpy_0_i;
  unsigned int llvm_cbe_dpy_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp230_i;
  unsigned int llvm_cbe_a_0_i;
  unsigned int llvm_cbe_b_0_i;
  unsigned int llvm_cbe_c_0_i;
  unsigned int llvm_cbe_d_0_i;
  unsigned int llvm_cbe_tmp592_i_rle50;
  unsigned int llvm_cbe_tmp592_i_rle50__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp577_i_rle39;
  unsigned int llvm_cbe_tmp577_i_rle39__PHI_TEMPORARY;
  unsigned int llvm_cbe_delta1num_0_reg2mem_0_i;
  unsigned int llvm_cbe_delta1num_0_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_delta2num_0_in_in_reg2mem_0_i;
  unsigned int llvm_cbe_delta2num_0_in_in_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_j_0_reg2mem_0_i;
  unsigned int llvm_cbe_j_0_reg2mem_0_i__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp382383_i;
  unsigned short llvm_cbe_tmp386_i;
  unsigned int llvm_cbe_tmp389_i;
  unsigned short llvm_cbe_tmp394_i;
  unsigned int llvm_cbe_tmp397_i;
  unsigned int llvm_cbe_tmp411_i;
  unsigned long long llvm_cbe_tmp416417_i;
  unsigned short llvm_cbe_tmp420_i;
  unsigned short llvm_cbe_tmp433_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp441_i;
  unsigned long long llvm_cbe_tmp442443_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp449_i;
  unsigned long long llvm_cbe_tmp459460671_i;
  unsigned short llvm_cbe_tmp463_i;
  unsigned int llvm_cbe_tmp466_i;
  unsigned short llvm_cbe_tmp471_i;
  unsigned int llvm_cbe_tmp474_i;
  unsigned int llvm_cbe_tmp488_i;
  unsigned long long llvm_cbe_tmp493494_i;
  unsigned short llvm_cbe_tmp497_i;
  unsigned short llvm_cbe_tmp510_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp518_i;
  unsigned long long llvm_cbe_tmp519520_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp526_i;
  unsigned int llvm_cbe_tmp537_i;
  unsigned int llvm_cbe_delta1num_1_i;
  unsigned int llvm_cbe_tmp548_i;
  unsigned int llvm_cbe_phitmp672_i;
  unsigned int llvm_cbe_tmp592_i_rle51;
  unsigned int llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp577_i_rle40;
  unsigned int llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY;
  unsigned int llvm_cbe_delta1num_0_i;
  unsigned int llvm_cbe_delta1num_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_delta2num_0_in_in_i;
  unsigned int llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_j_0_i;
  unsigned int llvm_cbe_j_0_i__PHI_TEMPORARY;
  struct l_struct_2E_point16t *llvm_cbe_tmp556_i;
  unsigned int llvm_cbe_index_0_reg2mem_0_i;
  unsigned int llvm_cbe_index_0_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar_next_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp569_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp616_i;
  unsigned long long llvm_cbe_tmp618657_i;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )1);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )1));
  if (((((signed int )llvm_cbe_starty) < ((signed int )((unsigned int )1))) | (((signed int )llvm_cbe_startx) < ((signed int )((unsigned int )1))))) {
    goto llvm_cbe_cond_true21;
  } else {
    goto llvm_cbe_cond_next11_i;
  }

llvm_cbe_cond_next11_i:
  llvm_cbe_tmp14_i = *(&way_2E_5);
  if ((((signed int )llvm_cbe_tmp14_i) < ((signed int )llvm_cbe_startx))) {
    goto llvm_cbe_cond_true21;
  } else {
    goto llvm_cbe_cond_next21_i;
  }

llvm_cbe_cond_next21_i:
  llvm_cbe_tmp25_i = *(&way_2E_6);
  if ((((signed int )llvm_cbe_tmp25_i) < ((signed int )llvm_cbe_starty))) {
    goto llvm_cbe_cond_true21;
  } else {
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_next:
  if (((((((signed int )llvm_cbe_endy) < ((signed int )((unsigned int )1))) | (((signed int )llvm_cbe_endx) < ((signed int )((unsigned int )1)))) | (((signed int )llvm_cbe_tmp14_i) < ((signed int )llvm_cbe_endx))) | (((signed int )llvm_cbe_tmp25_i) < ((signed int )llvm_cbe_endy)))) {
    goto llvm_cbe_cond_true21;
  } else {
    goto llvm_cbe_bb16;
  }

llvm_cbe_bb16:
  llvm_cbe_tmp33 = *(&way_2E_16);
  llvm_cbe_tmp36 = *(&way_2E_2);
  llvm_cbe_tmp46 = *(&llvm_cbe_tmp33[((signed long long )(((signed long long )(signed int )((llvm_cbe_endy << llvm_cbe_tmp36) | llvm_cbe_endx))))]);
  if ((llvm_cbe_tmp46 == ((unsigned short )0))) {
    goto llvm_cbe_cond_next55;
  } else {
    goto llvm_cbe_cond_true51;
  }

llvm_cbe_cond_true21:
  *llvm_cbe_wayar = ((struct l_struct_2E_point16t *)/*NULL*/0);
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
llvm_cbe_cond_true51:
  *llvm_cbe_wayar = ((struct l_struct_2E_point16t *)/*NULL*/0);
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
llvm_cbe_cond_next55:
  if (((llvm_cbe_starty == llvm_cbe_endy) & (llvm_cbe_startx == llvm_cbe_endx))) {
    goto llvm_cbe_cond_true69;
  } else {
    goto llvm_cbe_cond_next75;
  }

llvm_cbe_cond_true69:
  ltmp_11_2 =  /*tail*/ malloc(((unsigned long long )4ll));
  *llvm_cbe_wayar = (((struct l_struct_2E_point16t *)ltmp_11_2));
  *llvm_cbe_waylength = ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )1);
llvm_cbe_cond_next75:
  llvm_cbe_tmp5_i = *(&way_2E_25);
  if ((llvm_cbe_tmp5_i == ((unsigned short )-1))) {
    goto llvm_cbe_cond_true_i;
  } else {
    llvm_cbe_tmp26_rle_i__PHI_TEMPORARY = llvm_cbe_tmp5_i;   /* for PHI node */
    goto llvm_cbe_cond_next_i;
  }

llvm_cbe_cond_true_i:
  llvm_cbe_tmp10_i = *(&way_2E_0);
  llvm_cbe_tmp14_i5 = *(&way_2E_1);
  llvm_cbe_tmp20_i = *(&way_2E_17);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )1);
  ltmp_12_2 = memset((((unsigned char *)llvm_cbe_tmp20_i)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )((((unsigned int )1) << llvm_cbe_tmp10_i) << llvm_cbe_tmp14_i5))) << ((unsigned long long )2ll)));
  *(&way_2E_25) = ((unsigned short )0);
  llvm_cbe_tmp26_rle_i__PHI_TEMPORARY = ((unsigned short )0);   /* for PHI node */
  goto llvm_cbe_cond_next_i;

llvm_cbe_cond_next_i:
  llvm_cbe_tmp26_rle_i = llvm_cbe_tmp26_rle_i__PHI_TEMPORARY;
  llvm_cbe_tmp27_i = ((unsigned short )(llvm_cbe_tmp26_rle_i + ((unsigned short )1)));
  *(&way_2E_25) = llvm_cbe_tmp27_i;
  llvm_cbe_tmp32_i = *(&way_2E_18);
  llvm_cbe_tmp40_i = *(&way_2E_2);
  llvm_cbe_tmp44_i = (llvm_cbe_starty << llvm_cbe_tmp40_i) | llvm_cbe_startx;
  *llvm_cbe_tmp32_i = llvm_cbe_tmp44_i;
  llvm_cbe_tmp50_i6 = *(&way_2E_17);
  llvm_cbe_tmp5758_i = ((signed long long )(signed int )llvm_cbe_tmp44_i);
  *(&llvm_cbe_tmp50_i6[((signed long long )llvm_cbe_tmp5758_i)].field0) = llvm_cbe_tmp27_i;
  *(&llvm_cbe_tmp50_i6[((signed long long )llvm_cbe_tmp5758_i)].field1) = ((unsigned short )0);
  *(&way_2E_22_2E_b) = ((0) & 1);
  llvm_cbe_tmp93_i = (llvm_cbe_endy << llvm_cbe_tmp40_i) | llvm_cbe_endx;
  *(&way_2E_23) = llvm_cbe_tmp93_i;
  *(&way_2E_24) = ((unsigned short )1);
  llvm_cbe_tmp110_i = *(&way_2E_19);
  llvm_cbe_storemerge_in_i_rle24__PHI_TEMPORARY = ((unsigned short )1);   /* for PHI node */
  llvm_cbe_flodd_1_reg2mem_0_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
  llvm_cbe_boundl_1_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )1);   /* for PHI node */
  goto llvm_cbe_cond_next139_i;

  do {     /* Syntactic loop 'cond_next139.i' to make GCC happy */
llvm_cbe_cond_next139_i:
  llvm_cbe_storemerge_in_i_rle24 = llvm_cbe_storemerge_in_i_rle24__PHI_TEMPORARY;
  llvm_cbe_flodd_1_reg2mem_0_i = llvm_cbe_flodd_1_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_boundl_1_reg2mem_0_i = llvm_cbe_boundl_1_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )31);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )31));
  llvm_cbe_tmp142_i_b = *(&way_2E_22_2E_b);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if (llvm_cbe_tmp142_i_b) {
    llvm_cbe_tmp132_i_rle__PHI_TEMPORARY = llvm_cbe_storemerge_in_i_rle24;   /* for PHI node */
    goto llvm_cbe__ZN6wayobj4fillEiiii_exit;
  } else {
    goto llvm_cbe_bb101_i;
  }

llvm_cbe_bb133_i:
  llvm_cbe_storemerge162_i = llvm_cbe_storemerge162_i__PHI_TEMPORARY;
  llvm_cbe_storemerge161_i = llvm_cbe_storemerge161_i__PHI_TEMPORARY;
  llvm_cbe_storemerge_i9 = ((unsigned short )(llvm_cbe_storemerge_in_i_rle24 + ((unsigned short )1)));
  *(&way_2E_24) = llvm_cbe_storemerge_i9;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_storemerge161_i == ((unsigned int )0))) {
    llvm_cbe_tmp132_i_rle__PHI_TEMPORARY = llvm_cbe_storemerge_i9;   /* for PHI node */
    goto llvm_cbe__ZN6wayobj4fillEiiii_exit;
  } else {
    llvm_cbe_storemerge_in_i_rle24__PHI_TEMPORARY = llvm_cbe_storemerge_i9;   /* for PHI node */
    llvm_cbe_flodd_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_storemerge162_i;   /* for PHI node */
    llvm_cbe_boundl_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_storemerge161_i;   /* for PHI node */
    goto llvm_cbe_cond_next139_i;
  }

llvm_cbe_cond_true107_i:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )31);
  llvm_cbe_tmp116_i =  /*tail*/ _ZN6wayobj10makebound2EPiiS0_(llvm_cbe_tmp32_i, llvm_cbe_boundl_1_reg2mem_0_i, llvm_cbe_tmp110_i);
  llvm_cbe_storemerge162_i__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
  llvm_cbe_storemerge161_i__PHI_TEMPORARY = llvm_cbe_tmp116_i;   /* for PHI node */
  goto llvm_cbe_bb133_i;

llvm_cbe_bb101_i:
  if ((llvm_cbe_flodd_1_reg2mem_0_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_true107_i;
  } else {
    goto llvm_cbe_cond_false_i8;
  }

llvm_cbe_cond_false_i8:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )31);
  llvm_cbe_tmp125_i =  /*tail*/ _ZN6wayobj10makebound2EPiiS0_(llvm_cbe_tmp110_i, llvm_cbe_boundl_1_reg2mem_0_i, llvm_cbe_tmp32_i);
  llvm_cbe_storemerge162_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
  llvm_cbe_storemerge161_i__PHI_TEMPORARY = llvm_cbe_tmp125_i;   /* for PHI node */
  goto llvm_cbe_bb133_i;

  } while (1); /* end of syntactic loop 'cond_next139.i' */
llvm_cbe__ZN6wayobj4fillEiiii_exit:
  llvm_cbe_tmp132_i_rle = llvm_cbe_tmp132_i_rle__PHI_TEMPORARY;
  llvm_cbe_tmp150_i_b = *(&way_2E_22_2E_b);
  if (llvm_cbe_tmp150_i_b) {
    goto llvm_cbe_cond_next90;
  } else {
    goto llvm_cbe_cond_true86;
  }

llvm_cbe_cond_true86:
  *llvm_cbe_wayar = ((struct l_struct_2E_point16t *)/*NULL*/0);
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
llvm_cbe_cond_next90:
  *(&llvm_cbe_deltaar_i[((signed int )((unsigned int )0))].field0) = ((unsigned short )-1);
  *(&llvm_cbe_deltaar_i[((signed int )((unsigned int )0))].field1) = ((unsigned short )1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )1ll))].field0) = ((unsigned short )0);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )1ll))].field1) = ((unsigned short )1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )2ll))].field0) = ((unsigned short )1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )2ll))].field1) = ((unsigned short )1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )3ll))].field0) = ((unsigned short )1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )3ll))].field1) = ((unsigned short )0);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )4ll))].field0) = ((unsigned short )1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )4ll))].field1) = ((unsigned short )-1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )5ll))].field0) = ((unsigned short )0);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )5ll))].field1) = ((unsigned short )-1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )6ll))].field0) = ((unsigned short )-1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )6ll))].field1) = ((unsigned short )-1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )7ll))].field0) = ((unsigned short )-1);
  *(&llvm_cbe_deltaar_i[((signed long long )((unsigned long long )7ll))].field1) = ((unsigned short )0);
  llvm_cbe_tmp132133_i = ((signed int )(signed short )llvm_cbe_tmp132_i_rle);
  ltmp_13_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp132133_i)) * ((unsigned long long )4ll)));
  *llvm_cbe_wayar = (((struct l_struct_2E_point16t *)ltmp_13_2));
  llvm_cbe_tmp154_i = *(&way_2E_21);
  llvm_cbe_tmp156_i = llvm_cbe_tmp154_i & llvm_cbe_tmp44_i;
  llvm_cbe_tmp168_i = ((signed int )(((signed int )llvm_cbe_tmp44_i) >> ((signed int )llvm_cbe_tmp40_i)));
  llvm_cbe_tmp173_i = llvm_cbe_tmp132133_i + ((unsigned int )-2);
  if ((((signed int )llvm_cbe_tmp173_i) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_tmp592_i_rle55__PHI_TEMPORARY = llvm_cbe_tmp154_i;   /* for PHI node */
    llvm_cbe_tmp577_i_rle44__PHI_TEMPORARY = llvm_cbe_tmp40_i;   /* for PHI node */
    llvm_cbe_indvar_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_index_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp93_i;   /* for PHI node */
    goto llvm_cbe_bb174_i;
  } else {
    goto llvm_cbe_bb567_i;
  }

  do {     /* Syntactic loop 'bb174.i' to make GCC happy */
llvm_cbe_bb174_i:
  llvm_cbe_tmp592_i_rle55 = llvm_cbe_tmp592_i_rle55__PHI_TEMPORARY;
  llvm_cbe_tmp577_i_rle44 = llvm_cbe_tmp577_i_rle44__PHI_TEMPORARY;
  llvm_cbe_indvar_i = llvm_cbe_indvar_i__PHI_TEMPORARY;
  llvm_cbe_index_1_reg2mem_0_i = llvm_cbe_index_1_reg2mem_0_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )32);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )32));
  llvm_cbe_i_0_reg2mem_0_i = llvm_cbe_tmp173_i - llvm_cbe_indvar_i;
  llvm_cbe_tmp184_i = llvm_cbe_tmp154_i & llvm_cbe_index_1_reg2mem_0_i;
  llvm_cbe_tmp197_i = ((signed int )(((signed int )llvm_cbe_index_1_reg2mem_0_i) >> ((signed int )llvm_cbe_tmp40_i)));
  llvm_cbe_tmp203_i = llvm_cbe_tmp156_i - llvm_cbe_tmp184_i;
  llvm_cbe_tmp206_i = llvm_cbe_tmp168_i - llvm_cbe_tmp197_i;
  if ((((signed int )llvm_cbe_tmp203_i) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_dpx_0_i__PHI_TEMPORARY = ((unsigned int )1);   /* for PHI node */
    goto llvm_cbe_cond_next215_i;
  } else {
    goto llvm_cbe_cond_false_i;
  }

llvm_cbe_bb562_i:
  llvm_cbe_index_0_reg2mem_0_i = llvm_cbe_index_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_indvar_next_i = llvm_cbe_indvar_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )-1))) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_tmp592_i_rle55__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle50;   /* for PHI node */
    llvm_cbe_tmp577_i_rle44__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle39;   /* for PHI node */
    llvm_cbe_indvar_i__PHI_TEMPORARY = llvm_cbe_indvar_next_i;   /* for PHI node */
    llvm_cbe_index_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_index_0_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_bb174_i;
  } else {
    goto llvm_cbe_bb567_i;
  }

llvm_cbe_cond_true439_i:
  llvm_cbe_tmp441_i = *llvm_cbe_wayar;
  llvm_cbe_tmp442443_i = ((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i);
  *(&llvm_cbe_tmp441_i[((signed long long )llvm_cbe_tmp442443_i)].field0) = (((unsigned short )llvm_cbe_tmp389_i));
  llvm_cbe_tmp449_i = *llvm_cbe_wayar;
  *(&llvm_cbe_tmp449_i[((signed long long )llvm_cbe_tmp442443_i)].field1) = (((unsigned short )llvm_cbe_tmp397_i));
  llvm_cbe_index_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp411_i;   /* for PHI node */
  goto llvm_cbe_bb562_i;

llvm_cbe_cond_true427_i:
  llvm_cbe_tmp433_i = *(&llvm_cbe_tmp50_i6[((signed long long )llvm_cbe_tmp416417_i)].field1);
  if (((((unsigned int )(unsigned short )llvm_cbe_tmp433_i)) == llvm_cbe_i_0_reg2mem_0_i)) {
    goto llvm_cbe_cond_true439_i;
  } else {
    goto llvm_cbe_cond_next458_i;
  }

llvm_cbe_bb381_i:
  llvm_cbe_tmp592_i_rle50 = llvm_cbe_tmp592_i_rle50__PHI_TEMPORARY;
  llvm_cbe_tmp577_i_rle39 = llvm_cbe_tmp577_i_rle39__PHI_TEMPORARY;
  llvm_cbe_delta1num_0_reg2mem_0_i = llvm_cbe_delta1num_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_delta2num_0_in_in_reg2mem_0_i = llvm_cbe_delta2num_0_in_in_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_j_0_reg2mem_0_i = llvm_cbe_j_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_tmp382383_i = ((signed long long )(signed int )llvm_cbe_delta1num_0_reg2mem_0_i);
  llvm_cbe_tmp386_i = *(&llvm_cbe_deltaar_i[((signed long long )llvm_cbe_tmp382383_i)].field0);
  llvm_cbe_tmp389_i = (((signed int )(signed short )llvm_cbe_tmp386_i)) + llvm_cbe_tmp184_i;
  llvm_cbe_tmp394_i = *(&llvm_cbe_deltaar_i[((signed long long )llvm_cbe_tmp382383_i)].field1);
  llvm_cbe_tmp397_i = (((signed int )(signed short )llvm_cbe_tmp394_i)) + llvm_cbe_tmp197_i;
  llvm_cbe_tmp411_i = (llvm_cbe_tmp397_i << llvm_cbe_tmp40_i) | llvm_cbe_tmp389_i;
  llvm_cbe_tmp416417_i = ((signed long long )(signed int )llvm_cbe_tmp411_i);
  llvm_cbe_tmp420_i = *(&llvm_cbe_tmp50_i6[((signed long long )llvm_cbe_tmp416417_i)].field0);
  if ((llvm_cbe_tmp420_i == llvm_cbe_tmp27_i)) {
    goto llvm_cbe_cond_true427_i;
  } else {
    goto llvm_cbe_cond_next458_i;
  }

llvm_cbe_cond_next363_i:
  if (((llvm_cbe_c_0_i == ((unsigned int )1)) & (llvm_cbe_d_0_i == ((unsigned int )-1)))) {
    llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = ((unsigned int )1);   /* for PHI node */
    llvm_cbe_j_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb549_i;
  } else {
    llvm_cbe_tmp592_i_rle50__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle39__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )6);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )7);   /* for PHI node */
    llvm_cbe_j_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb381_i;
  }

llvm_cbe_cond_next350_i:
  if (((llvm_cbe_b_0_i == ((unsigned int )1)) & (llvm_cbe_c_0_i == ((unsigned int )-1)))) {
    llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_i__PHI_TEMPORARY = ((unsigned int )7);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_j_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb549_i;
  } else {
    goto llvm_cbe_cond_next363_i;
  }

llvm_cbe_cond_next337_i:
  if (((llvm_cbe_a_0_i == ((unsigned int )1)) & (llvm_cbe_b_0_i == ((unsigned int )-1)))) {
    llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_i__PHI_TEMPORARY = ((unsigned int )6);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = ((unsigned int )7);   /* for PHI node */
    llvm_cbe_j_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb549_i;
  } else {
    goto llvm_cbe_cond_next350_i;
  }

llvm_cbe_cond_next324_i:
  if (((llvm_cbe_a_0_i == ((unsigned int )-1)) & (llvm_cbe_d_0_i == ((unsigned int )-1)))) {
    llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_i__PHI_TEMPORARY = ((unsigned int )5);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = ((unsigned int )6);   /* for PHI node */
    llvm_cbe_j_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb549_i;
  } else {
    goto llvm_cbe_cond_next337_i;
  }

llvm_cbe_cond_next311_i:
  if (((llvm_cbe_d_0_i == ((unsigned int )1)) & (llvm_cbe_c_0_i == ((unsigned int )-1)))) {
    llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_i__PHI_TEMPORARY = ((unsigned int )4);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = ((unsigned int )5);   /* for PHI node */
    llvm_cbe_j_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb549_i;
  } else {
    goto llvm_cbe_cond_next324_i;
  }

llvm_cbe_cond_next298_i:
  if (((llvm_cbe_c_0_i == ((unsigned int )1)) & (llvm_cbe_b_0_i == ((unsigned int )-1)))) {
    llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_i__PHI_TEMPORARY = ((unsigned int )3);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = ((unsigned int )4);   /* for PHI node */
    llvm_cbe_j_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb549_i;
  } else {
    goto llvm_cbe_cond_next311_i;
  }

llvm_cbe_cond_next285_i:
  if (((llvm_cbe_b_0_i == ((unsigned int )1)) & (llvm_cbe_a_0_i == ((unsigned int )-1)))) {
    llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_i__PHI_TEMPORARY = ((unsigned int )2);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = ((unsigned int )3);   /* for PHI node */
    llvm_cbe_j_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb549_i;
  } else {
    goto llvm_cbe_cond_next298_i;
  }

llvm_cbe_cond_next228_i:
  llvm_cbe_dpy_0_i = llvm_cbe_dpy_0_i__PHI_TEMPORARY;
  llvm_cbe_tmp230_i = llvm_cbe_dpy_0_i * ((unsigned int )100);
  llvm_cbe_a_0_i = (((((signed int )llvm_cbe_tmp230_i) < ((signed int )(llvm_cbe_dpx_0_i * ((unsigned int )241))))) ? (((unsigned int )-1)) : (((unsigned int )1)));
  llvm_cbe_b_0_i = (((((signed int )llvm_cbe_tmp230_i) < ((signed int )(llvm_cbe_dpx_0_i * ((unsigned int )41))))) ? (((unsigned int )-1)) : (((unsigned int )1)));
  llvm_cbe_c_0_i = (((((signed int )llvm_cbe_tmp230_i) < ((signed int )(llvm_cbe_dpx_0_i * ((unsigned int )-40))))) ? (((unsigned int )-1)) : (((unsigned int )1)));
  llvm_cbe_d_0_i = (((((signed int )llvm_cbe_tmp230_i) < ((signed int )(llvm_cbe_dpx_0_i * ((unsigned int )-240))))) ? (((unsigned int )-1)) : (((unsigned int )1)));
  if (((llvm_cbe_a_0_i == ((unsigned int )1)) & (llvm_cbe_d_0_i == ((unsigned int )1)))) {
    llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle55;   /* for PHI node */
    llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle44;   /* for PHI node */
    llvm_cbe_delta1num_0_i__PHI_TEMPORARY = ((unsigned int )1);   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = ((unsigned int )2);   /* for PHI node */
    llvm_cbe_j_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb549_i;
  } else {
    goto llvm_cbe_cond_next285_i;
  }

llvm_cbe_cond_next215_i:
  llvm_cbe_dpx_0_i = llvm_cbe_dpx_0_i__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_tmp206_i) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_dpy_0_i__PHI_TEMPORARY = ((unsigned int )1);   /* for PHI node */
    goto llvm_cbe_cond_next228_i;
  } else {
    goto llvm_cbe_cond_false221_i;
  }

llvm_cbe_cond_false_i:
  if ((((signed int )llvm_cbe_tmp203_i) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_cond_true214_i;
  } else {
    llvm_cbe_dpx_0_i__PHI_TEMPORARY = llvm_cbe_tmp203_i;   /* for PHI node */
    goto llvm_cbe_cond_next215_i;
  }

llvm_cbe_cond_true214_i:
  llvm_cbe_dpx_0_i__PHI_TEMPORARY = ((unsigned int )-1);   /* for PHI node */
  goto llvm_cbe_cond_next215_i;

llvm_cbe_cond_false221_i:
  if ((((signed int )llvm_cbe_tmp206_i) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_cond_true226_i;
  } else {
    llvm_cbe_dpy_0_i__PHI_TEMPORARY = llvm_cbe_tmp206_i;   /* for PHI node */
    goto llvm_cbe_cond_next228_i;
  }

llvm_cbe_cond_true226_i:
  llvm_cbe_dpy_0_i__PHI_TEMPORARY = ((unsigned int )-1);   /* for PHI node */
  goto llvm_cbe_cond_next228_i;

llvm_cbe_bb549_i:
  llvm_cbe_tmp592_i_rle51 = llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY;
  llvm_cbe_tmp577_i_rle40 = llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY;
  llvm_cbe_delta1num_0_i = llvm_cbe_delta1num_0_i__PHI_TEMPORARY;
  llvm_cbe_delta2num_0_in_in_i = llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY;
  llvm_cbe_j_0_i = llvm_cbe_j_0_i__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_j_0_i) < ((signed int )((unsigned int )4)))) {
    llvm_cbe_tmp592_i_rle50__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle51;   /* for PHI node */
    llvm_cbe_tmp577_i_rle39__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle40;   /* for PHI node */
    llvm_cbe_delta1num_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_delta1num_0_i;   /* for PHI node */
    llvm_cbe_delta2num_0_in_in_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_delta2num_0_in_in_i;   /* for PHI node */
    llvm_cbe_j_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_j_0_i;   /* for PHI node */
    goto llvm_cbe_bb381_i;
  } else {
    goto llvm_cbe_bb554_i;
  }

llvm_cbe_cond_next535_i:
  llvm_cbe_tmp537_i = llvm_cbe_delta1num_0_reg2mem_0_i + ((unsigned int )-1);
  llvm_cbe_delta1num_1_i = (((((signed int )llvm_cbe_tmp537_i) < ((signed int )((unsigned int )0)))) ? (((unsigned int )7)) : (llvm_cbe_tmp537_i));
  llvm_cbe_tmp548_i = llvm_cbe_j_0_reg2mem_0_i + ((unsigned int )1);
  llvm_cbe_phitmp672_i = (llvm_cbe_delta2num_0_in_in_reg2mem_0_i + ((unsigned int )1)) & ((unsigned int )7);
  llvm_cbe_tmp592_i_rle51__PHI_TEMPORARY = llvm_cbe_tmp592_i_rle50;   /* for PHI node */
  llvm_cbe_tmp577_i_rle40__PHI_TEMPORARY = llvm_cbe_tmp577_i_rle39;   /* for PHI node */
  llvm_cbe_delta1num_0_i__PHI_TEMPORARY = llvm_cbe_delta1num_1_i;   /* for PHI node */
  llvm_cbe_delta2num_0_in_in_i__PHI_TEMPORARY = llvm_cbe_phitmp672_i;   /* for PHI node */
  llvm_cbe_j_0_i__PHI_TEMPORARY = llvm_cbe_tmp548_i;   /* for PHI node */
  goto llvm_cbe_bb549_i;

llvm_cbe_cond_next458_i:
  llvm_cbe_tmp459460671_i = ((unsigned long long )(unsigned int )llvm_cbe_delta2num_0_in_in_reg2mem_0_i);
  llvm_cbe_tmp463_i = *(&llvm_cbe_deltaar_i[((signed long long )llvm_cbe_tmp459460671_i)].field0);
  llvm_cbe_tmp466_i = (((signed int )(signed short )llvm_cbe_tmp463_i)) + llvm_cbe_tmp184_i;
  llvm_cbe_tmp471_i = *(&llvm_cbe_deltaar_i[((signed long long )llvm_cbe_tmp459460671_i)].field1);
  llvm_cbe_tmp474_i = (((signed int )(signed short )llvm_cbe_tmp471_i)) + llvm_cbe_tmp197_i;
  llvm_cbe_tmp488_i = (llvm_cbe_tmp474_i << llvm_cbe_tmp40_i) | llvm_cbe_tmp466_i;
  llvm_cbe_tmp493494_i = ((signed long long )(signed int )llvm_cbe_tmp488_i);
  llvm_cbe_tmp497_i = *(&llvm_cbe_tmp50_i6[((signed long long )llvm_cbe_tmp493494_i)].field0);
  if ((llvm_cbe_tmp497_i == llvm_cbe_tmp27_i)) {
    goto llvm_cbe_cond_true504_i;
  } else {
    goto llvm_cbe_cond_next535_i;
  }

llvm_cbe_cond_true504_i:
  llvm_cbe_tmp510_i = *(&llvm_cbe_tmp50_i6[((signed long long )llvm_cbe_tmp493494_i)].field1);
  if (((((unsigned int )(unsigned short )llvm_cbe_tmp510_i)) == llvm_cbe_i_0_reg2mem_0_i)) {
    goto llvm_cbe_cond_true516_i;
  } else {
    goto llvm_cbe_cond_next535_i;
  }

llvm_cbe_cond_true516_i:
  llvm_cbe_tmp518_i = *llvm_cbe_wayar;
  llvm_cbe_tmp519520_i = ((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i);
  *(&llvm_cbe_tmp518_i[((signed long long )llvm_cbe_tmp519520_i)].field0) = (((unsigned short )llvm_cbe_tmp466_i));
  llvm_cbe_tmp526_i = *llvm_cbe_wayar;
  *(&llvm_cbe_tmp526_i[((signed long long )llvm_cbe_tmp519520_i)].field1) = (((unsigned short )llvm_cbe_tmp474_i));
  llvm_cbe_index_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp488_i;   /* for PHI node */
  goto llvm_cbe_bb562_i;

  } while (1); /* end of syntactic loop 'bb174.i' */
llvm_cbe_bb554_i:
  llvm_cbe_tmp556_i = *llvm_cbe_wayar;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp556_i)));
  *llvm_cbe_wayar = ((struct l_struct_2E_point16t *)/*NULL*/0);
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
llvm_cbe_bb567_i:
  llvm_cbe_tmp569_i = *llvm_cbe_wayar;
  *(&llvm_cbe_tmp569_i->field0) = (((unsigned short )llvm_cbe_tmp156_i));
  *(&llvm_cbe_tmp569_i->field1) = (((unsigned short )llvm_cbe_tmp168_i));
  llvm_cbe_tmp616_i = *llvm_cbe_wayar;
  llvm_cbe_tmp618657_i = ((signed long long )(signed int )(llvm_cbe_tmp132133_i + ((unsigned int )-1)));
  *(&llvm_cbe_tmp616_i[((signed long long )llvm_cbe_tmp618657_i)].field0) = (((unsigned short )(llvm_cbe_tmp154_i & llvm_cbe_tmp93_i)));
  *(&llvm_cbe_tmp616_i[((signed long long )llvm_cbe_tmp618657_i)].field1) = (((unsigned short )(((signed int )(((signed int )llvm_cbe_tmp93_i) >> ((signed int )llvm_cbe_tmp40_i))))));
  *llvm_cbe_waylength = llvm_cbe_tmp132133_i;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )1);
}


static unsigned char _ZN6wayobj13findfreepointEiiRiS0_(unsigned int llvm_cbe_startx, unsigned int llvm_cbe_starty, unsigned int *llvm_cbe_freepointx, unsigned int *llvm_cbe_freepointy) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp24;
  unsigned int llvm_cbe_tmp34;
  unsigned short *llvm_cbe_tmp65;
  unsigned int llvm_cbe_tmp68;
  unsigned short llvm_cbe_tmp78;
  unsigned short llvm_cbe_tmp92;
  unsigned int llvm_cbe_tmp99;
  unsigned int llvm_cbe_tmp103;
  struct l_struct_2E_point16t *llvm_cbe_tmp109;
  unsigned char *ltmp_14_2;
  unsigned short llvm_cbe_tmp116_rle;
  unsigned short llvm_cbe_tmp116_rle__PHI_TEMPORARY;
  unsigned short llvm_cbe_tmp117;
  unsigned int *llvm_cbe_tmp122;
  unsigned int llvm_cbe_tmp132;
  unsigned int llvm_cbe_tmp136;
  struct l_struct_2E_point16t *llvm_cbe_tmp143;
  unsigned long long llvm_cbe_tmp150151;
  unsigned int *llvm_cbe_tmp183;
  unsigned int llvm_cbe_tmp189;
  unsigned int llvm_cbe_tmp198;
  unsigned char llvm_cbe_storemerge266;
  unsigned char llvm_cbe_storemerge266__PHI_TEMPORARY;
  unsigned int llvm_cbe_storemerge265;
  unsigned int llvm_cbe_storemerge265__PHI_TEMPORARY;
  unsigned short llvm_cbe_storemerge;
  unsigned short llvm_cbe_storemerge_in_rle1;
  unsigned short llvm_cbe_storemerge_in_rle1__PHI_TEMPORARY;
  unsigned char llvm_cbe_flodd_1_reg2mem_0;
  unsigned char llvm_cbe_flodd_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_boundl_1_reg2mem_0;
  unsigned int llvm_cbe_boundl_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  bool llvm_cbe_tmp215_b;
  unsigned int llvm_cbe_tmp223;
  unsigned int llvm_cbe_tmp229;
  bool llvm_cbe_tmp254_b;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )2);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )2));
  if (((((signed int )llvm_cbe_starty) < ((signed int )((unsigned int )1))) | (((signed int )llvm_cbe_startx) < ((signed int )((unsigned int )1))))) {
    goto llvm_cbe_cond_true49;
  } else {
    goto llvm_cbe_cond_next21;
  }

llvm_cbe_cond_next21:
  llvm_cbe_tmp24 = *(&way_2E_5);
  if ((((signed int )llvm_cbe_tmp24) < ((signed int )llvm_cbe_startx))) {
    goto llvm_cbe_cond_true49;
  } else {
    goto llvm_cbe_cond_next31;
  }

llvm_cbe_cond_next31:
  llvm_cbe_tmp34 = *(&way_2E_6);
  if ((((signed int )llvm_cbe_tmp34) < ((signed int )llvm_cbe_starty))) {
    goto llvm_cbe_cond_true49;
  } else {
    goto llvm_cbe_cond_next41;
  }

llvm_cbe_cond_next41:
  llvm_cbe_tmp65 = *(&way_2E_16);
  llvm_cbe_tmp68 = *(&way_2E_2);
  llvm_cbe_tmp78 = *(&llvm_cbe_tmp65[((signed long long )(((signed long long )(signed int )((llvm_cbe_starty << llvm_cbe_tmp68) | llvm_cbe_startx))))]);
  if ((llvm_cbe_tmp78 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true83;
  } else {
    goto llvm_cbe_cond_next89;
  }

llvm_cbe_cond_true49:
  *llvm_cbe_freepointx = llvm_cbe_startx;
  *llvm_cbe_freepointy = llvm_cbe_starty;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )1);
llvm_cbe_cond_true83:
  *llvm_cbe_freepointx = llvm_cbe_startx;
  *llvm_cbe_freepointy = llvm_cbe_starty;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )1);
llvm_cbe_cond_next89:
  llvm_cbe_tmp92 = *(&way_2E_25);
  if ((llvm_cbe_tmp92 == ((unsigned short )-1))) {
    goto llvm_cbe_cond_true96;
  } else {
    llvm_cbe_tmp116_rle__PHI_TEMPORARY = llvm_cbe_tmp92;   /* for PHI node */
    goto llvm_cbe_cond_next113;
  }

llvm_cbe_cond_true96:
  llvm_cbe_tmp99 = *(&way_2E_0);
  llvm_cbe_tmp103 = *(&way_2E_1);
  llvm_cbe_tmp109 = *(&way_2E_17);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )2);
  ltmp_14_2 = memset((((unsigned char *)llvm_cbe_tmp109)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )((((unsigned int )1) << llvm_cbe_tmp99) << llvm_cbe_tmp103))) << ((unsigned long long )2ll)));
  *(&way_2E_25) = ((unsigned short )0);
  llvm_cbe_tmp116_rle__PHI_TEMPORARY = ((unsigned short )0);   /* for PHI node */
  goto llvm_cbe_cond_next113;

llvm_cbe_cond_next113:
  llvm_cbe_tmp116_rle = llvm_cbe_tmp116_rle__PHI_TEMPORARY;
  llvm_cbe_tmp117 = ((unsigned short )(llvm_cbe_tmp116_rle + ((unsigned short )1)));
  *(&way_2E_25) = llvm_cbe_tmp117;
  llvm_cbe_tmp122 = *(&way_2E_18);
  llvm_cbe_tmp132 = *(&way_2E_2);
  llvm_cbe_tmp136 = (llvm_cbe_starty << llvm_cbe_tmp132) | llvm_cbe_startx;
  *llvm_cbe_tmp122 = llvm_cbe_tmp136;
  llvm_cbe_tmp143 = *(&way_2E_17);
  llvm_cbe_tmp150151 = ((signed long long )(signed int )llvm_cbe_tmp136);
  *(&llvm_cbe_tmp143[((signed long long )llvm_cbe_tmp150151)].field0) = llvm_cbe_tmp117;
  *(&llvm_cbe_tmp143[((signed long long )llvm_cbe_tmp150151)].field1) = ((unsigned short )0);
  *(&way_2E_22_2E_b) = ((0) & 1);
  *(&way_2E_24) = ((unsigned short )1);
  llvm_cbe_tmp183 = *(&way_2E_19);
  llvm_cbe_storemerge_in_rle1__PHI_TEMPORARY = ((unsigned short )1);   /* for PHI node */
  llvm_cbe_flodd_1_reg2mem_0__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
  llvm_cbe_boundl_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )1);   /* for PHI node */
  goto llvm_cbe_cond_next212;

  do {     /* Syntactic loop 'cond_next212' to make GCC happy */
llvm_cbe_cond_next212:
  llvm_cbe_storemerge_in_rle1 = llvm_cbe_storemerge_in_rle1__PHI_TEMPORARY;
  llvm_cbe_flodd_1_reg2mem_0 = llvm_cbe_flodd_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_boundl_1_reg2mem_0 = llvm_cbe_boundl_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )33);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )33));
  llvm_cbe_tmp215_b = *(&way_2E_22_2E_b);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if (llvm_cbe_tmp215_b) {
    goto llvm_cbe_bb220;
  } else {
    goto llvm_cbe_bb174;
  }

llvm_cbe_bb206:
  llvm_cbe_storemerge266 = llvm_cbe_storemerge266__PHI_TEMPORARY;
  llvm_cbe_storemerge265 = llvm_cbe_storemerge265__PHI_TEMPORARY;
  llvm_cbe_storemerge = ((unsigned short )(llvm_cbe_storemerge_in_rle1 + ((unsigned short )1)));
  *(&way_2E_24) = llvm_cbe_storemerge;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_storemerge265 == ((unsigned int )0))) {
    goto llvm_cbe_bb220;
  } else {
    llvm_cbe_storemerge_in_rle1__PHI_TEMPORARY = llvm_cbe_storemerge;   /* for PHI node */
    llvm_cbe_flodd_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_storemerge266;   /* for PHI node */
    llvm_cbe_boundl_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_storemerge265;   /* for PHI node */
    goto llvm_cbe_cond_next212;
  }

llvm_cbe_cond_true180:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )33);
  llvm_cbe_tmp189 =  /*tail*/ _ZN6wayobj18makeobstaclebound2EPiiS0_(llvm_cbe_tmp122, llvm_cbe_boundl_1_reg2mem_0, llvm_cbe_tmp183);
  llvm_cbe_storemerge266__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
  llvm_cbe_storemerge265__PHI_TEMPORARY = llvm_cbe_tmp189;   /* for PHI node */
  goto llvm_cbe_bb206;

llvm_cbe_bb174:
  if ((llvm_cbe_flodd_1_reg2mem_0 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true180;
  } else {
    goto llvm_cbe_cond_false;
  }

llvm_cbe_cond_false:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )33);
  llvm_cbe_tmp198 =  /*tail*/ _ZN6wayobj18makeobstaclebound2EPiiS0_(llvm_cbe_tmp183, llvm_cbe_boundl_1_reg2mem_0, llvm_cbe_tmp122);
  llvm_cbe_storemerge266__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
  llvm_cbe_storemerge265__PHI_TEMPORARY = llvm_cbe_tmp198;   /* for PHI node */
  goto llvm_cbe_bb206;

  } while (1); /* end of syntactic loop 'cond_next212' */
llvm_cbe_bb220:
  llvm_cbe_tmp223 = *(&way_2E_23);
  llvm_cbe_tmp229 = *(&way_2E_21);
  *llvm_cbe_freepointx = (llvm_cbe_tmp229 & llvm_cbe_tmp223);
  *llvm_cbe_freepointy = (((signed int )(((signed int )llvm_cbe_tmp223) >> ((signed int )llvm_cbe_tmp132))));
  llvm_cbe_tmp254_b = *(&way_2E_22_2E_b);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return (((unsigned char )(bool )llvm_cbe_tmp254_b));
}


static void _ZN11regboundobj10addtoboundER9flexarrayI6pointtEii(struct l_struct_2E_regboundobj *llvm_cbe_this, struct l_struct_2E_boundart *llvm_cbe_barp, unsigned int llvm_cbe_x, unsigned int llvm_cbe_y) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp9;
  unsigned char *llvm_cbe_tmp19;
  unsigned int *llvm_cbe_tmp21;
  unsigned int llvm_cbe_tmp22;
  unsigned long long llvm_cbe_tmp2627;
  unsigned char llvm_cbe_tmp29;
  unsigned char llvm_cbe_tmp38;
  unsigned int llvm_cbe_tmp42;
  unsigned int llvm_cbe_tmp44;
  unsigned int llvm_cbe_tmp54;
  unsigned int llvm_cbe_tmp56;
  unsigned int llvm_cbe_tmp77;
  unsigned int *llvm_cbe_tmp94;
  unsigned int llvm_cbe_tmp95;
  unsigned int *llvm_cbe_tmp97;
  unsigned int llvm_cbe_tmp98;
  unsigned int llvm_cbe_tmp109;
  unsigned char *ltmp_15_2;
  struct l_struct_2E_pointt *ltmp_16_5;
  struct l_struct_2E_pointt **llvm_cbe_tmp131;
  struct l_struct_2E_pointt *llvm_cbe_tmp132;
  unsigned char *ltmp_17_2;
  struct l_struct_2E_pointt *llvm_cbe_tmp138;
  struct l_struct_2E_pointt *llvm_cbe_tmp150;
  unsigned int llvm_cbe_tmp153;
  unsigned long long llvm_cbe_tmp153161;
  unsigned int llvm_cbe_tmp171;
  struct l_struct_2E_regobj **llvm_cbe_tmp176;
  struct l_struct_2E_regobj *llvm_cbe_tmp177;
  struct l_struct_2E_regobj **llvm_cbe_tmp187;
  unsigned int llvm_cbe_tmp190;
  struct l_struct_2E_regobj *llvm_cbe_tmp202;
  unsigned int *llvm_cbe_tmp203;
  unsigned int llvm_cbe_tmp204;
  struct l_struct_2E_regobj **llvm_cbe_tmp217;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )3);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )3));
  llvm_cbe_tmp9 = *(&llvm_cbe_this->field15);
  llvm_cbe_tmp19 = *(&llvm_cbe_this->field10);
  llvm_cbe_tmp21 = &llvm_cbe_this->field11;
  llvm_cbe_tmp22 = *llvm_cbe_tmp21;
  llvm_cbe_tmp2627 = ((signed long long )(signed int )((llvm_cbe_tmp22 * llvm_cbe_y) + llvm_cbe_x));
  llvm_cbe_tmp29 = *(&llvm_cbe_tmp19[((signed long long )llvm_cbe_tmp2627)]);
  llvm_cbe_tmp38 = *(&llvm_cbe_tmp9->field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp29)))]);
  if ((llvm_cbe_tmp38 == ((unsigned char )0))) {
    goto llvm_cbe_cond_false;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_cond_true:
  llvm_cbe_tmp42 = *(&llvm_cbe_this->field5);
  llvm_cbe_tmp44 = llvm_cbe_x - llvm_cbe_tmp42;
  llvm_cbe_tmp54 = *(&llvm_cbe_this->field6);
  llvm_cbe_tmp56 = llvm_cbe_y - llvm_cbe_tmp54;
  llvm_cbe_tmp77 = *(&llvm_cbe_this->field8);
  if ((((signed int )(((signed int )(((float )((((float )(signed int )((llvm_cbe_tmp56 * llvm_cbe_tmp56) + (llvm_cbe_tmp44 * llvm_cbe_tmp44)))) + 0x1p-1)))))) > ((signed int )llvm_cbe_tmp77))) {
    goto llvm_cbe_UnifiedReturnBlock;
  } else {
    goto llvm_cbe_cond_true83;
  }

llvm_cbe_cond_true83:
  llvm_cbe_tmp94 = &llvm_cbe_barp->field1;
  llvm_cbe_tmp95 = *llvm_cbe_tmp94;
  llvm_cbe_tmp97 = &llvm_cbe_barp->field2;
  llvm_cbe_tmp98 = *llvm_cbe_tmp97;
  if ((llvm_cbe_tmp95 == llvm_cbe_tmp98)) {
    goto llvm_cbe_cond_true102;
  } else {
    goto llvm_cbe_cond_next147;
  }

llvm_cbe_cond_true102:
  llvm_cbe_tmp109 = llvm_cbe_tmp98 << ((unsigned int )1);
  ltmp_15_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp109)) * ((unsigned long long )8ll)));
  ltmp_16_5 = ((struct l_struct_2E_pointt *)ltmp_15_2);
  llvm_cbe_tmp131 = &llvm_cbe_barp->field0;
  llvm_cbe_tmp132 = *llvm_cbe_tmp131;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )3);
  ltmp_17_2 = memcpy((((unsigned char *)ltmp_16_5)), (((unsigned char *)llvm_cbe_tmp132)), ((((signed long long )(signed int )llvm_cbe_tmp98)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp138 = *llvm_cbe_tmp131;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp138)));
  *llvm_cbe_tmp131 = ltmp_16_5;
  *llvm_cbe_tmp97 = llvm_cbe_tmp109;
  goto llvm_cbe_cond_next147;

llvm_cbe_cond_next147:
  llvm_cbe_tmp150 = *(&llvm_cbe_barp->field0);
  llvm_cbe_tmp153 = *llvm_cbe_tmp94;
  llvm_cbe_tmp153161 = ((signed long long )(signed int )llvm_cbe_tmp153);
  *(&llvm_cbe_tmp150[((signed long long )llvm_cbe_tmp153161)].field0) = llvm_cbe_x;
  *(&llvm_cbe_tmp150[((signed long long )llvm_cbe_tmp153161)].field1) = llvm_cbe_y;
  llvm_cbe_tmp171 = *llvm_cbe_tmp94;
  *llvm_cbe_tmp94 = (llvm_cbe_tmp171 + ((unsigned int )1));
  llvm_cbe_tmp176 = &llvm_cbe_this->field4;
  llvm_cbe_tmp177 = *llvm_cbe_tmp176;
  llvm_cbe_tmp187 = *(&llvm_cbe_this->field9);
  llvm_cbe_tmp190 = *llvm_cbe_tmp21;
  *(&llvm_cbe_tmp187[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp190 * llvm_cbe_y) + llvm_cbe_x))))]) = llvm_cbe_tmp177;
  llvm_cbe_tmp202 = *llvm_cbe_tmp176;
  llvm_cbe_tmp203 = &llvm_cbe_tmp202->field4;
  llvm_cbe_tmp204 = *llvm_cbe_tmp203;
  *llvm_cbe_tmp203 = (llvm_cbe_tmp204 + ((unsigned int )1));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
llvm_cbe_cond_false:
  llvm_cbe_tmp217 = *(&llvm_cbe_this->field9);
  *(&llvm_cbe_tmp217[((signed long long )llvm_cbe_tmp2627)]) = ((struct l_struct_2E_regobj *)/*NULL*/0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
llvm_cbe_UnifiedReturnBlock:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_(struct l_struct_2E_regboundobj *llvm_cbe_this, struct l_struct_2E_boundart *llvm_cbe_b1arp, struct l_struct_2E_boundart *llvm_cbe_b2arp) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int *llvm_cbe_tmp168180;
  unsigned int llvm_cbe_tmp169181;
  struct l_struct_2E_pointt **llvm_cbe_tmp14;
  unsigned int *llvm_cbe_tmp86;
  unsigned int *llvm_cbe_tmp98;
  struct l_struct_2E_regobj ***llvm_cbe_tmp121;
  unsigned int *llvm_cbe_tmp124;
  unsigned int llvm_cbe_j_0_reg2mem_0;
  unsigned int llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_pointt *llvm_cbe_tmp15;
  unsigned long long llvm_cbe_tmp1617;
  unsigned int llvm_cbe_tmp23;
  unsigned int llvm_cbe_tmp24;
  unsigned int llvm_cbe_tmp40;
  unsigned int llvm_cbe_tmp41;
  unsigned int llvm_cbe_tmp58;
  unsigned int llvm_cbe_tmp75;
  unsigned int llvm_cbe_x1_0;
  unsigned int llvm_cbe_y1_0;
  unsigned int llvm_cbe_tmp87;
  unsigned int llvm_cbe_x2_0;
  unsigned int llvm_cbe_tmp99;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_x_0191;
  struct l_struct_2E_regobj **llvm_cbe_tmp122;
  unsigned int llvm_cbe_tmp125;
  struct l_struct_2E_regobj *llvm_cbe_tmp135;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_tmp156;
  unsigned int llvm_cbe_y2_0;
  unsigned int llvm_cbe_y2_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0;
  unsigned int llvm_cbe_y_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp165;
  unsigned int llvm_cbe_tmp169;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )4);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )4));
  *(&llvm_cbe_b2arp->field1) = ((unsigned int )0);
  llvm_cbe_tmp168180 = &llvm_cbe_b1arp->field1;
  llvm_cbe_tmp169181 = *llvm_cbe_tmp168180;
  if ((((signed int )llvm_cbe_tmp169181) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_preheader;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp14 = &llvm_cbe_b1arp->field0;
  llvm_cbe_tmp86 = &llvm_cbe_this->field13;
  llvm_cbe_tmp98 = &llvm_cbe_this->field14;
  llvm_cbe_tmp121 = &llvm_cbe_this->field9;
  llvm_cbe_tmp124 = &llvm_cbe_this->field11;
  llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_j_0_reg2mem_0 = llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )34);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )34));
  llvm_cbe_tmp15 = *llvm_cbe_tmp14;
  llvm_cbe_tmp1617 = ((signed long long )(signed int )llvm_cbe_j_0_reg2mem_0);
  llvm_cbe_tmp23 = *(&llvm_cbe_tmp15[((signed long long )llvm_cbe_tmp1617)].field0);
  llvm_cbe_tmp24 = llvm_cbe_tmp23 + ((unsigned int )-1);
  llvm_cbe_tmp40 = *(&llvm_cbe_tmp15[((signed long long )llvm_cbe_tmp1617)].field1);
  llvm_cbe_tmp41 = llvm_cbe_tmp40 + ((unsigned int )-1);
  llvm_cbe_tmp58 = llvm_cbe_tmp23 + ((unsigned int )1);
  llvm_cbe_tmp75 = llvm_cbe_tmp40 + ((unsigned int )1);
  llvm_cbe_x1_0 = (((((signed int )llvm_cbe_tmp24) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp24));
  llvm_cbe_y1_0 = (((((signed int )llvm_cbe_tmp41) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp41));
  llvm_cbe_tmp87 = *llvm_cbe_tmp86;
  llvm_cbe_x2_0 = (((((signed int )llvm_cbe_tmp87) < ((signed int )llvm_cbe_tmp58))) ? (llvm_cbe_tmp87) : (llvm_cbe_tmp58));
  llvm_cbe_tmp99 = *llvm_cbe_tmp98;
  if ((((signed int )llvm_cbe_tmp99) < ((signed int )llvm_cbe_tmp75))) {
    goto llvm_cbe_cond_true104;
  } else {
    llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_tmp75;   /* for PHI node */
    llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb157;
  }

llvm_cbe_bb166:
  llvm_cbe_tmp165 = llvm_cbe_j_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp169 = *llvm_cbe_tmp168180;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp169) > ((signed int )llvm_cbe_tmp165))) {
    llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp165;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_cond_true104:
  if ((((signed int )llvm_cbe_y1_0) > ((signed int )llvm_cbe_tmp99))) {
    goto llvm_cbe_bb166;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp99;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb148_preheader;
  }

llvm_cbe_bb157:
  llvm_cbe_y2_0 = llvm_cbe_y2_0__PHI_TEMPORARY;
  llvm_cbe_y_0 = llvm_cbe_y_0__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_y_0) > ((signed int )llvm_cbe_y2_0))) {
    goto llvm_cbe_bb166;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y2_0;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y_0;   /* for PHI node */
    goto llvm_cbe_bb148_preheader;
  }

llvm_cbe_bb154:
  llvm_cbe_tmp156 = llvm_cbe_y_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_y2_0_reg2mem_0_ph;   /* for PHI node */
  llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_tmp156;   /* for PHI node */
  goto llvm_cbe_bb157;

llvm_cbe_bb148_preheader:
  llvm_cbe_y2_0_reg2mem_0_ph = llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_y_0_reg2mem_0_ph = llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_x1_0) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb154;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb112;
  }

  do {     /* Syntactic loop 'bb112' to make GCC happy */
llvm_cbe_bb112:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )35);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )35));
  llvm_cbe_x_0191 = llvm_cbe_indvar + llvm_cbe_x1_0;
  llvm_cbe_tmp122 = *llvm_cbe_tmp121;
  llvm_cbe_tmp125 = *llvm_cbe_tmp124;
  llvm_cbe_tmp135 = *(&llvm_cbe_tmp122[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp125 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0191))))]);
  if ((llvm_cbe_tmp135 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true140;
  } else {
    goto llvm_cbe_cond_next145;
  }

llvm_cbe_cond_next145:
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )(llvm_cbe_x_0191 + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb154;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb112;
  }

llvm_cbe_cond_true140:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )35);
   /*tail*/ _ZN11regboundobj10addtoboundER9flexarrayI6pointtEii(llvm_cbe_this, llvm_cbe_b2arp, llvm_cbe_x_0191, llvm_cbe_y_0_reg2mem_0_ph);
  goto llvm_cbe_cond_next145;

  } while (1); /* end of syntactic loop 'bb112' */
  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static unsigned char _ZN11regboundobj4stepEv(struct l_struct_2E_regboundobj *llvm_cbe_this) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int *llvm_cbe_tmp2;
  unsigned int llvm_cbe_tmp3;
  unsigned char llvm_cbe_tmp8;
  unsigned char *llvm_cbe_tmp16;
  unsigned char llvm_cbe_tmp17;
  unsigned int llvm_cbe_tmp31;
  unsigned int llvm_cbe_tmp44;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )5);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )5));
  llvm_cbe_tmp2 = &llvm_cbe_this->field3;
  llvm_cbe_tmp3 = *llvm_cbe_tmp2;
  if ((llvm_cbe_tmp3 == ((unsigned int )0))) {
    goto llvm_cbe_UnifiedReturnBlock;
  } else {
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_next:
  llvm_cbe_tmp8 = *(&llvm_cbe_this->field16);
  if ((llvm_cbe_tmp8 == ((unsigned char )0))) {
    goto llvm_cbe_UnifiedReturnBlock;
  } else {
    goto llvm_cbe_bb14;
  }

llvm_cbe_bb14:
  llvm_cbe_tmp16 = &llvm_cbe_this->field2;
  llvm_cbe_tmp17 = *llvm_cbe_tmp16;
  if ((llvm_cbe_tmp17 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true22;
  } else {
    goto llvm_cbe_cond_false;
  }

llvm_cbe_cond_true22:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )5);
   /*tail*/ _ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_(llvm_cbe_this, (&llvm_cbe_this->field0), (&llvm_cbe_this->field1));
  llvm_cbe_tmp31 = *(&llvm_cbe_this->field1.field1);
  *llvm_cbe_tmp2 = llvm_cbe_tmp31;
  *llvm_cbe_tmp16 = ((unsigned char )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return (((unsigned char )(bool )(llvm_cbe_tmp31 != ((unsigned int )0))));
llvm_cbe_cond_false:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )5);
   /*tail*/ _ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_(llvm_cbe_this, (&llvm_cbe_this->field1), (&llvm_cbe_this->field0));
  llvm_cbe_tmp44 = *(&llvm_cbe_this->field0.field1);
  *llvm_cbe_tmp2 = llvm_cbe_tmp44;
  *llvm_cbe_tmp16 = ((unsigned char )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return (((unsigned char )(bool )(llvm_cbe_tmp44 != ((unsigned int )0))));
llvm_cbe_UnifiedReturnBlock:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
}


static void _ZN11regboundobj9firststepEiiP6regobjP9regmngobj(struct l_struct_2E_regboundobj *llvm_cbe_this, unsigned int llvm_cbe_x0, unsigned int llvm_cbe_y0, struct l_struct_2E_regobj *llvm_cbe_regionpin) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  struct l_struct_2E_regmngobj **llvm_cbe_tmp11;
  struct l_struct_2E_regobj **llvm_cbe_tmp17;
  struct l_struct_2E_regobj ***llvm_cbe_tmp19;
  unsigned char *llvm_cbe_tmp24;
  unsigned int llvm_cbe_tmp31;
  unsigned int *llvm_cbe_tmp33;
  unsigned int llvm_cbe_tmp38;
  unsigned int llvm_cbe_tmp45;
  unsigned int *llvm_cbe_tmp47;
  unsigned int llvm_cbe_tmp52;
  unsigned int *llvm_cbe_tmp54;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp57;
  unsigned int llvm_cbe_tmp59;
  unsigned char llvm_cbe_tmp73;
  unsigned int *llvm_cbe_tmp91;
  unsigned char *ltmp_18_2;
  unsigned char *ltmp_19_2;
  unsigned int llvm_cbe_tmp136;
  unsigned int llvm_cbe_tmp138;
  unsigned int llvm_cbe_tmp140;
  unsigned int llvm_cbe_tmp142;
  unsigned int llvm_cbe_x1_0;
  unsigned int llvm_cbe_y1_0;
  unsigned int llvm_cbe_tmp157;
  unsigned int llvm_cbe_x2_0;
  unsigned int llvm_cbe_tmp169;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  struct l_struct_2E_boundart *llvm_cbe_tmp212;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_x_0253;
  struct l_struct_2E_regobj **llvm_cbe_tmp192;
  unsigned int llvm_cbe_tmp195;
  struct l_struct_2E_regobj *llvm_cbe_tmp205;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_tmp227;
  unsigned int llvm_cbe_y2_0;
  unsigned int llvm_cbe_y2_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0;
  unsigned int llvm_cbe_y_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp240;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )6);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )6));
  *(&llvm_cbe_this->field5) = llvm_cbe_x0;
  *(&llvm_cbe_this->field6) = llvm_cbe_y0;
  *(&llvm_cbe_this->field4) = llvm_cbe_regionpin;
  llvm_cbe_tmp11 = &llvm_cbe_this->field15;
  *llvm_cbe_tmp11 = (&regmng);
  llvm_cbe_tmp17 = *(&(regmng.field6));
  llvm_cbe_tmp19 = &llvm_cbe_this->field9;
  *llvm_cbe_tmp19 = llvm_cbe_tmp17;
  llvm_cbe_tmp24 = *(&(regmng.field7));
  *(&llvm_cbe_this->field10) = llvm_cbe_tmp24;
  llvm_cbe_tmp31 = *(&(regmng.field16));
  llvm_cbe_tmp33 = &llvm_cbe_this->field11;
  *llvm_cbe_tmp33 = llvm_cbe_tmp31;
  llvm_cbe_tmp38 = *(&(regmng.field17));
  *(&llvm_cbe_this->field12) = llvm_cbe_tmp38;
  llvm_cbe_tmp45 = *(&(regmng.field12));
  llvm_cbe_tmp47 = &llvm_cbe_this->field13;
  *llvm_cbe_tmp47 = llvm_cbe_tmp45;
  llvm_cbe_tmp52 = *(&(regmng.field13));
  llvm_cbe_tmp54 = &llvm_cbe_this->field14;
  *llvm_cbe_tmp54 = llvm_cbe_tmp52;
  llvm_cbe_tmp57 = *llvm_cbe_tmp11;
  llvm_cbe_tmp59 = *(&llvm_cbe_tmp57->field9);
  *(&llvm_cbe_this->field7) = llvm_cbe_tmp59;
  *(&llvm_cbe_this->field8) = (llvm_cbe_tmp59 * llvm_cbe_tmp59);
  llvm_cbe_tmp73 = *(&llvm_cbe_this->field16);
  if ((llvm_cbe_tmp73 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true;
  } else {
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_true:
  *(&llvm_cbe_this->field3) = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
llvm_cbe_cond_next:
  *(&llvm_cbe_regionpin->field4) = ((unsigned int )0);
  *(&llvm_cbe_this->field0.field2) = ((unsigned int )128);
  llvm_cbe_tmp91 = &llvm_cbe_this->field0.field1;
  *llvm_cbe_tmp91 = ((unsigned int )0);
  ltmp_18_2 =  /*tail*/ malloc(((unsigned long long )1024ll));
  *(&llvm_cbe_this->field0.field0) = (&(((struct l_struct_2E_pointt (*)[128])ltmp_18_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  *(&llvm_cbe_this->field1.field2) = ((unsigned int )128);
  *(&llvm_cbe_this->field1.field1) = ((unsigned int )0);
  ltmp_19_2 =  /*tail*/ malloc(((unsigned long long )1024ll));
  *(&llvm_cbe_this->field1.field0) = (&(((struct l_struct_2E_pointt (*)[128])ltmp_19_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  llvm_cbe_tmp136 = llvm_cbe_x0 + ((unsigned int )-1);
  llvm_cbe_tmp138 = llvm_cbe_y0 + ((unsigned int )-1);
  llvm_cbe_tmp140 = llvm_cbe_x0 + ((unsigned int )1);
  llvm_cbe_tmp142 = llvm_cbe_y0 + ((unsigned int )1);
  llvm_cbe_x1_0 = (((((signed int )llvm_cbe_tmp136) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp136));
  llvm_cbe_y1_0 = (((((signed int )llvm_cbe_tmp138) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp138));
  llvm_cbe_tmp157 = *llvm_cbe_tmp47;
  llvm_cbe_x2_0 = (((((signed int )llvm_cbe_tmp157) < ((signed int )llvm_cbe_tmp140))) ? (llvm_cbe_tmp157) : (llvm_cbe_tmp140));
  llvm_cbe_tmp169 = *llvm_cbe_tmp54;
  if ((((signed int )llvm_cbe_tmp169) < ((signed int )llvm_cbe_tmp142))) {
    goto llvm_cbe_cond_true174;
  } else {
    llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_tmp142;   /* for PHI node */
    llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb228;
  }

llvm_cbe_cond_true174:
  if ((((signed int )llvm_cbe_y1_0) > ((signed int )llvm_cbe_tmp169))) {
    goto llvm_cbe_bb234;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp169;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb219_preheader;
  }

llvm_cbe_bb219_preheader:
  llvm_cbe_y2_0_reg2mem_0_ph = llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_y_0_reg2mem_0_ph = llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_x1_0) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb225;
  } else {
    goto llvm_cbe_bb_nph;
  }

llvm_cbe_bb_nph:
  llvm_cbe_tmp212 = &llvm_cbe_this->field0;
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb182;

  do {     /* Syntactic loop 'bb182' to make GCC happy */
llvm_cbe_bb182:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )36);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )36));
  llvm_cbe_x_0253 = llvm_cbe_indvar + llvm_cbe_x1_0;
  llvm_cbe_tmp192 = *llvm_cbe_tmp19;
  llvm_cbe_tmp195 = *llvm_cbe_tmp33;
  llvm_cbe_tmp205 = *(&llvm_cbe_tmp192[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp195 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0253))))]);
  if ((llvm_cbe_tmp205 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true210;
  } else {
    goto llvm_cbe_cond_next216;
  }

llvm_cbe_cond_next216:
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )(llvm_cbe_x_0253 + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb225;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb182;
  }

llvm_cbe_cond_true210:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )36);
   /*tail*/ _ZN11regboundobj10addtoboundER9flexarrayI6pointtEii(llvm_cbe_this, llvm_cbe_tmp212, llvm_cbe_x_0253, llvm_cbe_y_0_reg2mem_0_ph);
  goto llvm_cbe_cond_next216;

  } while (1); /* end of syntactic loop 'bb182' */
llvm_cbe_bb225:
  llvm_cbe_tmp227 = llvm_cbe_y_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_y2_0_reg2mem_0_ph;   /* for PHI node */
  llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_tmp227;   /* for PHI node */
  goto llvm_cbe_bb228;

llvm_cbe_bb228:
  llvm_cbe_y2_0 = llvm_cbe_y2_0__PHI_TEMPORARY;
  llvm_cbe_y_0 = llvm_cbe_y_0__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_y_0) > ((signed int )llvm_cbe_y2_0))) {
    goto llvm_cbe_bb234;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y2_0;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y_0;   /* for PHI node */
    goto llvm_cbe_bb219_preheader;
  }

llvm_cbe_bb234:
  *(&llvm_cbe_this->field2) = ((unsigned char )0);
  llvm_cbe_tmp240 = *llvm_cbe_tmp91;
  *(&llvm_cbe_this->field3) = llvm_cbe_tmp240;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_(struct l_struct_2E_boundart *llvm_cbe_b1arp, struct l_struct_2E_boundart *llvm_cbe_b2arp) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int *llvm_cbe_tmp8;
  unsigned int *llvm_cbe_tmp330343;
  unsigned int llvm_cbe_tmp331344;
  struct l_struct_2E_pointt **llvm_cbe_tmp14;
  unsigned int *llvm_cbe_tmp211;
  struct l_struct_2E_pointt **llvm_cbe_tmp245;
  unsigned int llvm_cbe_j_0_reg2mem_0;
  unsigned int llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_pointt *llvm_cbe_tmp15;
  unsigned long long llvm_cbe_tmp1617;
  unsigned int llvm_cbe_tmp23;
  unsigned int llvm_cbe_tmp24;
  unsigned int llvm_cbe_tmp40;
  unsigned int llvm_cbe_tmp41;
  unsigned int llvm_cbe_tmp58;
  unsigned int llvm_cbe_tmp75;
  unsigned int llvm_cbe_x1_0;
  unsigned int llvm_cbe_y1_0;
  unsigned int llvm_cbe_tmp87;
  unsigned int llvm_cbe_x2_0;
  unsigned int llvm_cbe_tmp99;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0;
  unsigned short *llvm_cbe_tmp115;
  unsigned int llvm_cbe_tmp118;
  unsigned long long llvm_cbe_tmp122123;
  unsigned short llvm_cbe_tmp125;
  unsigned short llvm_cbe_tmp128;
  unsigned char *llvm_cbe_tmp150;
  unsigned char llvm_cbe_tmp160;
  unsigned char llvm_cbe_tmp171;
  unsigned char llvm_cbe_tmp177;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_tmp209;
  unsigned int llvm_cbe_tmp212;
  unsigned int llvm_cbe_tmp223;
  unsigned char *ltmp_20_2;
  struct l_struct_2E_pointt *ltmp_21_5;
  struct l_struct_2E_pointt *llvm_cbe_tmp246;
  unsigned char *ltmp_22_2;
  struct l_struct_2E_pointt *llvm_cbe_tmp253;
  struct l_struct_2E_pointt *llvm_cbe_tmp265;
  unsigned int llvm_cbe_tmp268;
  unsigned long long llvm_cbe_tmp268276;
  unsigned int llvm_cbe_tmp286;
  unsigned short *llvm_cbe_tmp293;
  unsigned int llvm_cbe_tmp296;
  unsigned short llvm_cbe_tmp303;
  unsigned int llvm_cbe_tmp309;
  unsigned int llvm_cbe_x_0;
  unsigned int llvm_cbe_x_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_tmp318;
  unsigned int llvm_cbe_y2_0;
  unsigned int llvm_cbe_y2_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0;
  unsigned int llvm_cbe_y_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp327;
  unsigned int llvm_cbe_tmp331;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )7);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )7));
  llvm_cbe_tmp8 = &llvm_cbe_b2arp->field1;
  *llvm_cbe_tmp8 = ((unsigned int )0);
  llvm_cbe_tmp330343 = &llvm_cbe_b1arp->field1;
  llvm_cbe_tmp331344 = *llvm_cbe_tmp330343;
  if ((((signed int )llvm_cbe_tmp331344) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_preheader;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp14 = &llvm_cbe_b1arp->field0;
  llvm_cbe_tmp211 = &llvm_cbe_b2arp->field2;
  llvm_cbe_tmp245 = &llvm_cbe_b2arp->field0;
  llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_j_0_reg2mem_0 = llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )37);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )37));
  llvm_cbe_tmp15 = *llvm_cbe_tmp14;
  llvm_cbe_tmp1617 = ((signed long long )(signed int )llvm_cbe_j_0_reg2mem_0);
  llvm_cbe_tmp23 = *(&llvm_cbe_tmp15[((signed long long )llvm_cbe_tmp1617)].field0);
  llvm_cbe_tmp24 = llvm_cbe_tmp23 + ((unsigned int )-1);
  llvm_cbe_tmp40 = *(&llvm_cbe_tmp15[((signed long long )llvm_cbe_tmp1617)].field1);
  llvm_cbe_tmp41 = llvm_cbe_tmp40 + ((unsigned int )-1);
  llvm_cbe_tmp58 = llvm_cbe_tmp23 + ((unsigned int )1);
  llvm_cbe_tmp75 = llvm_cbe_tmp40 + ((unsigned int )1);
  llvm_cbe_x1_0 = (((((signed int )llvm_cbe_tmp24) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp24));
  llvm_cbe_y1_0 = (((((signed int )llvm_cbe_tmp41) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp41));
  llvm_cbe_tmp87 = *(&(regmng.field12));
  llvm_cbe_x2_0 = (((((signed int )llvm_cbe_tmp87) < ((signed int )llvm_cbe_tmp58))) ? (llvm_cbe_tmp87) : (llvm_cbe_tmp58));
  llvm_cbe_tmp99 = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp99) < ((signed int )llvm_cbe_tmp75))) {
    goto llvm_cbe_cond_true104;
  } else {
    llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_tmp75;   /* for PHI node */
    llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb319;
  }

llvm_cbe_bb328:
  llvm_cbe_tmp327 = llvm_cbe_j_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp331 = *llvm_cbe_tmp330343;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp331) > ((signed int )llvm_cbe_tmp327))) {
    llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp327;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_cond_true104:
  if ((((signed int )llvm_cbe_y1_0) > ((signed int )llvm_cbe_tmp99))) {
    goto llvm_cbe_bb328;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp99;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb310_preheader;
  }

llvm_cbe_bb319:
  llvm_cbe_y2_0 = llvm_cbe_y2_0__PHI_TEMPORARY;
  llvm_cbe_y_0 = llvm_cbe_y_0__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_y_0) > ((signed int )llvm_cbe_y2_0))) {
    goto llvm_cbe_bb328;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y2_0;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y_0;   /* for PHI node */
    goto llvm_cbe_bb310_preheader;
  }

llvm_cbe_bb316:
  llvm_cbe_tmp318 = llvm_cbe_y_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_y2_0_reg2mem_0_ph;   /* for PHI node */
  llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_tmp318;   /* for PHI node */
  goto llvm_cbe_bb319;

  do {     /* Syntactic loop 'bb310' to make GCC happy */
llvm_cbe_bb310:
  llvm_cbe_x_0 = llvm_cbe_x_0__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )38);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )38));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_x_0) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb316;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb112;
  }

llvm_cbe_cond_next307:
  llvm_cbe_tmp309 = llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_x_0__PHI_TEMPORARY = llvm_cbe_tmp309;   /* for PHI node */
  goto llvm_cbe_bb310;

  do {     /* Syntactic loop 'bb112' to make GCC happy */
llvm_cbe_bb112:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )39);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )39));
  llvm_cbe_x_0_reg2mem_0 = llvm_cbe_indvar + llvm_cbe_x_0;
  llvm_cbe_tmp115 = *(&(regmng.field0));
  llvm_cbe_tmp118 = *(&(regmng.field16));
  llvm_cbe_tmp122123 = ((signed long long )(signed int )((llvm_cbe_tmp118 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0_reg2mem_0));
  llvm_cbe_tmp125 = *(&llvm_cbe_tmp115[((signed long long )llvm_cbe_tmp122123)]);
  llvm_cbe_tmp128 = *(&(regmng.field1));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_tmp125 == llvm_cbe_tmp128)) {
    goto llvm_cbe_cond_next307;
  } else {
    goto llvm_cbe_cond_true132;
  }

llvm_cbe_cond_true182:
  *(&(regmng.field2)) = llvm_cbe_x_0_reg2mem_0;
  *(&(regmng.field3)) = llvm_cbe_y_0_reg2mem_0_ph;
  *(&(regmng.field4)) = ((unsigned char )1);
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )(llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb316;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb112;
  }

llvm_cbe_cond_true174:
  llvm_cbe_tmp177 = *(&(regmng.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_tmp177 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true182;
  } else {
    goto llvm_cbe_cond_next192;
  }

llvm_cbe_cond_true132:
  llvm_cbe_tmp150 = *(&(regmng.field7));
  llvm_cbe_tmp160 = *(&llvm_cbe_tmp150[((signed long long )llvm_cbe_tmp122123)]);
  llvm_cbe_tmp171 = *(&regmng.field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp160)))]);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_tmp171 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true197;
  } else {
    goto llvm_cbe_cond_true174;
  }

  } while (1); /* end of syntactic loop 'bb112' */
llvm_cbe_cond_next290:
  llvm_cbe_tmp293 = *(&(regmng.field0));
  llvm_cbe_tmp296 = *(&(regmng.field16));
  llvm_cbe_tmp303 = *(&(regmng.field1));
  *(&llvm_cbe_tmp293[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp296 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0_reg2mem_0))))]) = llvm_cbe_tmp303;
  goto llvm_cbe_cond_next307;

llvm_cbe_cond_next192:
  if ((llvm_cbe_tmp171 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true197;
  } else {
    goto llvm_cbe_cond_next290;
  }

llvm_cbe_cond_next262:
  llvm_cbe_tmp265 = *llvm_cbe_tmp245;
  llvm_cbe_tmp268 = *llvm_cbe_tmp8;
  llvm_cbe_tmp268276 = ((signed long long )(signed int )llvm_cbe_tmp268);
  *(&llvm_cbe_tmp265[((signed long long )llvm_cbe_tmp268276)].field0) = llvm_cbe_x_0_reg2mem_0;
  *(&llvm_cbe_tmp265[((signed long long )llvm_cbe_tmp268276)].field1) = llvm_cbe_y_0_reg2mem_0_ph;
  llvm_cbe_tmp286 = *llvm_cbe_tmp8;
  *llvm_cbe_tmp8 = (llvm_cbe_tmp286 + ((unsigned int )1));
  goto llvm_cbe_cond_next290;

llvm_cbe_cond_true197:
  llvm_cbe_tmp209 = *llvm_cbe_tmp8;
  llvm_cbe_tmp212 = *llvm_cbe_tmp211;
  if ((llvm_cbe_tmp209 == llvm_cbe_tmp212)) {
    goto llvm_cbe_cond_true216;
  } else {
    goto llvm_cbe_cond_next262;
  }

llvm_cbe_cond_true216:
  llvm_cbe_tmp223 = llvm_cbe_tmp212 << ((unsigned int )1);
  ltmp_20_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp223)) * ((unsigned long long )8ll)));
  ltmp_21_5 = ((struct l_struct_2E_pointt *)ltmp_20_2);
  llvm_cbe_tmp246 = *llvm_cbe_tmp245;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )38);
  ltmp_22_2 = memcpy((((unsigned char *)ltmp_21_5)), (((unsigned char *)llvm_cbe_tmp246)), ((((signed long long )(signed int )llvm_cbe_tmp212)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp253 = *llvm_cbe_tmp245;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp253)));
  *llvm_cbe_tmp245 = ltmp_21_5;
  *llvm_cbe_tmp211 = llvm_cbe_tmp223;
  goto llvm_cbe_cond_next262;

  } while (1); /* end of syntactic loop 'bb310' */
llvm_cbe_bb310_preheader:
  llvm_cbe_y2_0_reg2mem_0_ph = llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_y_0_reg2mem_0_ph = llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_x_0__PHI_TEMPORARY = llvm_cbe_x1_0;   /* for PHI node */
  goto llvm_cbe_bb310;

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static unsigned char _ZN9regmngobj13findfreeplaceEiiRiS0_(unsigned int llvm_cbe_x0, unsigned int llvm_cbe_y0, unsigned int *llvm_cbe_xpl, unsigned int *llvm_cbe_ypl) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  struct l_struct_2E_boundart llvm_cbe_bound1arp;    /* Address-exposed local */
  struct l_struct_2E_boundart llvm_cbe_bound2arp;    /* Address-exposed local */
  unsigned short llvm_cbe_tmp7;
  unsigned short llvm_cbe_tmp8;
  unsigned int llvm_cbe_tmp18;
  unsigned int llvm_cbe_tmp21;
  unsigned short *llvm_cbe_tmp27;
  unsigned char *ltmp_23_2;
  unsigned int *llvm_cbe_tmp38;
  unsigned int *llvm_cbe_tmp40;
  unsigned char *ltmp_24_2;
  struct l_struct_2E_pointt (*ltmp_25_6)[128];
  struct l_struct_2E_pointt **llvm_cbe_tmp53;
  unsigned int *llvm_cbe_tmp58;
  unsigned char *ltmp_26_2;
  struct l_struct_2E_pointt **llvm_cbe_tmp74;
  unsigned int llvm_cbe_tmp89;
  unsigned int llvm_cbe_tmp97;
  unsigned short *llvm_cbe_tmp105;
  unsigned int llvm_cbe_tmp108;
  unsigned long long llvm_cbe_tmp112113;
  unsigned short *llvm_cbe_tmp114;
  unsigned short llvm_cbe_tmp115;
  unsigned short llvm_cbe_tmp118;
  unsigned char *llvm_cbe_tmp139;
  unsigned char llvm_cbe_tmp149;
  unsigned char llvm_cbe_tmp160;
  unsigned char llvm_cbe_tmp166;
  unsigned int llvm_cbe_tmp287;
  unsigned int llvm_cbe_tmp289;
  unsigned int llvm_cbe_tmp291;
  unsigned int llvm_cbe_tmp293;
  unsigned int llvm_cbe_x1_0;
  unsigned int llvm_cbe_y1_0;
  unsigned int llvm_cbe_tmp308;
  unsigned int llvm_cbe_x2_0;
  unsigned int llvm_cbe_tmp320;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0;
  unsigned short *llvm_cbe_tmp336;
  unsigned int llvm_cbe_tmp339;
  unsigned long long llvm_cbe_tmp343344;
  unsigned short llvm_cbe_tmp346;
  unsigned short llvm_cbe_tmp349;
  unsigned char *llvm_cbe_tmp371;
  unsigned char llvm_cbe_tmp381;
  unsigned char llvm_cbe_tmp392;
  unsigned char llvm_cbe_tmp398;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_tmp430;
  unsigned int llvm_cbe_tmp432;
  unsigned int llvm_cbe_tmp443;
  unsigned char *ltmp_27_2;
  struct l_struct_2E_pointt *ltmp_28_5;
  struct l_struct_2E_pointt *llvm_cbe_tmp466;
  unsigned char *ltmp_29_2;
  struct l_struct_2E_pointt *llvm_cbe_tmp472;
  struct l_struct_2E_pointt *llvm_cbe_tmp482;
  unsigned int llvm_cbe_tmp484;
  unsigned long long llvm_cbe_tmp484492;
  unsigned int llvm_cbe_tmp501;
  unsigned short *llvm_cbe_tmp507;
  unsigned int llvm_cbe_tmp510;
  unsigned short llvm_cbe_tmp517;
  unsigned int llvm_cbe_tmp523;
  unsigned int llvm_cbe_x_0;
  unsigned int llvm_cbe_x_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_tmp532;
  unsigned int llvm_cbe_y2_0;
  unsigned int llvm_cbe_y2_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0;
  unsigned int llvm_cbe_y_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_boundl_1627;
  unsigned int llvm_cbe_boundl_1629;
  unsigned int llvm_cbe_boundl_1;
  bool llvm_cbe_flodd_0_reg2mem_0;
  bool llvm_cbe_flodd_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned char llvm_cbe_tmp566;
  struct l_struct_2E_pointt *llvm_cbe_tmp573;
  struct l_struct_2E_pointt *llvm_cbe_tmp578;
  unsigned int llvm_cbe_tmp584;
  unsigned int llvm_cbe_tmp588;
  unsigned char llvm_cbe_tmp592;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )8);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )8));
  *(&(regmng.field4)) = ((unsigned char )0);
  llvm_cbe_tmp7 = *(&(regmng.field1));
  llvm_cbe_tmp8 = ((unsigned short )(llvm_cbe_tmp7 + ((unsigned short )1)));
  *(&(regmng.field1)) = llvm_cbe_tmp8;
  if ((llvm_cbe_tmp8 == ((unsigned short )-1))) {
    goto llvm_cbe_cond_true;
  } else {
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_true:
  llvm_cbe_tmp18 = *(&(regmng.field16));
  llvm_cbe_tmp21 = *(&(regmng.field17));
  llvm_cbe_tmp27 = *(&(regmng.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )8);
  ltmp_23_2 = memset((((unsigned char *)llvm_cbe_tmp27)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )(llvm_cbe_tmp21 * llvm_cbe_tmp18))) << ((unsigned long long )1ll)));
  *(&(regmng.field1)) = ((unsigned short )1);
  goto llvm_cbe_cond_next;

llvm_cbe_cond_next:
  *llvm_cbe_xpl = ((unsigned int )-1);
  *llvm_cbe_ypl = ((unsigned int )-1);
  *(&(regmng.field2)) = ((unsigned int )-1);
  *(&(regmng.field3)) = ((unsigned int )-1);
  llvm_cbe_tmp38 = &llvm_cbe_bound1arp.field2;
  *llvm_cbe_tmp38 = ((unsigned int )128);
  llvm_cbe_tmp40 = &llvm_cbe_bound1arp.field1;
  *llvm_cbe_tmp40 = ((unsigned int )0);
  ltmp_24_2 =  /*tail*/ malloc(((unsigned long long )1024ll));
  ltmp_25_6 = ((struct l_struct_2E_pointt (*)[128])ltmp_24_2);
  llvm_cbe_tmp53 = &llvm_cbe_bound1arp.field0;
  *llvm_cbe_tmp53 = (&ltmp_25_6[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  *(&llvm_cbe_bound2arp.field2) = ((unsigned int )128);
  llvm_cbe_tmp58 = &llvm_cbe_bound2arp.field1;
  *llvm_cbe_tmp58 = ((unsigned int )0);
  ltmp_26_2 =  /*tail*/ malloc(((unsigned long long )1024ll));
  llvm_cbe_tmp74 = &llvm_cbe_bound2arp.field0;
  *llvm_cbe_tmp74 = (&(((struct l_struct_2E_pointt (*)[128])ltmp_26_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  if (((((signed int )llvm_cbe_y0) > ((signed int )((unsigned int )-1))) & (((signed int )llvm_cbe_x0) > ((signed int )((unsigned int )-1))))) {
    goto llvm_cbe_cond_true86;
  } else {
    goto llvm_cbe_cond_next285;
  }

llvm_cbe_cond_true86:
  llvm_cbe_tmp89 = *(&(regmng.field12));
  if ((((signed int )llvm_cbe_tmp89) < ((signed int )llvm_cbe_x0))) {
    goto llvm_cbe_cond_next285;
  } else {
    goto llvm_cbe_cond_true94;
  }

llvm_cbe_cond_true94:
  llvm_cbe_tmp97 = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp97) < ((signed int )llvm_cbe_y0))) {
    goto llvm_cbe_cond_next285;
  } else {
    goto llvm_cbe_cond_true102;
  }

llvm_cbe_cond_true102:
  llvm_cbe_tmp105 = *(&(regmng.field0));
  llvm_cbe_tmp108 = *(&(regmng.field16));
  llvm_cbe_tmp112113 = ((signed long long )(signed int )((llvm_cbe_tmp108 * llvm_cbe_y0) + llvm_cbe_x0));
  llvm_cbe_tmp114 = &llvm_cbe_tmp105[((signed long long )llvm_cbe_tmp112113)];
  llvm_cbe_tmp115 = *llvm_cbe_tmp114;
  llvm_cbe_tmp118 = *(&(regmng.field1));
  if ((llvm_cbe_tmp115 == llvm_cbe_tmp118)) {
    goto llvm_cbe_cond_next285;
  } else {
    goto llvm_cbe_cond_true122;
  }

llvm_cbe_cond_true122:
  llvm_cbe_tmp139 = *(&(regmng.field7));
  llvm_cbe_tmp149 = *(&llvm_cbe_tmp139[((signed long long )llvm_cbe_tmp112113)]);
  llvm_cbe_tmp160 = *(&regmng.field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp149)))]);
  if ((llvm_cbe_tmp160 == ((unsigned char )0))) {
    goto llvm_cbe_cond_next241;
  } else {
    goto llvm_cbe_cond_true163;
  }

llvm_cbe_cond_true163:
  llvm_cbe_tmp166 = *(&(regmng.field4));
  if ((llvm_cbe_tmp166 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true171;
  } else {
    goto llvm_cbe_cond_next181;
  }

llvm_cbe_cond_true171:
  *(&(regmng.field2)) = llvm_cbe_x0;
  *(&(regmng.field3)) = llvm_cbe_y0;
  *(&(regmng.field4)) = ((unsigned char )1);
  goto llvm_cbe_cond_next285;

llvm_cbe_cond_next181:
  if ((llvm_cbe_tmp160 == ((unsigned char )0))) {
    goto llvm_cbe_cond_next241;
  } else {
    goto llvm_cbe_cond_next265;
  }

llvm_cbe_cond_next241:
  *(&ltmp_25_6[((signed int )((unsigned int )0))][((signed long long )((unsigned long long )0ll))].field0) = llvm_cbe_x0;
  *(&ltmp_25_6[((signed int )((unsigned int )0))][((signed long long )((unsigned long long )0ll))].field1) = llvm_cbe_y0;
  *llvm_cbe_tmp40 = ((unsigned int )1);
  goto llvm_cbe_cond_next265;

llvm_cbe_cond_next265:
  *llvm_cbe_tmp114 = llvm_cbe_tmp118;
  goto llvm_cbe_cond_next285;

llvm_cbe_cond_next285:
  llvm_cbe_tmp287 = llvm_cbe_x0 + ((unsigned int )-1);
  llvm_cbe_tmp289 = llvm_cbe_y0 + ((unsigned int )-1);
  llvm_cbe_tmp291 = llvm_cbe_x0 + ((unsigned int )1);
  llvm_cbe_tmp293 = llvm_cbe_y0 + ((unsigned int )1);
  llvm_cbe_x1_0 = (((((signed int )llvm_cbe_tmp287) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp287));
  llvm_cbe_y1_0 = (((((signed int )llvm_cbe_tmp289) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp289));
  llvm_cbe_tmp308 = *(&(regmng.field12));
  llvm_cbe_x2_0 = (((((signed int )llvm_cbe_tmp308) < ((signed int )llvm_cbe_tmp291))) ? (llvm_cbe_tmp308) : (llvm_cbe_tmp291));
  llvm_cbe_tmp320 = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp320) < ((signed int )llvm_cbe_tmp293))) {
    goto llvm_cbe_cond_true325;
  } else {
    llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_tmp293;   /* for PHI node */
    llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb533;
  }

llvm_cbe_cond_true325:
  if ((((signed int )llvm_cbe_y1_0) > ((signed int )llvm_cbe_tmp320))) {
    goto llvm_cbe_bb539;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp320;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb524_preheader;
  }

llvm_cbe_bb524_preheader:
  llvm_cbe_y2_0_reg2mem_0_ph = llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_y_0_reg2mem_0_ph = llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_x_0__PHI_TEMPORARY = llvm_cbe_x1_0;   /* for PHI node */
  goto llvm_cbe_bb524;

  do {     /* Syntactic loop 'bb524' to make GCC happy */
llvm_cbe_bb524:
  llvm_cbe_x_0 = llvm_cbe_x_0__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )41);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )41));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_x_0) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb530;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb333;
  }

llvm_cbe_cond_next521:
  llvm_cbe_tmp523 = llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_x_0__PHI_TEMPORARY = llvm_cbe_tmp523;   /* for PHI node */
  goto llvm_cbe_bb524;

  do {     /* Syntactic loop 'bb333' to make GCC happy */
llvm_cbe_bb333:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )42);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )42));
  llvm_cbe_x_0_reg2mem_0 = llvm_cbe_indvar + llvm_cbe_x_0;
  llvm_cbe_tmp336 = *(&(regmng.field0));
  llvm_cbe_tmp339 = *(&(regmng.field16));
  llvm_cbe_tmp343344 = ((signed long long )(signed int )((llvm_cbe_tmp339 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0_reg2mem_0));
  llvm_cbe_tmp346 = *(&llvm_cbe_tmp336[((signed long long )llvm_cbe_tmp343344)]);
  llvm_cbe_tmp349 = *(&(regmng.field1));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_tmp346 == llvm_cbe_tmp349)) {
    goto llvm_cbe_cond_next521;
  } else {
    goto llvm_cbe_cond_true353;
  }

llvm_cbe_cond_true403:
  *(&(regmng.field2)) = llvm_cbe_x_0_reg2mem_0;
  *(&(regmng.field3)) = llvm_cbe_y_0_reg2mem_0_ph;
  *(&(regmng.field4)) = ((unsigned char )1);
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )(llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb530;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb333;
  }

llvm_cbe_cond_true395:
  llvm_cbe_tmp398 = *(&(regmng.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_tmp398 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true403;
  } else {
    goto llvm_cbe_cond_next413;
  }

llvm_cbe_cond_true353:
  llvm_cbe_tmp371 = *(&(regmng.field7));
  llvm_cbe_tmp381 = *(&llvm_cbe_tmp371[((signed long long )llvm_cbe_tmp343344)]);
  llvm_cbe_tmp392 = *(&regmng.field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp381)))]);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_tmp392 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true418;
  } else {
    goto llvm_cbe_cond_true395;
  }

  } while (1); /* end of syntactic loop 'bb333' */
llvm_cbe_cond_next504:
  llvm_cbe_tmp507 = *(&(regmng.field0));
  llvm_cbe_tmp510 = *(&(regmng.field16));
  llvm_cbe_tmp517 = *(&(regmng.field1));
  *(&llvm_cbe_tmp507[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp510 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0_reg2mem_0))))]) = llvm_cbe_tmp517;
  goto llvm_cbe_cond_next521;

llvm_cbe_cond_next413:
  if ((llvm_cbe_tmp392 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true418;
  } else {
    goto llvm_cbe_cond_next504;
  }

llvm_cbe_cond_next480:
  llvm_cbe_tmp482 = *llvm_cbe_tmp53;
  llvm_cbe_tmp484 = *llvm_cbe_tmp40;
  llvm_cbe_tmp484492 = ((signed long long )(signed int )llvm_cbe_tmp484);
  *(&llvm_cbe_tmp482[((signed long long )llvm_cbe_tmp484492)].field0) = llvm_cbe_x_0_reg2mem_0;
  *(&llvm_cbe_tmp482[((signed long long )llvm_cbe_tmp484492)].field1) = llvm_cbe_y_0_reg2mem_0_ph;
  llvm_cbe_tmp501 = *llvm_cbe_tmp40;
  *llvm_cbe_tmp40 = (llvm_cbe_tmp501 + ((unsigned int )1));
  goto llvm_cbe_cond_next504;

llvm_cbe_cond_true418:
  llvm_cbe_tmp430 = *llvm_cbe_tmp40;
  llvm_cbe_tmp432 = *llvm_cbe_tmp38;
  if ((llvm_cbe_tmp430 == llvm_cbe_tmp432)) {
    goto llvm_cbe_cond_true436;
  } else {
    goto llvm_cbe_cond_next480;
  }

llvm_cbe_cond_true436:
  llvm_cbe_tmp443 = llvm_cbe_tmp432 << ((unsigned int )1);
  ltmp_27_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp443)) * ((unsigned long long )8ll)));
  ltmp_28_5 = ((struct l_struct_2E_pointt *)ltmp_27_2);
  llvm_cbe_tmp466 = *llvm_cbe_tmp53;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )41);
  ltmp_29_2 = memcpy((((unsigned char *)ltmp_28_5)), (((unsigned char *)llvm_cbe_tmp466)), ((((signed long long )(signed int )llvm_cbe_tmp432)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp472 = *llvm_cbe_tmp53;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp472)));
  *llvm_cbe_tmp53 = ltmp_28_5;
  *llvm_cbe_tmp38 = llvm_cbe_tmp443;
  goto llvm_cbe_cond_next480;

  } while (1); /* end of syntactic loop 'bb524' */
llvm_cbe_bb530:
  llvm_cbe_tmp532 = llvm_cbe_y_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_y2_0_reg2mem_0_ph;   /* for PHI node */
  llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_tmp532;   /* for PHI node */
  goto llvm_cbe_bb533;

llvm_cbe_bb533:
  llvm_cbe_y2_0 = llvm_cbe_y2_0__PHI_TEMPORARY;
  llvm_cbe_y_0 = llvm_cbe_y_0__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_y_0) > ((signed int )llvm_cbe_y2_0))) {
    goto llvm_cbe_bb539;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y2_0;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y_0;   /* for PHI node */
    goto llvm_cbe_bb524_preheader;
  }

llvm_cbe_bb539:
  llvm_cbe_boundl_1627 = *llvm_cbe_tmp40;
  if ((llvm_cbe_boundl_1627 == ((unsigned int )0))) {
    goto llvm_cbe_bb571;
  } else {
    llvm_cbe_flodd_0_reg2mem_0__PHI_TEMPORARY = 1;   /* for PHI node */
    goto llvm_cbe_cond_next563;
  }

  do {     /* Syntactic loop 'cond_next563' to make GCC happy */
llvm_cbe_cond_next563:
  llvm_cbe_flodd_0_reg2mem_0 = llvm_cbe_flodd_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )40);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )40));
  llvm_cbe_tmp566 = *(&(regmng.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp566 == ((unsigned char )0))) {
    goto llvm_cbe_bb542;
  } else {
    goto llvm_cbe_bb571;
  }

llvm_cbe_cond_true548:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )40);
  _ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_((&llvm_cbe_bound1arp), (&llvm_cbe_bound2arp));
  llvm_cbe_boundl_1629 = *llvm_cbe_tmp58;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_boundl_1629 == ((unsigned int )0))) {
    goto llvm_cbe_bb571;
  } else {
    llvm_cbe_flodd_0_reg2mem_0__PHI_TEMPORARY = 0;   /* for PHI node */
    goto llvm_cbe_cond_next563;
  }

llvm_cbe_bb542:
  if (llvm_cbe_flodd_0_reg2mem_0) {
    goto llvm_cbe_cond_true548;
  } else {
    goto llvm_cbe_cond_false;
  }

llvm_cbe_cond_false:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )40);
  _ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_((&llvm_cbe_bound2arp), (&llvm_cbe_bound1arp));
  llvm_cbe_boundl_1 = *llvm_cbe_tmp40;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_boundl_1 == ((unsigned int )0))) {
    goto llvm_cbe_bb571;
  } else {
    llvm_cbe_flodd_0_reg2mem_0__PHI_TEMPORARY = 1;   /* for PHI node */
    goto llvm_cbe_cond_next563;
  }

  } while (1); /* end of syntactic loop 'cond_next563' */
llvm_cbe_bb571:
  llvm_cbe_tmp573 = *llvm_cbe_tmp53;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp573)));
  llvm_cbe_tmp578 = *llvm_cbe_tmp74;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp578)));
  llvm_cbe_tmp584 = *(&(regmng.field2));
  *llvm_cbe_xpl = llvm_cbe_tmp584;
  llvm_cbe_tmp588 = *(&(regmng.field3));
  *llvm_cbe_ypl = llvm_cbe_tmp588;
  llvm_cbe_tmp592 = *(&(regmng.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp592;
}


static void _ZN9regmngobj6createEv(void) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned char *ltmp_30_2;
  unsigned char *ltmp_31_2;
  unsigned char *ltmp_32_2;
  unsigned char *ltmp_33_2;
  unsigned int llvm_cbe_tmp101_rle_i;
  unsigned int llvm_cbe_tmp101_rle_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_0_reg2mem_0_i;
  unsigned int llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp104_i;
  unsigned int llvm_cbe_tmp112_i;
  unsigned char *ltmp_34_2;
  unsigned int *ltmp_35_7;
  unsigned int *llvm_cbe_tmp125_i;
  unsigned char *ltmp_36_2;
  unsigned int *llvm_cbe_tmp131_i;
  unsigned int *llvm_cbe_tmp141_i;
  unsigned int llvm_cbe_tmp144_i;
  unsigned int llvm_cbe_tmp150_i;
  unsigned int llvm_cbe_tmp151_i;
  unsigned int llvm_cbe_tmp155_i;
  unsigned int llvm_cbe_tmp159_i;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )9);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )9));
  *(&(regmng.field18.field5)) = ((unsigned int )16);
  *(&(regmng.field18.field4)) = ((unsigned int )0);
  ltmp_30_2 =  /*tail*/ malloc(((unsigned long long )128ll));
  *(&(regmng.field18.field0)) = (&(((struct l_struct_2E_regobj *(*)[16])ltmp_30_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  *(&(regmng.field18.field2.field2)) = ((unsigned int )16);
  *(&(regmng.field18.field2.field1)) = ((unsigned int )0);
  ltmp_31_2 =  /*tail*/ malloc(((unsigned long long )64ll));
  *(&(regmng.field18.field2.field0)) = (&(((unsigned int (*)[16])ltmp_31_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  *(&(regmng.field18.field3.field2)) = ((unsigned int )16);
  *(&(regmng.field18.field3.field1)) = ((unsigned int )0);
  ltmp_32_2 =  /*tail*/ malloc(((unsigned long long )64ll));
  *(&(regmng.field18.field3.field0)) = (&(((unsigned int (*)[16])ltmp_32_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  *(&(regmng.field18.field1.field2)) = ((unsigned int )16);
  *(&(regmng.field18.field1.field1)) = ((unsigned int )0);
  ltmp_33_2 =  /*tail*/ malloc(((unsigned long long )64ll));
  *(&(regmng.field18.field1.field0)) = (&(((unsigned int (*)[16])ltmp_33_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  llvm_cbe_tmp101_rle_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb94_i;

  do {     /* Syntactic loop 'bb94.i' to make GCC happy */
llvm_cbe_bb94_i:
  llvm_cbe_tmp101_rle_i = llvm_cbe_tmp101_rle_i__PHI_TEMPORARY;
  llvm_cbe_i_0_reg2mem_0_i = llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )43);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )43));
  llvm_cbe_tmp104_i = *(&(regmng.field18.field1.field2));
  if ((llvm_cbe_tmp101_rle_i == llvm_cbe_tmp104_i)) {
    goto llvm_cbe_cond_true_i;
  } else {
    goto llvm_cbe_cond_next_i;
  }

llvm_cbe_cond_next_i:
  llvm_cbe_tmp141_i = *(&(regmng.field18.field1.field0));
  llvm_cbe_tmp144_i = *(&(regmng.field18.field1.field1));
  *(&llvm_cbe_tmp141_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp144_i)))]) = llvm_cbe_i_0_reg2mem_0_i;
  llvm_cbe_tmp150_i = *(&(regmng.field18.field1.field1));
  llvm_cbe_tmp151_i = llvm_cbe_tmp150_i + ((unsigned int )1);
  *(&(regmng.field18.field1.field1)) = llvm_cbe_tmp151_i;
  llvm_cbe_tmp155_i = llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )1);
  llvm_cbe_tmp159_i = *(&(regmng.field18.field5));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp159_i) > ((signed int )llvm_cbe_tmp155_i))) {
    llvm_cbe_tmp101_rle_i__PHI_TEMPORARY = llvm_cbe_tmp151_i;   /* for PHI node */
    llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp155_i;   /* for PHI node */
    goto llvm_cbe_bb94_i;
  } else {
    goto llvm_cbe__ZN15largesolidarrayIP6regobjE6createEi_exit;
  }

llvm_cbe_cond_true_i:
  llvm_cbe_tmp112_i = llvm_cbe_tmp104_i << ((unsigned int )1);
  ltmp_34_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp112_i)) * ((unsigned long long )4ll)));
  ltmp_35_7 = ((unsigned int *)ltmp_34_2);
  llvm_cbe_tmp125_i = *(&(regmng.field18.field1.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )43);
  ltmp_36_2 = memcpy((((unsigned char *)ltmp_35_7)), (((unsigned char *)llvm_cbe_tmp125_i)), ((((signed long long )(signed int )llvm_cbe_tmp104_i)) << ((unsigned long long )2ll)));
  llvm_cbe_tmp131_i = *(&(regmng.field18.field1.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp131_i)));
  *(&(regmng.field18.field1.field0)) = ltmp_35_7;
  *(&(regmng.field18.field1.field2)) = llvm_cbe_tmp112_i;
  goto llvm_cbe_cond_next_i;

  } while (1); /* end of syntactic loop 'bb94.i' */
llvm_cbe__ZN15largesolidarrayIP6regobjE6createEi_exit:
  *(&(regmng.field6)) = ((struct l_struct_2E_regobj **)/*NULL*/0);
  *(&(regmng.field7)) = ((unsigned char *)/*NULL*/0);
  *(&(regmng.field0)) = ((unsigned short *)/*NULL*/0);
  *(&(regmng.field5)) = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN9regmngobj20definemiddleregpointEv(void) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp47206;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_regobj **llvm_cbe_tmp13;
  unsigned long long llvm_cbe_tmp1415;
  struct l_struct_2E_regobj *llvm_cbe_tmp20;
  struct l_struct_2E_regobj **llvm_cbe_tmp31;
  struct l_struct_2E_regobj *llvm_cbe_tmp38;
  unsigned int llvm_cbe_tmp42;
  unsigned int llvm_cbe_tmp47;
  unsigned int llvm_cbe_x_0216;
  unsigned int llvm_cbe_x_0216__PHI_TEMPORARY;
  unsigned int llvm_cbe_val35;
  unsigned int llvm_cbe_val46;
  struct l_struct_2E_regobj **llvm_cbe_tmp63;
  unsigned int llvm_cbe_tmp66;
  struct l_struct_2E_regobj *llvm_cbe_tmp76;
  unsigned int *llvm_cbe_tmp83;
  unsigned int llvm_cbe_tmp84;
  unsigned int *llvm_cbe_tmp92;
  unsigned int llvm_cbe_tmp93;
  unsigned int llvm_cbe_tmp100;
  unsigned int llvm_cbe_tmp104;
  unsigned int llvm_cbe_tmp111;
  unsigned int llvm_cbe_tmp115213;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_tmp104218;
  unsigned int llvm_cbe_tmp115;
  unsigned int llvm_cbe_tmp196222;
  unsigned int llvm_cbe_i_1220;
  unsigned int llvm_cbe_i_1220__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  struct l_struct_2E_regobj **llvm_cbe_tmp130;
  struct l_struct_2E_regobj *llvm_cbe_tmp137;
  unsigned int llvm_cbe_tmp140;
  unsigned int *llvm_cbe_tmp147;
  unsigned int llvm_cbe_tmp148;
  double llvm_cbe_tmp152153;
  unsigned int *llvm_cbe_tmp169;
  unsigned int llvm_cbe_tmp170;
  unsigned int llvm_cbe_tmp191;
  unsigned int llvm_cbe_tmp196;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )10);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )10));
  llvm_cbe_tmp47206 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp47206) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_bb112;
  }

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )44);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )44));
  llvm_cbe_tmp13 = *(&(regmng.field18.field0));
  llvm_cbe_tmp1415 = ((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0);
  llvm_cbe_tmp20 = *(&llvm_cbe_tmp13[((signed long long )llvm_cbe_tmp1415)]);
  *(&llvm_cbe_tmp20->field5.field0) = ((unsigned int )0);
  llvm_cbe_tmp31 = *(&(regmng.field18.field0));
  llvm_cbe_tmp38 = *(&llvm_cbe_tmp31[((signed long long )llvm_cbe_tmp1415)]);
  *(&llvm_cbe_tmp38->field5.field1) = ((unsigned int )0);
  llvm_cbe_tmp42 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp47 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp47) > ((signed int )llvm_cbe_tmp42))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp42;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_bb112;
  }

  } while (1); /* end of syntactic loop 'bb' */
  do {     /* Syntactic loop 'bb101.outer' to make GCC happy */
llvm_cbe_bb101_outer:
  llvm_cbe_y_0_reg2mem_0_ph = llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )46);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )46));
  llvm_cbe_tmp104218 = *(&(regmng.field12));
  if ((((signed int )llvm_cbe_tmp104218) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb109;
  } else {
    llvm_cbe_x_0216__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb53;
  }

llvm_cbe_bb109:
  llvm_cbe_tmp111 = llvm_cbe_y_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_tmp115213 = *(&(regmng.field13));
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )llvm_cbe_tmp115213) < ((signed int )llvm_cbe_tmp111))) {
    goto llvm_cbe_bb192_preheader;
  } else {
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp111;   /* for PHI node */
    goto llvm_cbe_bb101_outer;
  }

  do {     /* Syntactic loop 'bb53' to make GCC happy */
llvm_cbe_bb53:
  llvm_cbe_x_0216 = llvm_cbe_x_0216__PHI_TEMPORARY;
  llvm_cbe_val35 = *(&cg_caller_id_var);
  llvm_cbe_val46 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )47);
  CallEdgeProfiler(llvm_cbe_val35, llvm_cbe_val46, ((unsigned int )47));
  llvm_cbe_tmp63 = *(&(regmng.field6));
  llvm_cbe_tmp66 = *(&(regmng.field16));
  llvm_cbe_tmp76 = *(&llvm_cbe_tmp63[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp66 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0216))))]);
  if ((llvm_cbe_tmp76 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_next;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_cond_next:
  llvm_cbe_tmp100 = llvm_cbe_x_0216 + ((unsigned int )1);
  llvm_cbe_tmp104 = *(&(regmng.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((((signed int )llvm_cbe_tmp104) < ((signed int )llvm_cbe_tmp100))) {
    goto llvm_cbe_bb109;
  } else {
    llvm_cbe_x_0216__PHI_TEMPORARY = llvm_cbe_tmp100;   /* for PHI node */
    goto llvm_cbe_bb53;
  }

llvm_cbe_cond_true:
  llvm_cbe_tmp83 = &llvm_cbe_tmp76->field5.field0;
  llvm_cbe_tmp84 = *llvm_cbe_tmp83;
  *llvm_cbe_tmp83 = (llvm_cbe_tmp84 + llvm_cbe_x_0216);
  llvm_cbe_tmp92 = &llvm_cbe_tmp76->field5.field1;
  llvm_cbe_tmp93 = *llvm_cbe_tmp92;
  *llvm_cbe_tmp92 = (llvm_cbe_tmp93 + llvm_cbe_y_0_reg2mem_0_ph);
  goto llvm_cbe_cond_next;

  } while (1); /* end of syntactic loop 'bb53' */
  } while (1); /* end of syntactic loop 'bb101.outer' */
llvm_cbe_bb112:
  llvm_cbe_tmp115 = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp115) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb192_preheader;
  } else {
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb101_outer;
  }

llvm_cbe_bb192_preheader:
  llvm_cbe_tmp196222 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp196222) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_1220__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb121;
  } else {
    goto llvm_cbe_return;
  }

  do {     /* Syntactic loop 'bb121' to make GCC happy */
llvm_cbe_bb121:
  llvm_cbe_i_1220 = llvm_cbe_i_1220__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )45);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )45));
  llvm_cbe_tmp130 = *(&(regmng.field18.field0));
  llvm_cbe_tmp137 = *(&llvm_cbe_tmp130[((signed long long )(((signed long long )(signed int )llvm_cbe_i_1220)))]);
  llvm_cbe_tmp140 = *(&llvm_cbe_tmp137->field4);
  if ((((signed int )llvm_cbe_tmp140) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_cond_true144;
  } else {
    goto llvm_cbe_cond_next189;
  }

llvm_cbe_cond_next189:
  llvm_cbe_tmp191 = llvm_cbe_i_1220 + ((unsigned int )1);
  llvm_cbe_tmp196 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_tmp196) > ((signed int )llvm_cbe_tmp191))) {
    llvm_cbe_i_1220__PHI_TEMPORARY = llvm_cbe_tmp191;   /* for PHI node */
    goto llvm_cbe_bb121;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_cond_true144:
  llvm_cbe_tmp147 = &llvm_cbe_tmp137->field5.field0;
  llvm_cbe_tmp148 = *llvm_cbe_tmp147;
  llvm_cbe_tmp152153 = ((double )(signed int )llvm_cbe_tmp140);
  *llvm_cbe_tmp147 = (((signed int )(((float )((((float )((((double )(signed int )llvm_cbe_tmp148)) / llvm_cbe_tmp152153))) + 0x1p-1)))));
  llvm_cbe_tmp169 = &llvm_cbe_tmp137->field5.field1;
  llvm_cbe_tmp170 = *llvm_cbe_tmp169;
  *llvm_cbe_tmp169 = (((signed int )(((float )((((float )((((double )(signed int )llvm_cbe_tmp170)) / llvm_cbe_tmp152153))) + 0x1p-1)))));
  goto llvm_cbe_cond_next189;

  } while (1); /* end of syntactic loop 'bb121' */
llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN9regmngobj7destroyEv(void) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp4299;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_regobj **llvm_cbe_tmp10;
  unsigned long long llvm_cbe_tmp1112;
  struct l_struct_2E_regobj *llvm_cbe_tmp17;
  struct l_struct_2E_regobj **llvm_cbe_tmp5_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp26;
  struct l_struct_2E_regobj *llvm_cbe_tmp33;
  unsigned int llvm_cbe_tmp37;
  unsigned int llvm_cbe_tmp42;
  unsigned int *llvm_cbe_tmp55;
  unsigned int *llvm_cbe_tmp63;
  unsigned int *llvm_cbe_tmp72;
  struct l_struct_2E_regobj **llvm_cbe_tmp76;
  struct l_struct_2E_regobj **llvm_cbe_tmp80;
  unsigned char *llvm_cbe_tmp86;
  unsigned short *llvm_cbe_tmp91;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )11);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )11));
  llvm_cbe_tmp4299 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp4299) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_bb46;
  }

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )48);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )48));
  llvm_cbe_tmp10 = *(&(regmng.field18.field0));
  llvm_cbe_tmp1112 = ((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0);
  llvm_cbe_tmp17 = *(&llvm_cbe_tmp10[((signed long long )llvm_cbe_tmp1112)]);
  llvm_cbe_tmp5_i = *(&llvm_cbe_tmp17->field9.field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp5_i)));
  llvm_cbe_tmp26 = *(&(regmng.field18.field0));
  llvm_cbe_tmp33 = *(&llvm_cbe_tmp26[((signed long long )llvm_cbe_tmp1112)]);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )48);
   /*tail*/ _ZdlPv((((unsigned char *)llvm_cbe_tmp33)));
  llvm_cbe_tmp37 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp42 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp42) > ((signed int )llvm_cbe_tmp37))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp37;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_bb46;
  }

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_bb46:
  llvm_cbe_tmp55 = *(&(regmng.field18.field3.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp55)));
  llvm_cbe_tmp63 = *(&(regmng.field18.field2.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp63)));
  llvm_cbe_tmp72 = *(&(regmng.field18.field1.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp72)));
  llvm_cbe_tmp76 = *(&(regmng.field18.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp76)));
  llvm_cbe_tmp80 = *(&(regmng.field6));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp80)));
  *(&(regmng.field6)) = ((struct l_struct_2E_regobj **)/*NULL*/0);
  llvm_cbe_tmp86 = *(&(regmng.field7));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp86)));
  *(&(regmng.field7)) = ((unsigned char *)/*NULL*/0);
  llvm_cbe_tmp91 = *(&(regmng.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp91)));
  *(&(regmng.field0)) = ((unsigned short *)/*NULL*/0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN9regmngobj15redefineregionsEv(void) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned char *ltmp_37_2;
  struct l_struct_2E_regboundobj *llvm_cbe_tmp19242_sub;
  unsigned int llvm_cbe_tmp170264;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_rboundarp_2_2_reg2mem_0;
  unsigned int llvm_cbe_rboundarp_2_2_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_rboundarp_1_1_reg2mem_0;
  unsigned int llvm_cbe_rboundarp_1_1_reg2mem_0__PHI_TEMPORARY;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_2_reg2mem_0;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_2_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_regobj **llvm_cbe_tmp32;
  unsigned long long llvm_cbe_tmp3334;
  struct l_struct_2E_regobj *llvm_cbe_tmp39;
  unsigned char llvm_cbe_tmp41;
  unsigned int llvm_cbe_tmp55;
  unsigned char *ltmp_38_2;
  struct l_struct_2E_regboundobj *ltmp_39_8;
  unsigned char *ltmp_40_2;
  unsigned int llvm_cbe_rboundarp_2_0;
  unsigned int llvm_cbe_rboundarp_2_0__PHI_TEMPORARY;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_0;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp93;
  unsigned long long llvm_cbe_tmp100_sum;
  struct l_struct_2E_regobj **llvm_cbe_tmp115;
  struct l_struct_2E_regobj *llvm_cbe_tmp122;
  unsigned int llvm_cbe_tmp141;
  unsigned int llvm_cbe_tmp160;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_1;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_rboundarp_1_0;
  unsigned int llvm_cbe_rboundarp_1_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_rboundarp_2_1;
  unsigned int llvm_cbe_rboundarp_2_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp165;
  unsigned int llvm_cbe_tmp170;
  unsigned char llvm_cbe_tmp189;
  unsigned char llvm_cbe_fldone_0;
  unsigned int llvm_cbe_tmp198;
  unsigned int llvm_cbe_rboundarp_1_1_reg2mem_1_ph;
  unsigned int llvm_cbe_rboundarp_1_1_reg2mem_1_ph__PHI_TEMPORARY;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_2_reg2mem_1_ph;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_2_reg2mem_1_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_1;
  unsigned int llvm_cbe_i_1__PHI_TEMPORARY;
  unsigned char llvm_cbe_fldone_1;
  unsigned char llvm_cbe_fldone_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_i_2267;
  unsigned int llvm_cbe_i_2267__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp219220;
  struct l_struct_2E_pointt *llvm_cbe_tmp5_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp13_i;
  unsigned int llvm_cbe_tmp226;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )12);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )12));
  ltmp_37_2 =  /*tail*/ malloc(((unsigned long long )1792ll));
  llvm_cbe_tmp19242_sub = &(((struct l_struct_2E_regboundobj (*)[16])ltmp_37_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))];
  llvm_cbe_tmp170264 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp170264) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_rboundarp_2_2_reg2mem_0__PHI_TEMPORARY = ((unsigned int )16);   /* for PHI node */
    llvm_cbe_rboundarp_1_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_rboundarp_0_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp19242_sub;   /* for PHI node */
    goto llvm_cbe_bb24;
  } else {
    llvm_cbe_rboundarp_1_1_reg2mem_1_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_rboundarp_0_2_reg2mem_1_ph__PHI_TEMPORARY = llvm_cbe_tmp19242_sub;   /* for PHI node */
    goto llvm_cbe_bb199_preheader;
  }

  do {     /* Syntactic loop 'bb24' to make GCC happy */
llvm_cbe_bb24:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_rboundarp_2_2_reg2mem_0 = llvm_cbe_rboundarp_2_2_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_rboundarp_1_1_reg2mem_0 = llvm_cbe_rboundarp_1_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_rboundarp_0_2_reg2mem_0 = llvm_cbe_rboundarp_0_2_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )49);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )49));
  llvm_cbe_tmp32 = *(&(regmng.field18.field0));
  llvm_cbe_tmp3334 = ((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0);
  llvm_cbe_tmp39 = *(&llvm_cbe_tmp32[((signed long long )llvm_cbe_tmp3334)]);
  llvm_cbe_tmp41 = *(&llvm_cbe_tmp39->field2);
  if ((llvm_cbe_tmp41 == ((unsigned char )0))) {
    llvm_cbe_rboundarp_0_1__PHI_TEMPORARY = llvm_cbe_rboundarp_0_2_reg2mem_0;   /* for PHI node */
    llvm_cbe_rboundarp_1_0__PHI_TEMPORARY = llvm_cbe_rboundarp_1_1_reg2mem_0;   /* for PHI node */
    llvm_cbe_rboundarp_2_1__PHI_TEMPORARY = llvm_cbe_rboundarp_2_2_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_bb166;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_bb166:
  llvm_cbe_rboundarp_0_1 = llvm_cbe_rboundarp_0_1__PHI_TEMPORARY;
  llvm_cbe_rboundarp_1_0 = llvm_cbe_rboundarp_1_0__PHI_TEMPORARY;
  llvm_cbe_rboundarp_2_1 = llvm_cbe_rboundarp_2_1__PHI_TEMPORARY;
  llvm_cbe_tmp165 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp170 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp170) > ((signed int )llvm_cbe_tmp165))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp165;   /* for PHI node */
    llvm_cbe_rboundarp_2_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_rboundarp_2_1;   /* for PHI node */
    llvm_cbe_rboundarp_1_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_rboundarp_1_0;   /* for PHI node */
    llvm_cbe_rboundarp_0_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_rboundarp_0_1;   /* for PHI node */
    goto llvm_cbe_bb24;
  } else {
    llvm_cbe_rboundarp_1_1_reg2mem_1_ph__PHI_TEMPORARY = llvm_cbe_rboundarp_1_0;   /* for PHI node */
    llvm_cbe_rboundarp_0_2_reg2mem_1_ph__PHI_TEMPORARY = llvm_cbe_rboundarp_0_1;   /* for PHI node */
    goto llvm_cbe_bb199_preheader;
  }

llvm_cbe_cond_next90:
  llvm_cbe_rboundarp_2_0 = llvm_cbe_rboundarp_2_0__PHI_TEMPORARY;
  llvm_cbe_rboundarp_0_0 = llvm_cbe_rboundarp_0_0__PHI_TEMPORARY;
  llvm_cbe_tmp93 = llvm_cbe_rboundarp_1_1_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp100_sum = (((signed long long )(signed int )llvm_cbe_tmp93)) + ((unsigned long long )-1ll);
  *(&llvm_cbe_rboundarp_0_0[((signed long long )llvm_cbe_tmp100_sum)].field16) = ((unsigned char )1);
  llvm_cbe_tmp115 = *(&(regmng.field18.field0));
  llvm_cbe_tmp122 = *(&llvm_cbe_tmp115[((signed long long )llvm_cbe_tmp3334)]);
  llvm_cbe_tmp141 = *(&llvm_cbe_tmp122->field5.field1);
  llvm_cbe_tmp160 = *(&llvm_cbe_tmp122->field5.field0);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )49);
   /*tail*/ _ZN11regboundobj9firststepEiiP6regobjP9regmngobj((&llvm_cbe_rboundarp_0_0[((signed long long )llvm_cbe_tmp100_sum)]), llvm_cbe_tmp160, llvm_cbe_tmp141, llvm_cbe_tmp122);
  llvm_cbe_rboundarp_0_1__PHI_TEMPORARY = llvm_cbe_rboundarp_0_0;   /* for PHI node */
  llvm_cbe_rboundarp_1_0__PHI_TEMPORARY = llvm_cbe_tmp93;   /* for PHI node */
  llvm_cbe_rboundarp_2_1__PHI_TEMPORARY = llvm_cbe_rboundarp_2_0;   /* for PHI node */
  goto llvm_cbe_bb166;

llvm_cbe_cond_true:
  if ((llvm_cbe_rboundarp_1_1_reg2mem_0 == llvm_cbe_rboundarp_2_2_reg2mem_0)) {
    goto llvm_cbe_cond_true51;
  } else {
    llvm_cbe_rboundarp_2_0__PHI_TEMPORARY = llvm_cbe_rboundarp_2_2_reg2mem_0;   /* for PHI node */
    llvm_cbe_rboundarp_0_0__PHI_TEMPORARY = llvm_cbe_rboundarp_0_2_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_cond_next90;
  }

llvm_cbe_cond_true51:
  llvm_cbe_tmp55 = llvm_cbe_rboundarp_2_2_reg2mem_0 << ((unsigned int )1);
  ltmp_38_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp55)) * ((unsigned long long )112ll)));
  ltmp_39_8 = ((struct l_struct_2E_regboundobj *)ltmp_38_2);
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )49);
  ltmp_40_2 = memcpy((((unsigned char *)ltmp_39_8)), (((unsigned char *)llvm_cbe_rboundarp_0_2_reg2mem_0)), ((((signed long long )(signed int )llvm_cbe_rboundarp_2_2_reg2mem_0)) * ((unsigned long long )112ll)));
   /*tail*/ free((((unsigned char *)llvm_cbe_rboundarp_0_2_reg2mem_0)));
  llvm_cbe_rboundarp_2_0__PHI_TEMPORARY = llvm_cbe_tmp55;   /* for PHI node */
  llvm_cbe_rboundarp_0_0__PHI_TEMPORARY = ltmp_39_8;   /* for PHI node */
  goto llvm_cbe_cond_next90;

  } while (1); /* end of syntactic loop 'bb24' */
llvm_cbe_bb199_preheader:
  llvm_cbe_rboundarp_1_1_reg2mem_1_ph = llvm_cbe_rboundarp_1_1_reg2mem_1_ph__PHI_TEMPORARY;
  llvm_cbe_rboundarp_0_2_reg2mem_1_ph = llvm_cbe_rboundarp_0_2_reg2mem_1_ph__PHI_TEMPORARY;
  llvm_cbe_i_1__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_fldone_1__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
  goto llvm_cbe_bb199;

  do {     /* Syntactic loop 'bb199' to make GCC happy */
llvm_cbe_bb199:
  llvm_cbe_i_1 = llvm_cbe_i_1__PHI_TEMPORARY;
  llvm_cbe_fldone_1 = llvm_cbe_fldone_1__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )50);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )50));
  if ((((signed int )llvm_cbe_rboundarp_1_1_reg2mem_1_ph) > ((signed int )llvm_cbe_i_1))) {
    goto llvm_cbe_bb177;
  } else {
    goto llvm_cbe_bb206;
  }

llvm_cbe_bb177:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )50);
  llvm_cbe_tmp189 =  /*tail*/ _ZN11regboundobj4stepEv((&llvm_cbe_rboundarp_0_2_reg2mem_1_ph[((signed long long )(((signed long long )(signed int )llvm_cbe_i_1)))]));
  llvm_cbe_fldone_0 = (((llvm_cbe_tmp189 == ((unsigned char )1))) ? (((unsigned char )0)) : (llvm_cbe_fldone_1));
  llvm_cbe_tmp198 = llvm_cbe_i_1 + ((unsigned int )1);
  llvm_cbe_i_1__PHI_TEMPORARY = llvm_cbe_tmp198;   /* for PHI node */
  llvm_cbe_fldone_1__PHI_TEMPORARY = llvm_cbe_fldone_0;   /* for PHI node */
  goto llvm_cbe_bb199;

llvm_cbe_bb206:
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_fldone_1 == ((unsigned char )0))) {
    llvm_cbe_i_1__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_fldone_1__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
    goto llvm_cbe_bb199;
  } else {
    goto llvm_cbe_bb227_loopexit;
  }

  } while (1); /* end of syntactic loop 'bb199' */
  do {     /* Syntactic loop 'bb213' to make GCC happy */
llvm_cbe_bb213:
  llvm_cbe_i_2267 = llvm_cbe_i_2267__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )51);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )51));
  llvm_cbe_tmp219220 = ((signed long long )(signed int )llvm_cbe_i_2267);
  llvm_cbe_tmp5_i = *(&llvm_cbe_rboundarp_0_2_reg2mem_1_ph[((signed long long )llvm_cbe_tmp219220)].field0.field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp5_i)));
  llvm_cbe_tmp13_i = *(&llvm_cbe_rboundarp_0_2_reg2mem_1_ph[((signed long long )llvm_cbe_tmp219220)].field1.field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp13_i)));
  llvm_cbe_tmp226 = llvm_cbe_i_2267 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_rboundarp_1_1_reg2mem_1_ph) > ((signed int )llvm_cbe_tmp226))) {
    llvm_cbe_i_2267__PHI_TEMPORARY = llvm_cbe_tmp226;   /* for PHI node */
    goto llvm_cbe_bb213;
  } else {
    goto llvm_cbe_bb234;
  }

  } while (1); /* end of syntactic loop 'bb213' */
llvm_cbe_bb227_loopexit:
  if ((((signed int )llvm_cbe_rboundarp_1_1_reg2mem_1_ph) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_2267__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb213;
  } else {
    goto llvm_cbe_bb234;
  }

llvm_cbe_bb234:
   /*tail*/ free((((unsigned char *)llvm_cbe_rboundarp_0_2_reg2mem_1_ph)));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN9regmngobj13deleteregionsEv(void) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned char *ltmp_41_2;
  struct l_struct_2E_regobj **llvm_cbe_tmp18336_sub;
  unsigned int llvm_cbe_tmp126359;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_deletedregions_2_2_reg2mem_0;
  unsigned int llvm_cbe_deletedregions_2_2_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_deletedregions_1_1_reg2mem_0;
  unsigned int llvm_cbe_deletedregions_1_1_reg2mem_0__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_deletedregions_0_2_reg2mem_0;
  struct l_struct_2E_regobj **llvm_cbe_deletedregions_0_2_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_regobj **llvm_cbe_tmp31;
  struct l_struct_2E_regobj **llvm_cbe_tmp34;
  struct l_struct_2E_regobj *llvm_cbe_tmp38;
  unsigned char llvm_cbe_tmp40;
  unsigned int llvm_cbe_tmp71;
  unsigned char *ltmp_42_2;
  struct l_struct_2E_regobj **ltmp_43_9;
  unsigned char *ltmp_44_2;
  unsigned int llvm_cbe_deletedregions_2_0;
  unsigned int llvm_cbe_deletedregions_2_0__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_deletedregions_0_0;
  struct l_struct_2E_regobj **llvm_cbe_deletedregions_0_0__PHI_TEMPORARY;
  struct l_struct_2E_regobj *llvm_cbe_tmp112;
  unsigned int llvm_cbe_tmp117;
  struct l_struct_2E_regobj **llvm_cbe_deletedregions_0_1;
  struct l_struct_2E_regobj **llvm_cbe_deletedregions_0_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_deletedregions_1_0;
  unsigned int llvm_cbe_deletedregions_1_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_deletedregions_2_1;
  unsigned int llvm_cbe_deletedregions_2_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp121;
  unsigned int llvm_cbe_tmp126;
  unsigned int llvm_cbe_i_1362;
  unsigned int llvm_cbe_i_1362__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  struct l_struct_2E_regobj **llvm_cbe_tmp140;
  struct l_struct_2E_regobj *llvm_cbe_tmp144;
  unsigned int llvm_cbe_tmp146;
  unsigned int *llvm_cbe_tmp153;
  unsigned int llvm_cbe_tmp157;
  unsigned int llvm_cbe_tmp160;
  unsigned int llvm_cbe_tmp161;
  struct l_struct_2E_regobj **llvm_cbe_tmp169;
  struct l_struct_2E_regobj *llvm_cbe_tmp179;
  unsigned long long llvm_cbe_tmp180181;
  unsigned int *llvm_cbe_tmp186;
  unsigned int *llvm_cbe_tmp190;
  unsigned int llvm_cbe_tmp193;
  unsigned int llvm_cbe_tmp197;
  unsigned int *llvm_cbe_tmp204;
  unsigned int llvm_cbe_tmp211;
  unsigned int llvm_cbe_tmp215;
  unsigned int llvm_cbe_tmp226;
  unsigned int llvm_cbe_tmp229;
  unsigned int llvm_cbe_tmp241;
  unsigned char *ltmp_45_2;
  unsigned int *ltmp_46_7;
  unsigned int *llvm_cbe_tmp254;
  unsigned char *ltmp_47_2;
  unsigned int *llvm_cbe_tmp260;
  unsigned int *llvm_cbe_tmp271;
  unsigned int llvm_cbe_tmp274;
  unsigned int llvm_cbe_tmp280;
  unsigned int llvm_cbe_tmp286;
  struct l_struct_2E_regobj *llvm_cbe_tmp301;
  struct l_struct_2E_regobj **llvm_cbe_tmp5_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp313;
  unsigned int llvm_cbe_tmp317;
  unsigned int llvm_cbe_deletedregions_1_1_reg2mem_1_ph;
  unsigned int llvm_cbe_deletedregions_1_1_reg2mem_1_ph__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_deletedregions_0_2_reg2mem_1_ph;
  struct l_struct_2E_regobj **llvm_cbe_deletedregions_0_2_reg2mem_1_ph__PHI_TEMPORARY;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )13);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )13));
  ltmp_41_2 =  /*tail*/ malloc(((unsigned long long )128ll));
  llvm_cbe_tmp18336_sub = &(((struct l_struct_2E_regobj *(*)[16])ltmp_41_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))];
  llvm_cbe_tmp126359 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp126359) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_deletedregions_2_2_reg2mem_0__PHI_TEMPORARY = ((unsigned int )16);   /* for PHI node */
    llvm_cbe_deletedregions_1_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_deletedregions_0_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp18336_sub;   /* for PHI node */
    goto llvm_cbe_bb23;
  } else {
    llvm_cbe_deletedregions_1_1_reg2mem_1_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_deletedregions_0_2_reg2mem_1_ph__PHI_TEMPORARY = llvm_cbe_tmp18336_sub;   /* for PHI node */
    goto llvm_cbe_bb318_preheader;
  }

  do {     /* Syntactic loop 'bb23' to make GCC happy */
llvm_cbe_bb23:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_deletedregions_2_2_reg2mem_0 = llvm_cbe_deletedregions_2_2_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_deletedregions_1_1_reg2mem_0 = llvm_cbe_deletedregions_1_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_deletedregions_0_2_reg2mem_0 = llvm_cbe_deletedregions_0_2_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )52);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )52));
  llvm_cbe_tmp31 = *(&(regmng.field18.field0));
  llvm_cbe_tmp34 = &llvm_cbe_tmp31[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0)))];
  llvm_cbe_tmp38 = *llvm_cbe_tmp34;
  llvm_cbe_tmp40 = *(&llvm_cbe_tmp38->field1);
  if ((llvm_cbe_tmp40 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true;
  } else {
    llvm_cbe_deletedregions_0_1__PHI_TEMPORARY = llvm_cbe_deletedregions_0_2_reg2mem_0;   /* for PHI node */
    llvm_cbe_deletedregions_1_0__PHI_TEMPORARY = llvm_cbe_deletedregions_1_1_reg2mem_0;   /* for PHI node */
    llvm_cbe_deletedregions_2_1__PHI_TEMPORARY = llvm_cbe_deletedregions_2_2_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_bb122;
  }

llvm_cbe_bb122:
  llvm_cbe_deletedregions_0_1 = llvm_cbe_deletedregions_0_1__PHI_TEMPORARY;
  llvm_cbe_deletedregions_1_0 = llvm_cbe_deletedregions_1_0__PHI_TEMPORARY;
  llvm_cbe_deletedregions_2_1 = llvm_cbe_deletedregions_2_1__PHI_TEMPORARY;
  llvm_cbe_tmp121 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp126 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp126) > ((signed int )llvm_cbe_tmp121))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp121;   /* for PHI node */
    llvm_cbe_deletedregions_2_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_deletedregions_2_1;   /* for PHI node */
    llvm_cbe_deletedregions_1_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_deletedregions_1_0;   /* for PHI node */
    llvm_cbe_deletedregions_0_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_deletedregions_0_1;   /* for PHI node */
    goto llvm_cbe_bb23;
  } else {
    llvm_cbe_deletedregions_1_1_reg2mem_1_ph__PHI_TEMPORARY = llvm_cbe_deletedregions_1_0;   /* for PHI node */
    llvm_cbe_deletedregions_0_2_reg2mem_1_ph__PHI_TEMPORARY = llvm_cbe_deletedregions_0_1;   /* for PHI node */
    goto llvm_cbe_bb318_preheader;
  }

llvm_cbe_cond_next106:
  llvm_cbe_deletedregions_2_0 = llvm_cbe_deletedregions_2_0__PHI_TEMPORARY;
  llvm_cbe_deletedregions_0_0 = llvm_cbe_deletedregions_0_0__PHI_TEMPORARY;
  llvm_cbe_tmp112 = *llvm_cbe_tmp34;
  *(&llvm_cbe_deletedregions_0_0[((signed long long )(((signed long long )(signed int )llvm_cbe_deletedregions_1_1_reg2mem_0)))]) = llvm_cbe_tmp112;
  llvm_cbe_tmp117 = llvm_cbe_deletedregions_1_1_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_deletedregions_0_1__PHI_TEMPORARY = llvm_cbe_deletedregions_0_0;   /* for PHI node */
  llvm_cbe_deletedregions_1_0__PHI_TEMPORARY = llvm_cbe_tmp117;   /* for PHI node */
  llvm_cbe_deletedregions_2_1__PHI_TEMPORARY = llvm_cbe_deletedregions_2_0;   /* for PHI node */
  goto llvm_cbe_bb122;

llvm_cbe_cond_true:
  if ((llvm_cbe_deletedregions_1_1_reg2mem_0 == llvm_cbe_deletedregions_2_2_reg2mem_0)) {
    goto llvm_cbe_cond_true67;
  } else {
    llvm_cbe_deletedregions_2_0__PHI_TEMPORARY = llvm_cbe_deletedregions_2_2_reg2mem_0;   /* for PHI node */
    llvm_cbe_deletedregions_0_0__PHI_TEMPORARY = llvm_cbe_deletedregions_0_2_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_cond_next106;
  }

llvm_cbe_cond_true67:
  llvm_cbe_tmp71 = llvm_cbe_deletedregions_2_2_reg2mem_0 << ((unsigned int )1);
  ltmp_42_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp71)) * ((unsigned long long )8ll)));
  ltmp_43_9 = ((struct l_struct_2E_regobj **)ltmp_42_2);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )52);
  ltmp_44_2 = memcpy((((unsigned char *)ltmp_43_9)), (((unsigned char *)llvm_cbe_deletedregions_0_2_reg2mem_0)), ((((signed long long )(signed int )llvm_cbe_deletedregions_2_2_reg2mem_0)) << ((unsigned long long )3ll)));
   /*tail*/ free((((unsigned char *)llvm_cbe_deletedregions_0_2_reg2mem_0)));
  llvm_cbe_deletedregions_2_0__PHI_TEMPORARY = llvm_cbe_tmp71;   /* for PHI node */
  llvm_cbe_deletedregions_0_0__PHI_TEMPORARY = ltmp_43_9;   /* for PHI node */
  goto llvm_cbe_cond_next106;

  } while (1); /* end of syntactic loop 'bb23' */
  do {     /* Syntactic loop 'bb132' to make GCC happy */
llvm_cbe_bb132:
  llvm_cbe_i_1362 = llvm_cbe_i_1362__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )53);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )53));
  llvm_cbe_tmp140 = &llvm_cbe_deletedregions_0_2_reg2mem_1_ph[((signed long long )(((signed long long )(signed int )llvm_cbe_i_1362)))];
  llvm_cbe_tmp144 = *llvm_cbe_tmp140;
  llvm_cbe_tmp146 = *(&llvm_cbe_tmp144->field0);
  llvm_cbe_tmp153 = *(&(regmng.field18.field2.field0));
  llvm_cbe_tmp157 = *(&llvm_cbe_tmp153[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp146)))]);
  llvm_cbe_tmp160 = *(&(regmng.field18.field4));
  llvm_cbe_tmp161 = llvm_cbe_tmp160 + ((unsigned int )-1);
  if ((llvm_cbe_tmp161 == llvm_cbe_tmp157)) {
    goto llvm_cbe_cond_next219;
  } else {
    goto llvm_cbe_cond_true166;
  }

llvm_cbe_cond_next268:
  llvm_cbe_tmp271 = *(&(regmng.field18.field1.field0));
  llvm_cbe_tmp274 = *(&(regmng.field18.field1.field1));
  *(&llvm_cbe_tmp271[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp274)))]) = llvm_cbe_tmp146;
  llvm_cbe_tmp280 = *(&(regmng.field18.field1.field1));
  *(&(regmng.field18.field1.field1)) = (llvm_cbe_tmp280 + ((unsigned int )1));
  llvm_cbe_tmp286 = *(&(regmng.field18.field4));
  *(&(regmng.field18.field4)) = (llvm_cbe_tmp286 + ((unsigned int )-1));
  llvm_cbe_tmp301 = *llvm_cbe_tmp140;
  llvm_cbe_tmp5_i = *(&llvm_cbe_tmp301->field9.field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp5_i)));
  llvm_cbe_tmp313 = *llvm_cbe_tmp140;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )53);
   /*tail*/ _ZdlPv((((unsigned char *)llvm_cbe_tmp313)));
  llvm_cbe_tmp317 = llvm_cbe_i_1362 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_deletedregions_1_1_reg2mem_1_ph) > ((signed int )llvm_cbe_tmp317))) {
    llvm_cbe_i_1362__PHI_TEMPORARY = llvm_cbe_tmp317;   /* for PHI node */
    goto llvm_cbe_bb132;
  } else {
    goto llvm_cbe_bb325;
  }

llvm_cbe_cond_next219:
  llvm_cbe_tmp226 = *(&(regmng.field18.field1.field1));
  llvm_cbe_tmp229 = *(&(regmng.field18.field1.field2));
  if ((llvm_cbe_tmp226 == llvm_cbe_tmp229)) {
    goto llvm_cbe_cond_true233;
  } else {
    goto llvm_cbe_cond_next268;
  }

llvm_cbe_cond_true166:
  llvm_cbe_tmp169 = *(&(regmng.field18.field0));
  llvm_cbe_tmp179 = *(&llvm_cbe_tmp169[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp161)))]);
  llvm_cbe_tmp180181 = ((signed long long )(signed int )llvm_cbe_tmp157);
  *(&llvm_cbe_tmp169[((signed long long )llvm_cbe_tmp180181)]) = llvm_cbe_tmp179;
  llvm_cbe_tmp186 = *(&(regmng.field18.field2.field0));
  llvm_cbe_tmp190 = *(&(regmng.field18.field3.field0));
  llvm_cbe_tmp193 = *(&(regmng.field18.field4));
  llvm_cbe_tmp197 = *(&llvm_cbe_tmp190[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp193 + ((unsigned int )-1)))))]);
  *(&llvm_cbe_tmp186[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp197)))]) = llvm_cbe_tmp157;
  llvm_cbe_tmp204 = *(&(regmng.field18.field3.field0));
  llvm_cbe_tmp211 = *(&(regmng.field18.field4));
  llvm_cbe_tmp215 = *(&llvm_cbe_tmp204[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp211 + ((unsigned int )-1)))))]);
  *(&llvm_cbe_tmp204[((signed long long )llvm_cbe_tmp180181)]) = llvm_cbe_tmp215;
  goto llvm_cbe_cond_next219;

llvm_cbe_cond_true233:
  llvm_cbe_tmp241 = llvm_cbe_tmp229 << ((unsigned int )1);
  ltmp_45_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp241)) * ((unsigned long long )4ll)));
  ltmp_46_7 = ((unsigned int *)ltmp_45_2);
  llvm_cbe_tmp254 = *(&(regmng.field18.field1.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )53);
  ltmp_47_2 = memcpy((((unsigned char *)ltmp_46_7)), (((unsigned char *)llvm_cbe_tmp254)), ((((signed long long )(signed int )llvm_cbe_tmp229)) << ((unsigned long long )2ll)));
  llvm_cbe_tmp260 = *(&(regmng.field18.field1.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp260)));
  *(&(regmng.field18.field1.field0)) = ltmp_46_7;
  *(&(regmng.field18.field1.field2)) = llvm_cbe_tmp241;
  goto llvm_cbe_cond_next268;

  } while (1); /* end of syntactic loop 'bb132' */
llvm_cbe_bb318_preheader:
  llvm_cbe_deletedregions_1_1_reg2mem_1_ph = llvm_cbe_deletedregions_1_1_reg2mem_1_ph__PHI_TEMPORARY;
  llvm_cbe_deletedregions_0_2_reg2mem_1_ph = llvm_cbe_deletedregions_0_2_reg2mem_1_ph__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_deletedregions_1_1_reg2mem_1_ph) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_1362__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb132;
  } else {
    goto llvm_cbe_bb325;
  }

llvm_cbe_bb325:
   /*tail*/ free((((unsigned char *)llvm_cbe_deletedregions_0_2_reg2mem_1_ph)));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN9regmngobj18enlargeneighborsesEi(unsigned int llvm_cbe_critical) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp33324;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_regobj **llvm_cbe_tmp18;
  struct l_struct_2E_regobj *llvm_cbe_tmp25;
  unsigned int llvm_cbe_tmp28;
  unsigned int llvm_cbe_tmp33;
  unsigned int llvm_cbe_i_1_reg2mem_0;
  unsigned int llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  struct l_struct_2E_regobj **llvm_cbe_tmp47;
  unsigned long long llvm_cbe_tmp4849;
  struct l_struct_2E_regobj *llvm_cbe_tmp54;
  unsigned int llvm_cbe_tmp56;
  struct l_struct_2E_regobj **llvm_cbe_tmp123355;
  struct l_struct_2E_regobj *llvm_cbe_tmp130358;
  unsigned int llvm_cbe_tmp133360;
  struct l_struct_2E_regobj **llvm_cbe_tmp88_rle;
  struct l_struct_2E_regobj **llvm_cbe_tmp88_rle__PHI_TEMPORARY;
  unsigned int llvm_cbe_i2_0353;
  unsigned int llvm_cbe_i2_0353__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  struct l_struct_2E_regobj *llvm_cbe_tmp95;
  struct l_struct_2E_regobj **llvm_cbe_tmp103;
  struct l_struct_2E_regobj *llvm_cbe_tmp110;
  unsigned int llvm_cbe_tmp113;
  struct l_struct_2E_regobj **llvm_cbe_tmp123;
  struct l_struct_2E_regobj *llvm_cbe_tmp130;
  unsigned int llvm_cbe_tmp133;
  unsigned int llvm_cbe_tmp141;
  unsigned int llvm_cbe_tmp146333;
  unsigned int llvm_cbe_tmp146_rle;
  unsigned int llvm_cbe_tmp146_rle__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_2_reg2mem_0;
  unsigned int llvm_cbe_i_2_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val35;
  unsigned int llvm_cbe_val46;
  struct l_struct_2E_regobj **llvm_cbe_tmp161;
  struct l_struct_2E_regobj *llvm_cbe_tmp168;
  unsigned char *llvm_cbe_tmp169;
  unsigned char llvm_cbe_tmp170;
  unsigned char llvm_cbe_tmp191;
  unsigned int llvm_cbe_tmp218;
  unsigned int llvm_cbe_tmp223341;
  unsigned int llvm_cbe_tmp223_rle;
  unsigned int llvm_cbe_tmp223_rle__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0344;
  unsigned int llvm_cbe_x_0344__PHI_TEMPORARY;
  unsigned int llvm_cbe_val39;
  unsigned int llvm_cbe_val410;
  struct l_struct_2E_regobj **llvm_cbe_tmp240;
  unsigned int llvm_cbe_tmp243;
  struct l_struct_2E_regobj **llvm_cbe_tmp249;
  struct l_struct_2E_regobj *llvm_cbe_tmp253;
  unsigned char llvm_cbe_tmp261;
  unsigned char llvm_cbe_tmp267;
  unsigned int llvm_cbe_tmp298;
  unsigned int llvm_cbe_tmp302;
  unsigned int llvm_cbe_tmp309;
  unsigned int llvm_cbe_tmp313;
  unsigned int llvm_cbe_tmp313350;
  unsigned int llvm_cbe_y_0348;
  unsigned int llvm_cbe_y_0348__PHI_TEMPORARY;
  unsigned int llvm_cbe_val37;
  unsigned int llvm_cbe_val48;
  unsigned int llvm_cbe_tmp302346;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )14);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )14));
  llvm_cbe_tmp33324 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp33324) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_tmp146_rle__PHI_TEMPORARY = llvm_cbe_tmp33324;   /* for PHI node */
    goto llvm_cbe_bb142;
  }

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )54);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )54));
  llvm_cbe_tmp18 = *(&(regmng.field18.field0));
  llvm_cbe_tmp25 = *(&llvm_cbe_tmp18[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0)))]);
  *(&llvm_cbe_tmp25->field2) = ((unsigned char )0);
  llvm_cbe_tmp28 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp33 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp33) > ((signed int )llvm_cbe_tmp28))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp28;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_tmp146_rle__PHI_TEMPORARY = llvm_cbe_tmp33;   /* for PHI node */
    goto llvm_cbe_bb142;
  }

  } while (1); /* end of syntactic loop 'bb' */
  do {     /* Syntactic loop 'bb38' to make GCC happy */
llvm_cbe_bb38:
  llvm_cbe_i_1_reg2mem_0 = llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )55);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )55));
  llvm_cbe_tmp47 = *(&(regmng.field18.field0));
  llvm_cbe_tmp4849 = ((signed long long )(signed int )llvm_cbe_i_1_reg2mem_0);
  llvm_cbe_tmp54 = *(&llvm_cbe_tmp47[((signed long long )llvm_cbe_tmp4849)]);
  llvm_cbe_tmp56 = *(&llvm_cbe_tmp54->field4);
  if ((((signed int )llvm_cbe_tmp56) < ((signed int )llvm_cbe_critical))) {
    goto llvm_cbe_cond_true;
  } else {
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_next:
  llvm_cbe_tmp141 = llvm_cbe_i_1_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp146333 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_tmp146333) > ((signed int )llvm_cbe_tmp141))) {
    llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp141;   /* for PHI node */
    goto llvm_cbe_bb38;
  } else {
    llvm_cbe_tmp223_rle__PHI_TEMPORARY = llvm_cbe_tmp146333;   /* for PHI node */
    goto llvm_cbe_bb219;
  }

llvm_cbe_cond_true:
  *(&llvm_cbe_tmp54->field1) = ((unsigned char )0);
  llvm_cbe_tmp123355 = *(&(regmng.field18.field0));
  llvm_cbe_tmp130358 = *(&llvm_cbe_tmp123355[((signed long long )llvm_cbe_tmp4849)]);
  llvm_cbe_tmp133360 = *(&llvm_cbe_tmp130358->field9.field1);
  if ((((signed int )llvm_cbe_tmp133360) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_tmp88_rle__PHI_TEMPORARY = llvm_cbe_tmp123355;   /* for PHI node */
    llvm_cbe_i2_0353__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb79;
  } else {
    goto llvm_cbe_cond_next;
  }

  do {     /* Syntactic loop 'bb79' to make GCC happy */
llvm_cbe_bb79:
  llvm_cbe_tmp88_rle = llvm_cbe_tmp88_rle__PHI_TEMPORARY;
  llvm_cbe_i2_0353 = llvm_cbe_i2_0353__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )56);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )56));
  llvm_cbe_tmp95 = *(&llvm_cbe_tmp88_rle[((signed long long )llvm_cbe_tmp4849)]);
  llvm_cbe_tmp103 = *(&llvm_cbe_tmp95->field9.field0);
  llvm_cbe_tmp110 = *(&llvm_cbe_tmp103[((signed long long )(((signed long long )(signed int )llvm_cbe_i2_0353)))]);
  *(&llvm_cbe_tmp110->field2) = ((unsigned char )1);
  llvm_cbe_tmp113 = llvm_cbe_i2_0353 + ((unsigned int )1);
  llvm_cbe_tmp123 = *(&(regmng.field18.field0));
  llvm_cbe_tmp130 = *(&llvm_cbe_tmp123[((signed long long )llvm_cbe_tmp4849)]);
  llvm_cbe_tmp133 = *(&llvm_cbe_tmp130->field9.field1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )llvm_cbe_tmp133) > ((signed int )llvm_cbe_tmp113))) {
    llvm_cbe_tmp88_rle__PHI_TEMPORARY = llvm_cbe_tmp123;   /* for PHI node */
    llvm_cbe_i2_0353__PHI_TEMPORARY = llvm_cbe_tmp113;   /* for PHI node */
    goto llvm_cbe_bb79;
  } else {
    goto llvm_cbe_cond_next;
  }

  } while (1); /* end of syntactic loop 'bb79' */
  } while (1); /* end of syntactic loop 'bb38' */
llvm_cbe_bb142:
  llvm_cbe_tmp146_rle = llvm_cbe_tmp146_rle__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_tmp146_rle) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb38;
  } else {
    llvm_cbe_tmp223_rle__PHI_TEMPORARY = llvm_cbe_tmp146_rle;   /* for PHI node */
    goto llvm_cbe_bb219;
  }

  do {     /* Syntactic loop 'bb152' to make GCC happy */
llvm_cbe_bb152:
  llvm_cbe_i_2_reg2mem_0 = llvm_cbe_i_2_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val35 = *(&cg_caller_id_var);
  llvm_cbe_val46 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )57);
  CallEdgeProfiler(llvm_cbe_val35, llvm_cbe_val46, ((unsigned int )57));
  llvm_cbe_tmp161 = *(&(regmng.field18.field0));
  llvm_cbe_tmp168 = *(&llvm_cbe_tmp161[((signed long long )(((signed long long )(signed int )llvm_cbe_i_2_reg2mem_0)))]);
  llvm_cbe_tmp169 = &llvm_cbe_tmp168->field2;
  llvm_cbe_tmp170 = *llvm_cbe_tmp169;
  if ((llvm_cbe_tmp170 == ((unsigned char )0))) {
    goto llvm_cbe_cond_next216;
  } else {
    goto llvm_cbe_cond_true173;
  }

llvm_cbe_cond_next216:
  llvm_cbe_tmp218 = llvm_cbe_i_2_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp223341 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((((signed int )llvm_cbe_tmp223341) > ((signed int )llvm_cbe_tmp218))) {
    llvm_cbe_i_2_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp218;   /* for PHI node */
    goto llvm_cbe_bb152;
  } else {
    goto llvm_cbe_bb310_preheader;
  }

llvm_cbe_cond_true173:
  llvm_cbe_tmp191 = *(&llvm_cbe_tmp168->field1);
  if ((llvm_cbe_tmp191 == ((unsigned char )0))) {
    goto llvm_cbe_cond_true197;
  } else {
    goto llvm_cbe_cond_next216;
  }

llvm_cbe_cond_true197:
  *llvm_cbe_tmp169 = ((unsigned char )0);
  goto llvm_cbe_cond_next216;

  } while (1); /* end of syntactic loop 'bb152' */
llvm_cbe_bb219:
  llvm_cbe_tmp223_rle = llvm_cbe_tmp223_rle__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_tmp223_rle) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_2_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb152;
  } else {
    goto llvm_cbe_bb310_preheader;
  }

llvm_cbe_bb310_preheader:
  llvm_cbe_tmp313350 = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp313350) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb318;
  } else {
    llvm_cbe_y_0348__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb299_preheader;
  }

  do {     /* Syntactic loop 'bb299.preheader' to make GCC happy */
llvm_cbe_bb299_preheader:
  llvm_cbe_y_0348 = llvm_cbe_y_0348__PHI_TEMPORARY;
  llvm_cbe_val37 = *(&cg_caller_id_var);
  llvm_cbe_val48 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )58);
  CallEdgeProfiler(llvm_cbe_val37, llvm_cbe_val48, ((unsigned int )58));
  llvm_cbe_tmp302346 = *(&(regmng.field12));
  if ((((signed int )llvm_cbe_tmp302346) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb307;
  } else {
    llvm_cbe_x_0344__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb230;
  }

llvm_cbe_bb307:
  llvm_cbe_tmp309 = llvm_cbe_y_0348 + ((unsigned int )1);
  llvm_cbe_tmp313 = *(&(regmng.field13));
  *(&cg_caller_call_site_var) = llvm_cbe_val48;
  *(&cg_caller_id_var) = llvm_cbe_val37;
  if ((((signed int )llvm_cbe_tmp313) < ((signed int )llvm_cbe_tmp309))) {
    goto llvm_cbe_bb318;
  } else {
    llvm_cbe_y_0348__PHI_TEMPORARY = llvm_cbe_tmp309;   /* for PHI node */
    goto llvm_cbe_bb299_preheader;
  }

  do {     /* Syntactic loop 'bb230' to make GCC happy */
llvm_cbe_bb230:
  llvm_cbe_x_0344 = llvm_cbe_x_0344__PHI_TEMPORARY;
  llvm_cbe_val39 = *(&cg_caller_id_var);
  llvm_cbe_val410 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )59);
  CallEdgeProfiler(llvm_cbe_val39, llvm_cbe_val410, ((unsigned int )59));
  llvm_cbe_tmp240 = *(&(regmng.field6));
  llvm_cbe_tmp243 = *(&(regmng.field16));
  llvm_cbe_tmp249 = &llvm_cbe_tmp240[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp243 * llvm_cbe_y_0348) + llvm_cbe_x_0344))))];
  llvm_cbe_tmp253 = *llvm_cbe_tmp249;
  if ((llvm_cbe_tmp253 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_next296;
  } else {
    goto llvm_cbe_cond_true258;
  }

llvm_cbe_cond_next296:
  llvm_cbe_tmp298 = llvm_cbe_x_0344 + ((unsigned int )1);
  llvm_cbe_tmp302 = *(&(regmng.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )llvm_cbe_tmp302) < ((signed int )llvm_cbe_tmp298))) {
    goto llvm_cbe_bb307;
  } else {
    llvm_cbe_x_0344__PHI_TEMPORARY = llvm_cbe_tmp298;   /* for PHI node */
    goto llvm_cbe_bb230;
  }

llvm_cbe_cond_next264:
  llvm_cbe_tmp267 = *(&llvm_cbe_tmp253->field1);
  if ((llvm_cbe_tmp267 == ((unsigned char )0))) {
    goto llvm_cbe_bb272;
  } else {
    goto llvm_cbe_cond_next296;
  }

llvm_cbe_cond_true258:
  llvm_cbe_tmp261 = *(&llvm_cbe_tmp253->field2);
  if ((llvm_cbe_tmp261 == ((unsigned char )0))) {
    goto llvm_cbe_cond_next264;
  } else {
    goto llvm_cbe_bb272;
  }

llvm_cbe_bb272:
  *llvm_cbe_tmp249 = ((struct l_struct_2E_regobj *)/*NULL*/0);
  goto llvm_cbe_cond_next296;

  } while (1); /* end of syntactic loop 'bb230' */
  } while (1); /* end of syntactic loop 'bb299.preheader' */
llvm_cbe_bb318:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )14);
   /*tail*/ _ZN9regmngobj13deleteregionsEv();
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )14);
   /*tail*/ _ZN9regmngobj15redefineregionsEv();
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN9regmngobj19defineneighborhood1Ev(void) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp28389;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_regobj **llvm_cbe_tmp12;
  struct l_struct_2E_regobj *llvm_cbe_tmp19;
  unsigned int llvm_cbe_tmp23;
  unsigned int llvm_cbe_tmp28;
  unsigned int llvm_cbe_i_1_reg2mem_0;
  unsigned int llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  struct l_struct_2E_regobj **llvm_cbe_tmp42;
  struct l_struct_2E_regobj *llvm_cbe_tmp49;
  unsigned int llvm_cbe_tmp55;
  unsigned int llvm_cbe_tmp60395;
  unsigned int llvm_cbe_tmp60_rle;
  unsigned int llvm_cbe_tmp60_rle__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp349400;
  unsigned int llvm_cbe_indvar420;
  unsigned int llvm_cbe_indvar420__PHI_TEMPORARY;
  unsigned int llvm_cbe_val35;
  unsigned int llvm_cbe_val46;
  unsigned int llvm_cbe_x_0408;
  struct l_struct_2E_regobj **llvm_cbe_tmp77;
  unsigned int llvm_cbe_tmp80;
  struct l_struct_2E_regobj *llvm_cbe_tmp90;
  unsigned int llvm_cbe_tmp339405;
  unsigned int *llvm_cbe_tmp164;
  struct l_struct_2E_regobj ***llvm_cbe_tmp143;
  unsigned int *llvm_cbe_tmp182;
  unsigned int llvm_cbe_indvar423;
  unsigned int llvm_cbe_indvar423__PHI_TEMPORARY;
  unsigned int llvm_cbe_val37;
  unsigned int llvm_cbe_val48;
  unsigned int llvm_cbe_y1_0_reg2mem_0;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val39;
  unsigned int llvm_cbe_val410;
  unsigned int llvm_cbe_x1_0_reg2mem_0;
  struct l_struct_2E_regobj **llvm_cbe_tmp110;
  unsigned int llvm_cbe_tmp113;
  struct l_struct_2E_regobj *llvm_cbe_tmp123;
  unsigned int llvm_cbe_tmp165;
  struct l_struct_2E_regobj **llvm_cbe_tmp144;
  struct l_struct_2E_regobj *llvm_cbe_tmp151;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_i_2;
  unsigned int llvm_cbe_i_2__PHI_TEMPORARY;
  unsigned int llvm_cbe_val311;
  unsigned int llvm_cbe_val412;
  unsigned int llvm_cbe_tmp183;
  unsigned int llvm_cbe_tmp194;
  unsigned char *ltmp_48_2;
  struct l_struct_2E_regobj **ltmp_49_9;
  unsigned int llvm_cbe_tmp212;
  struct l_struct_2E_regobj **llvm_cbe_tmp217;
  unsigned char *ltmp_50_2;
  struct l_struct_2E_regobj **llvm_cbe_tmp224;
  struct l_struct_2E_regobj **llvm_cbe_tmp236;
  unsigned int llvm_cbe_tmp239;
  unsigned int llvm_cbe_tmp246;
  unsigned int *llvm_cbe_tmp255;
  unsigned int llvm_cbe_tmp256;
  unsigned int *llvm_cbe_tmp258;
  unsigned int llvm_cbe_tmp259;
  unsigned int llvm_cbe_tmp273;
  unsigned char *ltmp_51_2;
  struct l_struct_2E_regobj **ltmp_52_9;
  unsigned int llvm_cbe_tmp293;
  struct l_struct_2E_regobj ***llvm_cbe_tmp297;
  struct l_struct_2E_regobj **llvm_cbe_tmp298;
  unsigned char *ltmp_53_2;
  struct l_struct_2E_regobj **llvm_cbe_tmp305;
  struct l_struct_2E_regobj **llvm_cbe_tmp318;
  unsigned int llvm_cbe_tmp321;
  unsigned int llvm_cbe_tmp328;
  unsigned int llvm_cbe_indvar_next419;
  unsigned int llvm_cbe_indvar_next424;
  unsigned int llvm_cbe_tmp361;
  unsigned int llvm_cbe_tmp373;
  unsigned int llvm_cbe_tmp373415;
  unsigned int llvm_cbe_indvar425;
  unsigned int llvm_cbe_indvar425__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_y_0413;
  unsigned int llvm_cbe_tmp361410;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )15);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )15));
  llvm_cbe_tmp28389 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp28389) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_tmp60_rle__PHI_TEMPORARY = llvm_cbe_tmp28389;   /* for PHI node */
    goto llvm_cbe_bb56;
  }

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )60);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )60));
  llvm_cbe_tmp12 = *(&(regmng.field18.field0));
  llvm_cbe_tmp19 = *(&llvm_cbe_tmp12[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0)))]);
  *(&llvm_cbe_tmp19->field6) = llvm_cbe_i_0_reg2mem_0;
  llvm_cbe_tmp23 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp28 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp28) > ((signed int )llvm_cbe_tmp23))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp23;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_tmp60_rle__PHI_TEMPORARY = llvm_cbe_tmp28;   /* for PHI node */
    goto llvm_cbe_bb56;
  }

  } while (1); /* end of syntactic loop 'bb' */
  do {     /* Syntactic loop 'bb33' to make GCC happy */
llvm_cbe_bb33:
  llvm_cbe_i_1_reg2mem_0 = llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )61);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )61));
  llvm_cbe_tmp42 = *(&(regmng.field18.field0));
  llvm_cbe_tmp49 = *(&llvm_cbe_tmp42[((signed long long )(((signed long long )(signed int )llvm_cbe_i_1_reg2mem_0)))]);
  *(&llvm_cbe_tmp49->field9.field1) = ((unsigned int )0);
  llvm_cbe_tmp55 = llvm_cbe_i_1_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp60395 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_tmp60395) > ((signed int )llvm_cbe_tmp55))) {
    llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp55;   /* for PHI node */
    goto llvm_cbe_bb33;
  } else {
    goto llvm_cbe_bb370_preheader;
  }

  } while (1); /* end of syntactic loop 'bb33' */
llvm_cbe_bb56:
  llvm_cbe_tmp60_rle = llvm_cbe_tmp60_rle__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_tmp60_rle) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb33;
  } else {
    goto llvm_cbe_bb370_preheader;
  }

llvm_cbe_bb370_preheader:
  llvm_cbe_tmp373415 = *(&(regmng.field13));
  if ((((signed int )(llvm_cbe_tmp373415 + ((unsigned int )-1))) < ((signed int )((unsigned int )1)))) {
    goto llvm_cbe_return;
  } else {
    llvm_cbe_indvar425__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb358_preheader;
  }

  do {     /* Syntactic loop 'bb358.preheader' to make GCC happy */
llvm_cbe_bb358_preheader:
  llvm_cbe_indvar425 = llvm_cbe_indvar425__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )62);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )62));
  llvm_cbe_y_0413 = llvm_cbe_indvar425 + ((unsigned int )1);
  llvm_cbe_tmp361410 = *(&(regmng.field12));
  if ((((signed int )(llvm_cbe_tmp361410 + ((unsigned int )-1))) < ((signed int )((unsigned int )1)))) {
    goto llvm_cbe_bb367;
  } else {
    goto llvm_cbe_bb_nph;
  }

llvm_cbe_bb367:
  llvm_cbe_tmp373 = *(&(regmng.field13));
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )(llvm_cbe_tmp373 + ((unsigned int )-1))) < ((signed int )(llvm_cbe_indvar425 + ((unsigned int )2))))) {
    goto llvm_cbe_return;
  } else {
    llvm_cbe_indvar425__PHI_TEMPORARY = llvm_cbe_y_0413;   /* for PHI node */
    goto llvm_cbe_bb358_preheader;
  }

  do {     /* Syntactic loop 'bb67' to make GCC happy */
llvm_cbe_bb67:
  llvm_cbe_indvar420 = llvm_cbe_indvar420__PHI_TEMPORARY;
  llvm_cbe_val35 = *(&cg_caller_id_var);
  llvm_cbe_val46 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )63);
  CallEdgeProfiler(llvm_cbe_val35, llvm_cbe_val46, ((unsigned int )63));
  llvm_cbe_x_0408 = llvm_cbe_indvar420 + ((unsigned int )1);
  llvm_cbe_tmp77 = *(&(regmng.field6));
  llvm_cbe_tmp80 = *(&(regmng.field16));
  llvm_cbe_tmp90 = *(&llvm_cbe_tmp77[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp80 * llvm_cbe_y_0413) + llvm_cbe_x_0408))))]);
  if (((llvm_cbe_tmp90 == ((struct l_struct_2E_regobj *)/*NULL*/0)) | (((signed int )llvm_cbe_tmp349400) < ((signed int )llvm_cbe_indvar425)))) {
    goto llvm_cbe_bb355;
  } else {
    goto llvm_cbe_bb97_preheader;
  }

llvm_cbe_bb355:
  llvm_cbe_tmp361 = *(&(regmng.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((((signed int )(llvm_cbe_tmp361 + ((unsigned int )-1))) < ((signed int )(llvm_cbe_indvar420 + ((unsigned int )2))))) {
    goto llvm_cbe_bb367;
  } else {
    llvm_cbe_indvar420__PHI_TEMPORARY = llvm_cbe_x_0408;   /* for PHI node */
    goto llvm_cbe_bb67;
  }

llvm_cbe_bb97_preheader:
  llvm_cbe_tmp339405 = llvm_cbe_indvar420 + ((unsigned int )2);
  llvm_cbe_tmp164 = &llvm_cbe_tmp90->field9.field1;
  llvm_cbe_tmp143 = &llvm_cbe_tmp90->field9.field0;
  llvm_cbe_tmp182 = &llvm_cbe_tmp90->field9.field2;
  if ((((signed int )llvm_cbe_tmp339405) < ((signed int )llvm_cbe_indvar420))) {
    goto llvm_cbe_bb355;
  } else {
    llvm_cbe_indvar423__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb97;
  }

  do {     /* Syntactic loop 'bb97' to make GCC happy */
llvm_cbe_bb97:
  llvm_cbe_indvar423 = llvm_cbe_indvar423__PHI_TEMPORARY;
  llvm_cbe_val37 = *(&cg_caller_id_var);
  llvm_cbe_val48 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )64);
  CallEdgeProfiler(llvm_cbe_val37, llvm_cbe_val48, ((unsigned int )64));
  llvm_cbe_y1_0_reg2mem_0 = llvm_cbe_indvar423 + llvm_cbe_indvar425;
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb100;

llvm_cbe_bb347:
  llvm_cbe_indvar_next424 = llvm_cbe_indvar423 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val48;
  *(&cg_caller_id_var) = llvm_cbe_val37;
  if ((((signed int )llvm_cbe_tmp349400) < ((signed int )(llvm_cbe_y1_0_reg2mem_0 + ((unsigned int )1))))) {
    goto llvm_cbe_bb355;
  } else {
    llvm_cbe_indvar423__PHI_TEMPORARY = llvm_cbe_indvar_next424;   /* for PHI node */
    goto llvm_cbe_bb97;
  }

  do {     /* Syntactic loop 'bb100' to make GCC happy */
llvm_cbe_bb100:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val39 = *(&cg_caller_id_var);
  llvm_cbe_val410 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )65);
  CallEdgeProfiler(llvm_cbe_val39, llvm_cbe_val410, ((unsigned int )65));
  llvm_cbe_x1_0_reg2mem_0 = llvm_cbe_indvar + llvm_cbe_indvar420;
  llvm_cbe_tmp110 = *(&(regmng.field6));
  llvm_cbe_tmp113 = *(&(regmng.field16));
  llvm_cbe_tmp123 = *(&llvm_cbe_tmp110[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp113 * llvm_cbe_y1_0_reg2mem_0) + llvm_cbe_x1_0_reg2mem_0))))]);
  if (((llvm_cbe_tmp123 == ((struct l_struct_2E_regobj *)/*NULL*/0)) | (llvm_cbe_tmp90 == llvm_cbe_tmp123))) {
    goto llvm_cbe_bb337;
  } else {
    goto llvm_cbe_bb161_preheader;
  }

llvm_cbe_bb337:
  llvm_cbe_indvar_next419 = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )llvm_cbe_tmp339405) < ((signed int )(llvm_cbe_x1_0_reg2mem_0 + ((unsigned int )1))))) {
    goto llvm_cbe_bb347;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next419;   /* for PHI node */
    goto llvm_cbe_bb100;
  }

  do {     /* Syntactic loop 'bb161' to make GCC happy */
llvm_cbe_bb161:
  llvm_cbe_i_2 = llvm_cbe_i_2__PHI_TEMPORARY;
  llvm_cbe_val311 = *(&cg_caller_id_var);
  llvm_cbe_val412 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )66);
  CallEdgeProfiler(llvm_cbe_val311, llvm_cbe_val412, ((unsigned int )66));
  *(&cg_caller_call_site_var) = llvm_cbe_val412;
  *(&cg_caller_id_var) = llvm_cbe_val311;
  if ((((signed int )llvm_cbe_tmp165) > ((signed int )llvm_cbe_i_2))) {
    goto llvm_cbe_bb135;
  } else {
    goto llvm_cbe_cond_next174_critedge;
  }

llvm_cbe_cond_next158:
  llvm_cbe_indvar_next = llvm_cbe_i_2 + ((unsigned int )1);
  llvm_cbe_i_2__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
  goto llvm_cbe_bb161;

llvm_cbe_bb135:
  llvm_cbe_tmp144 = *llvm_cbe_tmp143;
  llvm_cbe_tmp151 = *(&llvm_cbe_tmp144[((signed long long )(((signed long long )(signed int )llvm_cbe_i_2)))]);
  *(&cg_caller_call_site_var) = llvm_cbe_val412;
  *(&cg_caller_id_var) = llvm_cbe_val311;
  if ((llvm_cbe_tmp151 == llvm_cbe_tmp123)) {
    goto llvm_cbe_bb337;
  } else {
    goto llvm_cbe_cond_next158;
  }

  } while (1); /* end of syntactic loop 'bb161' */
llvm_cbe_bb161_preheader:
  llvm_cbe_tmp165 = *llvm_cbe_tmp164;
  llvm_cbe_i_2__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb161;

llvm_cbe_cond_next315:
  llvm_cbe_tmp318 = *(&llvm_cbe_tmp123->field9.field0);
  llvm_cbe_tmp321 = *llvm_cbe_tmp255;
  *(&llvm_cbe_tmp318[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp321)))]) = llvm_cbe_tmp90;
  llvm_cbe_tmp328 = *llvm_cbe_tmp255;
  *llvm_cbe_tmp255 = (llvm_cbe_tmp328 + ((unsigned int )1));
  goto llvm_cbe_bb337;

llvm_cbe_cond_next233:
  llvm_cbe_tmp236 = *llvm_cbe_tmp143;
  llvm_cbe_tmp239 = *llvm_cbe_tmp164;
  *(&llvm_cbe_tmp236[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp239)))]) = llvm_cbe_tmp123;
  llvm_cbe_tmp246 = *llvm_cbe_tmp164;
  *llvm_cbe_tmp164 = (llvm_cbe_tmp246 + ((unsigned int )1));
  llvm_cbe_tmp255 = &llvm_cbe_tmp123->field9.field1;
  llvm_cbe_tmp256 = *llvm_cbe_tmp255;
  llvm_cbe_tmp258 = &llvm_cbe_tmp123->field9.field2;
  llvm_cbe_tmp259 = *llvm_cbe_tmp258;
  if ((llvm_cbe_tmp256 == llvm_cbe_tmp259)) {
    goto llvm_cbe_cond_true263;
  } else {
    goto llvm_cbe_cond_next315;
  }

llvm_cbe_cond_next174_critedge:
  llvm_cbe_tmp183 = *llvm_cbe_tmp182;
  if ((llvm_cbe_tmp165 == llvm_cbe_tmp183)) {
    goto llvm_cbe_cond_true187;
  } else {
    goto llvm_cbe_cond_next233;
  }

llvm_cbe_cond_true187:
  llvm_cbe_tmp194 = llvm_cbe_tmp183 << ((unsigned int )1);
  ltmp_48_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp194)) * ((unsigned long long )8ll)));
  ltmp_49_9 = ((struct l_struct_2E_regobj **)ltmp_48_2);
  llvm_cbe_tmp212 = *llvm_cbe_tmp182;
  llvm_cbe_tmp217 = *llvm_cbe_tmp143;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )65);
  ltmp_50_2 = memcpy((((unsigned char *)ltmp_49_9)), (((unsigned char *)llvm_cbe_tmp217)), ((((signed long long )(signed int )llvm_cbe_tmp212)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp224 = *llvm_cbe_tmp143;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp224)));
  *llvm_cbe_tmp143 = ltmp_49_9;
  *llvm_cbe_tmp182 = llvm_cbe_tmp194;
  goto llvm_cbe_cond_next233;

llvm_cbe_cond_true263:
  llvm_cbe_tmp273 = llvm_cbe_tmp259 << ((unsigned int )1);
  ltmp_51_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp273)) * ((unsigned long long )8ll)));
  ltmp_52_9 = ((struct l_struct_2E_regobj **)ltmp_51_2);
  llvm_cbe_tmp293 = *llvm_cbe_tmp258;
  llvm_cbe_tmp297 = &llvm_cbe_tmp123->field9.field0;
  llvm_cbe_tmp298 = *llvm_cbe_tmp297;
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )65);
  ltmp_53_2 = memcpy((((unsigned char *)ltmp_52_9)), (((unsigned char *)llvm_cbe_tmp298)), ((((signed long long )(signed int )llvm_cbe_tmp293)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp305 = *llvm_cbe_tmp297;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp305)));
  *llvm_cbe_tmp297 = ltmp_52_9;
  *llvm_cbe_tmp258 = llvm_cbe_tmp273;
  goto llvm_cbe_cond_next315;

  } while (1); /* end of syntactic loop 'bb100' */
  } while (1); /* end of syntactic loop 'bb97' */
  } while (1); /* end of syntactic loop 'bb67' */
llvm_cbe_bb_nph:
  llvm_cbe_tmp349400 = llvm_cbe_indvar425 + ((unsigned int )2);
  llvm_cbe_indvar420__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb67;

  } while (1); /* end of syntactic loop 'bb358.preheader' */
llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN15largesolidarrayIP6regobjE8doublingEv(void) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp2;
  unsigned int llvm_cbe_tmp3;
  unsigned char *ltmp_54_2;
  struct l_struct_2E_regobj **ltmp_55_9;
  struct l_struct_2E_regobj **llvm_cbe_tmp16;
  unsigned char *ltmp_56_2;
  struct l_struct_2E_regobj **llvm_cbe_tmp22;
  unsigned int llvm_cbe_tmp34;
  unsigned int llvm_cbe_tmp35;
  unsigned char *ltmp_57_2;
  unsigned int *ltmp_58_7;
  unsigned int *llvm_cbe_tmp56;
  unsigned char *ltmp_59_2;
  unsigned int *llvm_cbe_tmp62;
  unsigned int llvm_cbe_tmp81;
  unsigned int llvm_cbe_tmp82;
  unsigned char *ltmp_60_2;
  unsigned int *ltmp_61_7;
  unsigned int *llvm_cbe_tmp107;
  unsigned char *ltmp_62_2;
  unsigned int *llvm_cbe_tmp114;
  unsigned int llvm_cbe_tmp126;
  unsigned int llvm_cbe_tmp225;
  unsigned int llvm_cbe_tmp228;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_tmp134;
  unsigned int llvm_cbe_tmp137;
  unsigned int llvm_cbe_tmp149;
  unsigned char *ltmp_63_2;
  unsigned int *ltmp_64_7;
  unsigned int *llvm_cbe_tmp162;
  unsigned char *ltmp_65_2;
  unsigned int *llvm_cbe_tmp168;
  unsigned int *llvm_cbe_tmp179;
  unsigned int llvm_cbe_tmp182;
  unsigned int llvm_cbe_tmp188;
  unsigned int llvm_cbe_indvar_next;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )16);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )16));
  llvm_cbe_tmp2 = *(&(regmng.field18.field5));
  llvm_cbe_tmp3 = llvm_cbe_tmp2 << ((unsigned int )1);
  ltmp_54_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp3)) * ((unsigned long long )8ll)));
  ltmp_55_9 = ((struct l_struct_2E_regobj **)ltmp_54_2);
  llvm_cbe_tmp16 = *(&(regmng.field18.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )16);
  ltmp_56_2 = memcpy((((unsigned char *)ltmp_55_9)), (((unsigned char *)llvm_cbe_tmp16)), ((((signed long long )(signed int )llvm_cbe_tmp2)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp22 = *(&(regmng.field18.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp22)));
  *(&(regmng.field18.field0)) = ltmp_55_9;
  llvm_cbe_tmp34 = *(&(regmng.field18.field2.field2));
  llvm_cbe_tmp35 = llvm_cbe_tmp34 << ((unsigned int )1);
  ltmp_57_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp35)) * ((unsigned long long )4ll)));
  ltmp_58_7 = ((unsigned int *)ltmp_57_2);
  llvm_cbe_tmp56 = *(&(regmng.field18.field2.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )16);
  ltmp_59_2 = memcpy((((unsigned char *)ltmp_58_7)), (((unsigned char *)llvm_cbe_tmp56)), ((((signed long long )(signed int )llvm_cbe_tmp34)) << ((unsigned long long )2ll)));
  llvm_cbe_tmp62 = *(&(regmng.field18.field2.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp62)));
  *(&(regmng.field18.field2.field0)) = ltmp_58_7;
  *(&(regmng.field18.field2.field2)) = llvm_cbe_tmp35;
  llvm_cbe_tmp81 = *(&(regmng.field18.field3.field2));
  llvm_cbe_tmp82 = llvm_cbe_tmp81 << ((unsigned int )1);
  ltmp_60_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp82)) * ((unsigned long long )4ll)));
  ltmp_61_7 = ((unsigned int *)ltmp_60_2);
  llvm_cbe_tmp107 = *(&(regmng.field18.field3.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )16);
  ltmp_62_2 = memcpy((((unsigned char *)ltmp_61_7)), (((unsigned char *)llvm_cbe_tmp107)), ((((signed long long )(signed int )llvm_cbe_tmp81)) << ((unsigned long long )2ll)));
  llvm_cbe_tmp114 = *(&(regmng.field18.field3.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp114)));
  *(&(regmng.field18.field3.field0)) = ltmp_61_7;
  *(&(regmng.field18.field3.field2)) = llvm_cbe_tmp82;
  llvm_cbe_tmp126 = *(&(regmng.field18.field5));
  if ((((signed int )llvm_cbe_tmp126) < ((signed int )llvm_cbe_tmp3))) {
    goto llvm_cbe_bb127_preheader;
  } else {
    goto llvm_cbe_bb200;
  }

llvm_cbe_bb127_preheader:
  llvm_cbe_tmp225 = llvm_cbe_tmp3 - llvm_cbe_tmp126;
  llvm_cbe_tmp228 = (((((signed int )(llvm_cbe_tmp225 + ((unsigned int )-1))) < ((signed int )((unsigned int )0)))) ? (((unsigned int )1)) : (llvm_cbe_tmp225));
  llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb127;

  do {     /* Syntactic loop 'bb127' to make GCC happy */
llvm_cbe_bb127:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )67);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )67));
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_indvar + llvm_cbe_tmp126;
  llvm_cbe_tmp134 = *(&(regmng.field18.field1.field1));
  llvm_cbe_tmp137 = *(&(regmng.field18.field1.field2));
  if ((llvm_cbe_tmp134 == llvm_cbe_tmp137)) {
    goto llvm_cbe_cond_true141;
  } else {
    goto llvm_cbe_cond_next176;
  }

llvm_cbe_cond_next176:
  llvm_cbe_tmp179 = *(&(regmng.field18.field1.field0));
  llvm_cbe_tmp182 = *(&(regmng.field18.field1.field1));
  *(&llvm_cbe_tmp179[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp182)))]) = llvm_cbe_i_0_reg2mem_0;
  llvm_cbe_tmp188 = *(&(regmng.field18.field1.field1));
  *(&(regmng.field18.field1.field1)) = (llvm_cbe_tmp188 + ((unsigned int )1));
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next == llvm_cbe_tmp228)) {
    goto llvm_cbe_bb200;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb127;
  }

llvm_cbe_cond_true141:
  llvm_cbe_tmp149 = llvm_cbe_tmp137 << ((unsigned int )1);
  ltmp_63_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp149)) * ((unsigned long long )4ll)));
  ltmp_64_7 = ((unsigned int *)ltmp_63_2);
  llvm_cbe_tmp162 = *(&(regmng.field18.field1.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )67);
  ltmp_65_2 = memcpy((((unsigned char *)ltmp_64_7)), (((unsigned char *)llvm_cbe_tmp162)), ((((signed long long )(signed int )llvm_cbe_tmp137)) << ((unsigned long long )2ll)));
  llvm_cbe_tmp168 = *(&(regmng.field18.field1.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp168)));
  *(&(regmng.field18.field1.field0)) = ltmp_64_7;
  *(&(regmng.field18.field1.field2)) = llvm_cbe_tmp149;
  goto llvm_cbe_cond_next176;

  } while (1); /* end of syntactic loop 'bb127' */
llvm_cbe_bb200:
  *(&(regmng.field18.field5)) = llvm_cbe_tmp3;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN6regobj6createEii(struct l_struct_2E_regobj *llvm_cbe_this, unsigned int llvm_cbe_x0, unsigned int llvm_cbe_y0) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int *llvm_cbe_tmp3;
  unsigned int *llvm_cbe_tmp7;
  unsigned int *llvm_cbe_tmp10;
  unsigned char *ltmp_66_2;
  unsigned char *ltmp_67_2;
  unsigned char *ltmp_68_2;
  unsigned int llvm_cbe_tmp78;
  unsigned int llvm_cbe_tmp80;
  unsigned int llvm_cbe_tmp82;
  unsigned int llvm_cbe_tmp84;
  unsigned int llvm_cbe_x1_0;
  unsigned int llvm_cbe_y1_0;
  struct l_struct_2E_regmngobj **llvm_cbe_tmp95;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp96;
  unsigned int llvm_cbe_tmp98;
  unsigned int llvm_cbe_x2_0;
  unsigned int llvm_cbe_tmp114;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp132;
  struct l_struct_2E_regobj **llvm_cbe_tmp141;
  unsigned int llvm_cbe_tmp144;
  unsigned long long llvm_cbe_tmp148149;
  struct l_struct_2E_regobj *llvm_cbe_tmp154;
  unsigned char *llvm_cbe_tmp20_i;
  unsigned char llvm_cbe_tmp30_i;
  unsigned char llvm_cbe_tmp39_i;
  unsigned int llvm_cbe_tmp44_i;
  unsigned int llvm_cbe_tmp46_i;
  unsigned int llvm_cbe_tmp57_i;
  unsigned int llvm_cbe_tmp59_i;
  unsigned int llvm_cbe_tmp82_i;
  unsigned int llvm_cbe_tmp100_i;
  unsigned int llvm_cbe_tmp103_i;
  unsigned int llvm_cbe_tmp114_i;
  unsigned char *ltmp_69_2;
  struct l_struct_2E_pointt *ltmp_70_5;
  struct l_struct_2E_pointt *llvm_cbe_tmp137_i;
  unsigned char *ltmp_71_2;
  struct l_struct_2E_pointt *llvm_cbe_tmp143_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp155_i;
  unsigned int llvm_cbe_tmp158_i;
  unsigned long long llvm_cbe_tmp158166_i;
  unsigned int llvm_cbe_tmp176_i;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp182_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp191_i;
  unsigned int llvm_cbe_tmp194_i;
  unsigned int llvm_cbe_tmp207_i;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_tmp165;
  unsigned int llvm_cbe_x_0;
  unsigned int llvm_cbe_x_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_tmp174;
  unsigned int llvm_cbe_y2_0;
  unsigned int llvm_cbe_y2_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0;
  unsigned int llvm_cbe_y_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp183;
  unsigned char *llvm_cbe_tmp190;
  struct l_struct_2E_pointt *llvm_cbe_tmp194;
  struct l_struct_2E_pointt *llvm_cbe_tmp198;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_storemerge263;
  unsigned int llvm_cbe_storemerge;
  struct l_struct_2E_pointt *llvm_cbe_tmp226;
  struct l_struct_2E_pointt *llvm_cbe_tmp231;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )17);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )17));
  llvm_cbe_tmp3 = &llvm_cbe_this->field5.field0;
  *llvm_cbe_tmp3 = llvm_cbe_x0;
  llvm_cbe_tmp7 = &llvm_cbe_this->field5.field1;
  *llvm_cbe_tmp7 = llvm_cbe_y0;
  llvm_cbe_tmp10 = &llvm_cbe_this->field4;
  *llvm_cbe_tmp10 = ((unsigned int )0);
  *(&(_ZN6regobj9bound1arpE.field2)) = ((unsigned int )128);
  *(&(_ZN6regobj9bound1arpE.field1)) = ((unsigned int )0);
  ltmp_66_2 =  /*tail*/ malloc(((unsigned long long )1024ll));
  *(&(_ZN6regobj9bound1arpE.field0)) = (&(((struct l_struct_2E_pointt (*)[128])ltmp_66_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  *(&(_ZN6regobj9bound2arpE.field2)) = ((unsigned int )128);
  *(&(_ZN6regobj9bound2arpE.field1)) = ((unsigned int )0);
  ltmp_67_2 =  /*tail*/ malloc(((unsigned long long )1024ll));
  *(&(_ZN6regobj9bound2arpE.field0)) = (&(((struct l_struct_2E_pointt (*)[128])ltmp_67_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  *(&llvm_cbe_this->field9.field2) = ((unsigned int )4);
  *(&llvm_cbe_this->field9.field1) = ((unsigned int )0);
  ltmp_68_2 =  /*tail*/ malloc(((unsigned long long )32ll));
  *(&llvm_cbe_this->field9.field0) = (&(((struct l_struct_2E_regobj *(*)[4])ltmp_68_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  llvm_cbe_tmp78 = llvm_cbe_x0 + ((unsigned int )-1);
  llvm_cbe_tmp80 = llvm_cbe_y0 + ((unsigned int )-1);
  llvm_cbe_tmp82 = llvm_cbe_x0 + ((unsigned int )1);
  llvm_cbe_tmp84 = llvm_cbe_y0 + ((unsigned int )1);
  llvm_cbe_x1_0 = (((((signed int )llvm_cbe_tmp78) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp78));
  llvm_cbe_y1_0 = (((((signed int )llvm_cbe_tmp80) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp80));
  llvm_cbe_tmp95 = &llvm_cbe_this->field3;
  llvm_cbe_tmp96 = *llvm_cbe_tmp95;
  llvm_cbe_tmp98 = *(&llvm_cbe_tmp96->field12);
  llvm_cbe_x2_0 = (((((signed int )llvm_cbe_tmp98) < ((signed int )llvm_cbe_tmp82))) ? (llvm_cbe_tmp98) : (llvm_cbe_tmp82));
  llvm_cbe_tmp114 = *(&llvm_cbe_tmp96->field13);
  if ((((signed int )llvm_cbe_tmp114) < ((signed int )llvm_cbe_tmp84))) {
    goto llvm_cbe_cond_true119;
  } else {
    llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_tmp84;   /* for PHI node */
    llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb175;
  }

llvm_cbe_cond_true119:
  if ((((signed int )llvm_cbe_y1_0) > ((signed int )llvm_cbe_tmp114))) {
    goto llvm_cbe_bb181;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp114;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb166_preheader;
  }

llvm_cbe_bb166_preheader:
  llvm_cbe_y2_0_reg2mem_0_ph = llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_y_0_reg2mem_0_ph = llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_x_0__PHI_TEMPORARY = llvm_cbe_x1_0;   /* for PHI node */
  goto llvm_cbe_bb166;

  do {     /* Syntactic loop 'bb166' to make GCC happy */
llvm_cbe_bb166:
  llvm_cbe_x_0 = llvm_cbe_x_0__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )69);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )69));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_x_0) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb172;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb129;
  }

llvm_cbe_cond_next163:
  llvm_cbe_tmp165 = llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_x_0__PHI_TEMPORARY = llvm_cbe_tmp165;   /* for PHI node */
  goto llvm_cbe_bb166;

  do {     /* Syntactic loop 'bb129' to make GCC happy */
llvm_cbe_bb129:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )70);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )70));
  llvm_cbe_x_0_reg2mem_0 = llvm_cbe_indvar + llvm_cbe_x_0;
  llvm_cbe_tmp132 = *llvm_cbe_tmp95;
  llvm_cbe_tmp141 = *(&llvm_cbe_tmp132->field6);
  llvm_cbe_tmp144 = *(&llvm_cbe_tmp132->field16);
  llvm_cbe_tmp148149 = ((signed long long )(signed int )((llvm_cbe_tmp144 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0_reg2mem_0));
  llvm_cbe_tmp154 = *(&llvm_cbe_tmp141[((signed long long )llvm_cbe_tmp148149)]);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_tmp154 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true159;
  } else {
    goto llvm_cbe_cond_next163;
  }

llvm_cbe_cond_next152_i:
  llvm_cbe_tmp155_i = *(&(_ZN6regobj9bound1arpE.field0));
  llvm_cbe_tmp158_i = *(&(_ZN6regobj9bound1arpE.field1));
  llvm_cbe_tmp158166_i = ((signed long long )(signed int )llvm_cbe_tmp158_i);
  *(&llvm_cbe_tmp155_i[((signed long long )llvm_cbe_tmp158166_i)].field0) = llvm_cbe_x_0_reg2mem_0;
  *(&llvm_cbe_tmp155_i[((signed long long )llvm_cbe_tmp158166_i)].field1) = llvm_cbe_y_0_reg2mem_0_ph;
  llvm_cbe_tmp176_i = *(&(_ZN6regobj9bound1arpE.field1));
  *(&(_ZN6regobj9bound1arpE.field1)) = (llvm_cbe_tmp176_i + ((unsigned int )1));
  llvm_cbe_tmp182_i = *llvm_cbe_tmp95;
  llvm_cbe_tmp191_i = *(&llvm_cbe_tmp182_i->field6);
  llvm_cbe_tmp194_i = *(&llvm_cbe_tmp182_i->field16);
  *(&llvm_cbe_tmp191_i[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp194_i * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0_reg2mem_0))))]) = llvm_cbe_this;
  llvm_cbe_tmp207_i = *llvm_cbe_tmp10;
  *llvm_cbe_tmp10 = (llvm_cbe_tmp207_i + ((unsigned int )1));
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )(llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb172;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb129;
  }

llvm_cbe_cond_true88_i:
  llvm_cbe_tmp100_i = *(&(_ZN6regobj9bound1arpE.field1));
  llvm_cbe_tmp103_i = *(&(_ZN6regobj9bound1arpE.field2));
  if ((llvm_cbe_tmp100_i == llvm_cbe_tmp103_i)) {
    goto llvm_cbe_cond_true107_i;
  } else {
    goto llvm_cbe_cond_next152_i;
  }

llvm_cbe_cond_true_i:
  llvm_cbe_tmp44_i = *llvm_cbe_tmp3;
  llvm_cbe_tmp46_i = llvm_cbe_x_0_reg2mem_0 - llvm_cbe_tmp44_i;
  llvm_cbe_tmp57_i = *llvm_cbe_tmp7;
  llvm_cbe_tmp59_i = llvm_cbe_y_0_reg2mem_0_ph - llvm_cbe_tmp57_i;
  llvm_cbe_tmp82_i = *(&llvm_cbe_tmp132->field10);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )(((signed int )(((float )((((float )(signed int )((llvm_cbe_tmp59_i * llvm_cbe_tmp59_i) + (llvm_cbe_tmp46_i * llvm_cbe_tmp46_i)))) + 0x1p-1)))))) > ((signed int )llvm_cbe_tmp82_i))) {
    goto llvm_cbe_cond_next163;
  } else {
    goto llvm_cbe_cond_true88_i;
  }

llvm_cbe_cond_true159:
  llvm_cbe_tmp20_i = *(&llvm_cbe_tmp132->field7);
  llvm_cbe_tmp30_i = *(&llvm_cbe_tmp20_i[((signed long long )llvm_cbe_tmp148149)]);
  llvm_cbe_tmp39_i = *(&llvm_cbe_tmp132->field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp30_i)))]);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_tmp39_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_next163;
  } else {
    goto llvm_cbe_cond_true_i;
  }

llvm_cbe_cond_true107_i:
  llvm_cbe_tmp114_i = llvm_cbe_tmp103_i << ((unsigned int )1);
  ltmp_69_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp114_i)) * ((unsigned long long )8ll)));
  ltmp_70_5 = ((struct l_struct_2E_pointt *)ltmp_69_2);
  llvm_cbe_tmp137_i = *(&(_ZN6regobj9bound1arpE.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )70);
  ltmp_71_2 = memcpy((((unsigned char *)ltmp_70_5)), (((unsigned char *)llvm_cbe_tmp137_i)), ((((signed long long )(signed int )llvm_cbe_tmp103_i)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp143_i = *(&(_ZN6regobj9bound1arpE.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp143_i)));
  *(&(_ZN6regobj9bound1arpE.field0)) = ltmp_70_5;
  *(&(_ZN6regobj9bound1arpE.field2)) = llvm_cbe_tmp114_i;
  goto llvm_cbe_cond_next152_i;

  } while (1); /* end of syntactic loop 'bb129' */
  } while (1); /* end of syntactic loop 'bb166' */
llvm_cbe_bb172:
  llvm_cbe_tmp174 = llvm_cbe_y_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_y2_0_reg2mem_0_ph;   /* for PHI node */
  llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_tmp174;   /* for PHI node */
  goto llvm_cbe_bb175;

llvm_cbe_bb175:
  llvm_cbe_y2_0 = llvm_cbe_y2_0__PHI_TEMPORARY;
  llvm_cbe_y_0 = llvm_cbe_y_0__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_y_0) > ((signed int )llvm_cbe_y2_0))) {
    goto llvm_cbe_bb181;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y2_0;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y_0;   /* for PHI node */
    goto llvm_cbe_bb166_preheader;
  }

llvm_cbe_bb181:
  llvm_cbe_tmp183 = *(&(_ZN6regobj9bound1arpE.field1));
  llvm_cbe_tmp190 = &llvm_cbe_this->field1;
  if ((llvm_cbe_tmp183 == ((unsigned int )0))) {
    goto llvm_cbe_cond_false;
  } else {
    goto llvm_cbe_cond_true188;
  }

llvm_cbe_cond_true188:
  *llvm_cbe_tmp190 = ((unsigned char )1);
  goto llvm_cbe_cond_true209;

llvm_cbe_cond_false:
  *llvm_cbe_tmp190 = ((unsigned char )0);
  llvm_cbe_tmp194 = *(&(_ZN6regobj9bound1arpE.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp194)));
  llvm_cbe_tmp198 = *(&(_ZN6regobj9bound2arpE.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp198)));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
  do {     /* Syntactic loop 'cond_true209' to make GCC happy */
llvm_cbe_cond_true209:
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )68);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )68));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )68);
   /*tail*/ _ZN6regobj10makebound2ER9flexarrayI6pointtES3_(llvm_cbe_this, (&_ZN6regobj9bound1arpE), (&_ZN6regobj9bound2arpE));
  llvm_cbe_storemerge263 = *(&(_ZN6regobj9bound2arpE.field1));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_storemerge263 == ((unsigned int )0))) {
    goto llvm_cbe_bb224;
  } else {
    goto llvm_cbe_cond_false213_critedge;
  }

llvm_cbe_cond_false213_critedge:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )68);
   /*tail*/ _ZN6regobj10makebound2ER9flexarrayI6pointtES3_(llvm_cbe_this, (&_ZN6regobj9bound2arpE), (&_ZN6regobj9bound1arpE));
  llvm_cbe_storemerge = *(&(_ZN6regobj9bound1arpE.field1));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_storemerge == ((unsigned int )0))) {
    goto llvm_cbe_bb224;
  } else {
    goto llvm_cbe_cond_true209;
  }

  } while (1); /* end of syntactic loop 'cond_true209' */
llvm_cbe_bb224:
  llvm_cbe_tmp226 = *(&(_ZN6regobj9bound1arpE.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp226)));
  llvm_cbe_tmp231 = *(&(_ZN6regobj9bound2arpE.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp231)));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN9regmngobj13createregionsEi(unsigned int llvm_cbe_regionl) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_x_i;    /* Address-exposed local */
  unsigned int llvm_cbe_y_i;    /* Address-exposed local */
  unsigned int llvm_cbe_x413;    /* Address-exposed local */
  unsigned int llvm_cbe_y414;    /* Address-exposed local */
  unsigned int llvm_cbe_x785;    /* Address-exposed local */
  unsigned int llvm_cbe_y786;    /* Address-exposed local */
  unsigned int llvm_cbe_tmp10;
  unsigned int llvm_cbe_tmp13;
  struct l_struct_2E_regobj **llvm_cbe_tmp19;
  unsigned char *ltmp_72_2;
  unsigned int llvm_cbe_regionl_addr_0;
  unsigned int llvm_cbe_tmp26;
  unsigned int llvm_cbe_tmp27;
  float llvm_cbe_tmp40;
  unsigned int llvm_cbe_tmp4647;
  unsigned char *ltmp_73_2;
  struct l_struct_2E_regboundobj *llvm_cbe_tmp23454_sub_i;
  unsigned int llvm_cbe_tmp30_i;
  unsigned int llvm_cbe_tmp4142_i;
  unsigned int llvm_cbe_tmp48_i;
  unsigned int llvm_cbe_tmp7576_i;
  float llvm_cbe_tmp8586_i;
  unsigned int llvm_cbe_tmp9596_i;
  unsigned int llvm_cbe_tmp116_i;
  unsigned int llvm_cbe_tmp344_i;
  unsigned int llvm_cbe_tmp378_i;
  unsigned int llvm_cbe_rboundarp_2_2_i;
  unsigned int llvm_cbe_rboundarp_2_2_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_rboundarp_1_1_i;
  unsigned int llvm_cbe_rboundarp_1_1_i__PHI_TEMPORARY;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_2_i;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_2_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_i1_0_i;
  unsigned int llvm_cbe_i1_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_i2_1_i;
  unsigned int llvm_cbe_i2_1_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp106_i;
  unsigned int llvm_cbe_tmp110_i;
  unsigned int llvm_cbe_tmp113_i;
  unsigned int llvm_cbe_tmp110_pn_i;
  unsigned int llvm_cbe_tmp110_pn_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp113_pn_i;
  unsigned int llvm_cbe_tmp113_pn_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_tmp124_i;
  unsigned int llvm_cbe_tmp132_i;
  unsigned int llvm_cbe_tmp133_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp141_i;
  unsigned int llvm_cbe_tmp144_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp154_i;
  unsigned char *llvm_cbe_tmp162_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp162163_i;
  unsigned int llvm_cbe_tmp182_i;
  unsigned int llvm_cbe_tmp185_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp194_i;
  unsigned int llvm_cbe_tmp197_i;
  unsigned int llvm_cbe_tmp208_i;
  unsigned int llvm_cbe_tmp209_i;
  unsigned int *llvm_cbe_tmp214_i;
  unsigned int llvm_cbe_tmp220_i;
  unsigned int *llvm_cbe_tmp227_i;
  unsigned int llvm_cbe_tmp230_i;
  unsigned int *llvm_cbe_tmp237_i;
  unsigned int llvm_cbe_tmp240_i;
  unsigned int llvm_cbe_tmp246_i;
  unsigned char *ltmp_74_2;
  unsigned int llvm_cbe_tmp259_i;
  unsigned int llvm_cbe_tmp263_i;
  unsigned int llvm_cbe_tmp278_i;
  unsigned char *ltmp_75_2;
  struct l_struct_2E_regboundobj *ltmp_76_8;
  unsigned char *ltmp_77_2;
  unsigned int llvm_cbe_rboundarp_2_0_i;
  unsigned int llvm_cbe_rboundarp_2_0_i__PHI_TEMPORARY;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_0_i;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp317_i;
  unsigned long long llvm_cbe_tmp324_sum_i;
  unsigned int llvm_cbe_tmp332_i;
  unsigned int llvm_cbe_tmp333_i;
  unsigned int llvm_cbe_rboundarp_2_1_i;
  unsigned int llvm_cbe_rboundarp_2_1_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_rboundarp_1_0_i;
  unsigned int llvm_cbe_rboundarp_1_0_i__PHI_TEMPORARY;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_1_i;
  struct l_struct_2E_regboundobj *llvm_cbe_rboundarp_0_1_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp337_i;
  unsigned int llvm_cbe_tmp351_i;
  unsigned int llvm_cbe_tmp361_i;
  unsigned int llvm_cbe_i1_1_i;
  unsigned int llvm_cbe_i1_1_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_i2_0_i;
  unsigned int llvm_cbe_i2_0_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_tmp397_i;
  unsigned char llvm_cbe_fldone_0_i;
  unsigned int llvm_cbe_tmp406_i;
  unsigned int llvm_cbe_i_0_i;
  unsigned int llvm_cbe_i_0_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_fldone_1_i;
  unsigned char llvm_cbe_fldone_1_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_i_1455_i;
  unsigned int llvm_cbe_i_1455_i__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp427428_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp5_i1_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp13_i_i;
  unsigned int llvm_cbe_tmp434_i;
  float llvm_cbe_tmp6_i;
  double llvm_cbe_tmp67_i1;
  unsigned int llvm_cbe_tmp1314_i;
  unsigned int llvm_cbe_tmp37131_i;
  unsigned int llvm_cbe_i_0_reg2mem_0_i;
  unsigned int llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_tmp22_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp29_i;
  unsigned int llvm_cbe_tmp32_i3;
  unsigned int llvm_cbe_tmp37_i4;
  unsigned int llvm_cbe_i_1134_i;
  unsigned int llvm_cbe_i_1134_i__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_tmp51_i5;
  unsigned long long llvm_cbe_tmp5253_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp58_i;
  unsigned int llvm_cbe_tmp60_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp92_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp99_i;
  unsigned int llvm_cbe_tmp102_i;
  unsigned int llvm_cbe_tmp107_i;
  unsigned int llvm_cbe_tmp107136_rle_i;
  unsigned int llvm_cbe_tmp107136_rle_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp116_i11;
  unsigned int llvm_cbe_tmp119_i12;
  struct l_struct_2E_regobj **llvm_cbe_tmp125_i;
  unsigned char *ltmp_78_2;
  float llvm_cbe_tmp63;
  unsigned int llvm_cbe_tmp6465;
  unsigned int llvm_cbe_tmp197436_i;
  unsigned int llvm_cbe_x_0429_i;
  unsigned int llvm_cbe_x_0429_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val337;
  unsigned int llvm_cbe_val438;
  struct l_struct_2E_regobj **llvm_cbe_tmp16_i;
  unsigned int llvm_cbe_tmp19_i;
  unsigned long long llvm_cbe_tmp2324_i14;
  struct l_struct_2E_regobj *llvm_cbe_tmp29_i16;
  unsigned char *llvm_cbe_tmp42_i;
  unsigned char llvm_cbe_tmp52_i;
  unsigned char llvm_cbe_tmp63_i;
  unsigned int llvm_cbe_tmp3_i_i;
  unsigned int llvm_cbe_tmp5_i_i22;
  unsigned int llvm_cbe_tmp6_i_i;
  unsigned int llvm_cbe_tmp8_i_i23;
  unsigned int llvm_cbe_tmp9_i_i;
  unsigned int llvm_cbe_tmp11_i_i;
  float llvm_cbe_tmp31_i_i;
  unsigned char *llvm_cbe_tmp80_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp8081_i;
  unsigned int llvm_cbe_tmp100_i25;
  unsigned int llvm_cbe_tmp103_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp111_i;
  unsigned int llvm_cbe_tmp114_i;
  unsigned int llvm_cbe_tmp125_i26;
  unsigned int llvm_cbe_tmp126_i27;
  unsigned int *llvm_cbe_tmp131_i;
  unsigned int llvm_cbe_tmp137_i;
  unsigned int *llvm_cbe_tmp144_i28;
  unsigned int llvm_cbe_tmp147_i;
  unsigned int *llvm_cbe_tmp154_i31;
  unsigned int llvm_cbe_tmp157_i;
  unsigned int llvm_cbe_tmp163_i;
  unsigned int llvm_cbe_tmp182_i33;
  unsigned int llvm_cbe_tmp186_i34;
  unsigned int llvm_cbe_tmp193_i;
  unsigned int llvm_cbe_tmp197_i35;
  unsigned int llvm_cbe_y_0434_i;
  unsigned int llvm_cbe_y_0434_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val335;
  unsigned int llvm_cbe_val436;
  unsigned int llvm_cbe_tmp186431_i;
  unsigned int llvm_cbe_tmp411426_rle_i;
  unsigned int llvm_cbe_tmp411426_rle_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_x214_0420_i;
  unsigned int llvm_cbe_x214_0420_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val333;
  unsigned int llvm_cbe_val434;
  struct l_struct_2E_regobj **llvm_cbe_tmp227_i36;
  unsigned int llvm_cbe_tmp230_i37;
  unsigned long long llvm_cbe_tmp234235_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp240_i38;
  unsigned char *llvm_cbe_tmp255_i;
  unsigned char llvm_cbe_tmp265_i39;
  unsigned char llvm_cbe_tmp276_i;
  unsigned char *llvm_cbe_tmp290_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp290291_i;
  unsigned int llvm_cbe_tmp314_i;
  unsigned int llvm_cbe_tmp317_i40;
  struct l_struct_2E_regobj **llvm_cbe_tmp326_i;
  unsigned int llvm_cbe_tmp329_i;
  unsigned int llvm_cbe_tmp340_i;
  unsigned int llvm_cbe_tmp341_i;
  unsigned int *llvm_cbe_tmp346_i42;
  unsigned int llvm_cbe_tmp352_i;
  unsigned int *llvm_cbe_tmp359_i;
  unsigned int llvm_cbe_tmp362_i;
  unsigned int *llvm_cbe_tmp369_i;
  unsigned int llvm_cbe_tmp372_i;
  unsigned int llvm_cbe_tmp378_i44;
  unsigned int llvm_cbe_tmp396_i;
  unsigned int llvm_cbe_tmp400_i;
  unsigned int llvm_cbe_tmp407_i;
  unsigned int llvm_cbe_tmp411_i45;
  unsigned int llvm_cbe_y215_0424_i;
  unsigned int llvm_cbe_y215_0424_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val331;
  unsigned int llvm_cbe_val432;
  unsigned int llvm_cbe_tmp400422_i;
  unsigned int llvm_cbe_tmp80;
  unsigned int llvm_cbe_tmp81;
  float llvm_cbe_tmp96;
  float llvm_cbe_tmp107;
  double llvm_cbe_tmp107108;
  unsigned int llvm_cbe_tmp309876;
  unsigned int llvm_cbe_y121_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y121_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_val327;
  unsigned int llvm_cbe_val428;
  unsigned int llvm_cbe_tmp298915;
  unsigned int llvm_cbe_x120_0913;
  unsigned int llvm_cbe_x120_0913__PHI_TEMPORARY;
  unsigned int llvm_cbe_val329;
  unsigned int llvm_cbe_val430;
  struct l_struct_2E_regobj **llvm_cbe_tmp132;
  unsigned int llvm_cbe_tmp135;
  unsigned long long llvm_cbe_tmp139140;
  struct l_struct_2E_regobj *llvm_cbe_tmp145;
  unsigned char *llvm_cbe_tmp160;
  unsigned char llvm_cbe_tmp170;
  unsigned char llvm_cbe_tmp181;
  unsigned char *llvm_cbe_tmp192;
  struct l_struct_2E_regobj *llvm_cbe_tmp192193;
  unsigned int llvm_cbe_tmp212;
  unsigned int llvm_cbe_tmp215;
  struct l_struct_2E_regobj **llvm_cbe_tmp224;
  unsigned int llvm_cbe_tmp227;
  unsigned int llvm_cbe_tmp238;
  unsigned int llvm_cbe_tmp239;
  unsigned int *llvm_cbe_tmp244;
  unsigned int llvm_cbe_tmp250;
  unsigned int *llvm_cbe_tmp257;
  unsigned int llvm_cbe_tmp260;
  unsigned int *llvm_cbe_tmp267;
  unsigned int llvm_cbe_tmp270;
  unsigned int llvm_cbe_tmp276;
  unsigned int llvm_cbe_tmp294;
  unsigned int llvm_cbe_tmp298;
  unsigned int llvm_cbe_tmp305;
  unsigned int llvm_cbe_tmp309;
  unsigned int llvm_cbe_tmp400883;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_val39;
  unsigned int llvm_cbe_val410;
  unsigned int llvm_cbe_tmp389934;
  unsigned int llvm_cbe_x_0932;
  unsigned int llvm_cbe_x_0932__PHI_TEMPORARY;
  unsigned int llvm_cbe_val311;
  unsigned int llvm_cbe_val412;
  struct l_struct_2E_regobj **llvm_cbe_tmp327;
  unsigned int llvm_cbe_tmp330;
  unsigned long long llvm_cbe_tmp334335;
  struct l_struct_2E_regobj *llvm_cbe_tmp340;
  unsigned char *llvm_cbe_tmp355;
  unsigned char llvm_cbe_tmp365;
  unsigned char llvm_cbe_tmp376;
  unsigned int llvm_cbe_tmp381;
  unsigned int llvm_cbe_tmp385;
  unsigned int llvm_cbe_tmp389;
  unsigned int llvm_cbe_tmp396;
  unsigned int llvm_cbe_tmp400;
  unsigned int llvm_cbe_tmp459889;
  unsigned int llvm_cbe_i412_0_reg2mem_0;
  unsigned int llvm_cbe_i412_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val313;
  unsigned int llvm_cbe_val414;
  struct l_struct_2E_regobj **llvm_cbe_tmp423;
  struct l_struct_2E_regobj *llvm_cbe_tmp430;
  unsigned int *llvm_cbe_tmp433;
  unsigned int llvm_cbe_tmp434;
  unsigned int *llvm_cbe_tmp437;
  unsigned int llvm_cbe_tmp438;
  unsigned char llvm_cbe_tmp440;
  unsigned int llvm_cbe_tmp444;
  unsigned int llvm_cbe_tmp448;
  unsigned int llvm_cbe_tmp454;
  unsigned int llvm_cbe_tmp459;
  unsigned int llvm_cbe_i_0927;
  unsigned int llvm_cbe_i_0927__PHI_TEMPORARY;
  unsigned int llvm_cbe_val315;
  unsigned int llvm_cbe_val416;
  struct l_struct_2E_regobj **llvm_cbe_tmp474;
  struct l_struct_2E_regobj *llvm_cbe_tmp481;
  unsigned int llvm_cbe_tmp484;
  unsigned int llvm_cbe_tmp489;
  unsigned int llvm_cbe_tmp489929_rle;
  unsigned int llvm_cbe_tmp489929_rle__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp497;
  unsigned int llvm_cbe_tmp500;
  struct l_struct_2E_regobj **llvm_cbe_tmp506;
  unsigned char *ltmp_79_2;
  unsigned int llvm_cbe_tmp562896;
  unsigned int llvm_cbe_i513_0_reg2mem_0;
  unsigned int llvm_cbe_i513_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val317;
  unsigned int llvm_cbe_val418;
  struct l_struct_2E_regobj **llvm_cbe_tmp523;
  struct l_struct_2E_regobj *llvm_cbe_tmp530;
  unsigned int llvm_cbe_tmp532;
  unsigned int llvm_cbe_tmp557;
  unsigned int llvm_cbe_tmp562;
  unsigned int llvm_cbe_tmp771904;
  unsigned int llvm_cbe_y575_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y575_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_val323;
  unsigned int llvm_cbe_val424;
  unsigned int llvm_cbe_tmp760919;
  unsigned int llvm_cbe_x574_0917;
  unsigned int llvm_cbe_x574_0917__PHI_TEMPORARY;
  unsigned int llvm_cbe_val325;
  unsigned int llvm_cbe_val426;
  struct l_struct_2E_regobj **llvm_cbe_tmp587;
  unsigned int llvm_cbe_tmp590;
  unsigned long long llvm_cbe_tmp594595;
  struct l_struct_2E_regobj *llvm_cbe_tmp600;
  unsigned char *llvm_cbe_tmp615;
  unsigned char llvm_cbe_tmp625;
  unsigned char llvm_cbe_tmp636;
  unsigned char *llvm_cbe_tmp650;
  struct l_struct_2E_regobj *llvm_cbe_tmp650651;
  unsigned int llvm_cbe_tmp674;
  unsigned int llvm_cbe_tmp677;
  struct l_struct_2E_regobj **llvm_cbe_tmp686;
  unsigned int llvm_cbe_tmp689;
  unsigned int llvm_cbe_tmp700;
  unsigned int llvm_cbe_tmp701;
  unsigned int *llvm_cbe_tmp706;
  unsigned int llvm_cbe_tmp712;
  unsigned int *llvm_cbe_tmp719;
  unsigned int llvm_cbe_tmp722;
  unsigned int *llvm_cbe_tmp729;
  unsigned int llvm_cbe_tmp732;
  unsigned int llvm_cbe_tmp738;
  unsigned int llvm_cbe_tmp756;
  unsigned int llvm_cbe_tmp760;
  unsigned int llvm_cbe_tmp767;
  unsigned int llvm_cbe_tmp771;
  unsigned int llvm_cbe_tmp832910;
  unsigned int llvm_cbe_i784_0_reg2mem_0;
  unsigned int llvm_cbe_i784_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val319;
  unsigned int llvm_cbe_val420;
  struct l_struct_2E_regobj **llvm_cbe_tmp796;
  struct l_struct_2E_regobj *llvm_cbe_tmp803;
  unsigned int *llvm_cbe_tmp806;
  unsigned int llvm_cbe_tmp807;
  unsigned int *llvm_cbe_tmp810;
  unsigned int llvm_cbe_tmp811;
  unsigned char llvm_cbe_tmp813;
  unsigned int llvm_cbe_tmp817;
  unsigned int llvm_cbe_tmp821;
  unsigned int llvm_cbe_tmp827;
  unsigned int llvm_cbe_tmp832;
  unsigned int llvm_cbe_i_1922;
  unsigned int llvm_cbe_i_1922__PHI_TEMPORARY;
  unsigned int llvm_cbe_val321;
  unsigned int llvm_cbe_val422;
  struct l_struct_2E_regobj **llvm_cbe_tmp847;
  struct l_struct_2E_regobj *llvm_cbe_tmp854;
  unsigned int llvm_cbe_tmp857;
  unsigned int llvm_cbe_tmp860;
  unsigned int llvm_cbe_tmp865;
  unsigned int llvm_cbe_tmp865924_rle;
  unsigned int llvm_cbe_tmp865924_rle__PHI_TEMPORARY;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )18);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )18));
  llvm_cbe_tmp10 = *(&(regmng.field16));
  llvm_cbe_tmp13 = *(&(regmng.field17));
  llvm_cbe_tmp19 = *(&(regmng.field6));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )18);
  ltmp_72_2 = memset((((unsigned char *)llvm_cbe_tmp19)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )(llvm_cbe_tmp13 * llvm_cbe_tmp10))) << ((unsigned long long )3ll)));
  llvm_cbe_regionl_addr_0 = (((((signed int )llvm_cbe_regionl) < ((signed int )((unsigned int )6)))) ? (((unsigned int )6)) : (llvm_cbe_regionl));
  llvm_cbe_tmp26 = *(&(regmng.field16));
  llvm_cbe_tmp27 = ((signed int )(((signed int )llvm_cbe_tmp26) / ((signed int )((unsigned int )5))));
  llvm_cbe_tmp40 = ((float )((((float )(signed int )((((((signed int )llvm_cbe_tmp27) < ((signed int )llvm_cbe_regionl_addr_0))) ? (llvm_cbe_tmp27) : (llvm_cbe_regionl_addr_0))))) / 0x1.4p+4));
  *(&(regmng.field11)) = llvm_cbe_tmp40;
  llvm_cbe_tmp4647 = ((signed int )(((float )(llvm_cbe_tmp40 * 0x1.4p+3))));
  *(&(regmng.field9)) = llvm_cbe_tmp4647;
  *(&(regmng.field10)) = (llvm_cbe_tmp4647 * llvm_cbe_tmp4647);
  ltmp_73_2 =  /*tail*/ malloc(((unsigned long long )1792ll));
  llvm_cbe_tmp23454_sub_i = &(((struct l_struct_2E_regboundobj (*)[16])ltmp_73_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))];
  llvm_cbe_tmp30_i = *(&(regmng.field12));
  llvm_cbe_tmp4142_i = ((signed int )(((float )((((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp30_i)) / 0x1.36p+9))) * 0x1.1p+5))) / llvm_cbe_tmp40))) + 0x1p-1))));
  llvm_cbe_tmp48_i = *(&(regmng.field13));
  llvm_cbe_tmp7576_i = ((signed int )(((float )((((float )((((float )(signed int )(llvm_cbe_tmp30_i + ((unsigned int )1)))) / (((float )(signed int )llvm_cbe_tmp4142_i))))) + 0x1p-1))));
  llvm_cbe_tmp8586_i = ((float )(signed int )(((signed int )(((float )((((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp48_i)) / 0x1.35p+8))) * 0x1.4p+4))) / llvm_cbe_tmp40))) + 0x1p-1))))));
  llvm_cbe_tmp9596_i = ((signed int )(((float )((((float )(((((double )(((float )((((float )(signed int )(llvm_cbe_tmp48_i + ((unsigned int )1)))) / llvm_cbe_tmp8586_i))))) * 0x1.bb67ae8584caap+0) * 0x1p-1))) + 0x1p-1))));
  llvm_cbe_tmp116_i = ((signed int )(((signed int )llvm_cbe_tmp9596_i) / ((signed int )((unsigned int )2))));
  llvm_cbe_tmp344_i = llvm_cbe_tmp4142_i + ((unsigned int )-1);
  llvm_cbe_tmp378_i = (((signed int )(((float )((((float )((((double )(((float )(llvm_cbe_tmp8586_i * 0x1p+1))))) / 0x1.bb67ae8584caap+0))) + 0x1p-1))))) + ((unsigned int )3);
  llvm_cbe_rboundarp_2_2_i__PHI_TEMPORARY = ((unsigned int )16);   /* for PHI node */
  llvm_cbe_rboundarp_1_1_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_rboundarp_0_2_i__PHI_TEMPORARY = llvm_cbe_tmp23454_sub_i;   /* for PHI node */
  llvm_cbe_i1_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_i2_1_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb100_i;

  do {     /* Syntactic loop 'bb100.i' to make GCC happy */
llvm_cbe_bb100_i:
  llvm_cbe_rboundarp_2_2_i = llvm_cbe_rboundarp_2_2_i__PHI_TEMPORARY;
  llvm_cbe_rboundarp_1_1_i = llvm_cbe_rboundarp_1_1_i__PHI_TEMPORARY;
  llvm_cbe_rboundarp_0_2_i = llvm_cbe_rboundarp_0_2_i__PHI_TEMPORARY;
  llvm_cbe_i1_0_i = llvm_cbe_i1_0_i__PHI_TEMPORARY;
  llvm_cbe_i2_1_i = llvm_cbe_i2_1_i__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )71);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )71));
  if (((llvm_cbe_i2_1_i & ((unsigned int )1)) == ((unsigned int )0))) {
    goto llvm_cbe_cond_false_i;
  } else {
    goto llvm_cbe_cond_true_i;
  }

llvm_cbe_cond_next363_i:
  llvm_cbe_i1_1_i = llvm_cbe_i1_1_i__PHI_TEMPORARY;
  llvm_cbe_i2_0_i = llvm_cbe_i2_0_i__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp378_i) > ((signed int )llvm_cbe_i2_0_i))) {
    llvm_cbe_rboundarp_2_2_i__PHI_TEMPORARY = llvm_cbe_rboundarp_2_1_i;   /* for PHI node */
    llvm_cbe_rboundarp_1_1_i__PHI_TEMPORARY = llvm_cbe_rboundarp_1_0_i;   /* for PHI node */
    llvm_cbe_rboundarp_0_2_i__PHI_TEMPORARY = llvm_cbe_rboundarp_0_1_i;   /* for PHI node */
    llvm_cbe_i1_0_i__PHI_TEMPORARY = llvm_cbe_i1_1_i;   /* for PHI node */
    llvm_cbe_i2_1_i__PHI_TEMPORARY = llvm_cbe_i2_0_i;   /* for PHI node */
    goto llvm_cbe_bb100_i;
  } else {
    llvm_cbe_i_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_fldone_1_i__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
    goto llvm_cbe_bb407_i;
  }

llvm_cbe_cond_true342_i:
  if ((llvm_cbe_tmp344_i == llvm_cbe_tmp337_i)) {
    goto llvm_cbe_cond_true349_i;
  } else {
    llvm_cbe_i1_1_i__PHI_TEMPORARY = llvm_cbe_tmp337_i;   /* for PHI node */
    llvm_cbe_i2_0_i__PHI_TEMPORARY = llvm_cbe_i2_1_i;   /* for PHI node */
    goto llvm_cbe_cond_next363_i;
  }

llvm_cbe_next_i:
  llvm_cbe_rboundarp_2_1_i = llvm_cbe_rboundarp_2_1_i__PHI_TEMPORARY;
  llvm_cbe_rboundarp_1_0_i = llvm_cbe_rboundarp_1_0_i__PHI_TEMPORARY;
  llvm_cbe_rboundarp_0_1_i = llvm_cbe_rboundarp_0_1_i__PHI_TEMPORARY;
  llvm_cbe_tmp337_i = llvm_cbe_i1_0_i + ((unsigned int )1);
  if (((llvm_cbe_i2_1_i & ((unsigned int )1)) == ((unsigned int )0))) {
    goto llvm_cbe_cond_false353_i;
  } else {
    goto llvm_cbe_cond_true342_i;
  }

llvm_cbe_cond_next_i:
  llvm_cbe_tmp110_pn_i = llvm_cbe_tmp110_pn_i__PHI_TEMPORARY;
  llvm_cbe_tmp113_pn_i = llvm_cbe_tmp113_pn_i__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )71);
  llvm_cbe_tmp124_i = _ZN9regmngobj13findfreeplaceEiiRiS0_((llvm_cbe_tmp113_pn_i + llvm_cbe_tmp110_pn_i), (llvm_cbe_tmp116_i + (llvm_cbe_i2_1_i * llvm_cbe_tmp9596_i)), (&llvm_cbe_x_i), (&llvm_cbe_y_i));
  if ((llvm_cbe_tmp124_i == ((unsigned char )0))) {
    llvm_cbe_rboundarp_2_1_i__PHI_TEMPORARY = llvm_cbe_rboundarp_2_2_i;   /* for PHI node */
    llvm_cbe_rboundarp_1_0_i__PHI_TEMPORARY = llvm_cbe_rboundarp_1_1_i;   /* for PHI node */
    llvm_cbe_rboundarp_0_1_i__PHI_TEMPORARY = llvm_cbe_rboundarp_0_2_i;   /* for PHI node */
    goto llvm_cbe_next_i;
  } else {
    goto llvm_cbe_cond_false131_i;
  }

llvm_cbe_cond_true_i:
  llvm_cbe_tmp106_i = llvm_cbe_i1_0_i * llvm_cbe_tmp7576_i;
  llvm_cbe_tmp110_pn_i__PHI_TEMPORARY = llvm_cbe_tmp106_i;   /* for PHI node */
  llvm_cbe_tmp113_pn_i__PHI_TEMPORARY = llvm_cbe_tmp7576_i;   /* for PHI node */
  goto llvm_cbe_cond_next_i;

llvm_cbe_cond_false_i:
  llvm_cbe_tmp110_i = ((signed int )(((signed int )llvm_cbe_tmp7576_i) / ((signed int )((unsigned int )2))));
  llvm_cbe_tmp113_i = llvm_cbe_i1_0_i * llvm_cbe_tmp7576_i;
  llvm_cbe_tmp110_pn_i__PHI_TEMPORARY = llvm_cbe_tmp110_i;   /* for PHI node */
  llvm_cbe_tmp113_pn_i__PHI_TEMPORARY = llvm_cbe_tmp113_i;   /* for PHI node */
  goto llvm_cbe_cond_next_i;

llvm_cbe_cond_false131_i:
  llvm_cbe_tmp132_i = *(&llvm_cbe_y_i);
  llvm_cbe_tmp133_i = *(&llvm_cbe_x_i);
  llvm_cbe_tmp141_i = *(&(regmng.field6));
  llvm_cbe_tmp144_i = *(&(regmng.field16));
  llvm_cbe_tmp154_i = *(&llvm_cbe_tmp141_i[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp144_i * llvm_cbe_tmp132_i) + llvm_cbe_tmp133_i))))]);
  if ((llvm_cbe_tmp154_i == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_next161_i;
  } else {
    llvm_cbe_rboundarp_2_1_i__PHI_TEMPORARY = llvm_cbe_rboundarp_2_2_i;   /* for PHI node */
    llvm_cbe_rboundarp_1_0_i__PHI_TEMPORARY = llvm_cbe_rboundarp_1_1_i;   /* for PHI node */
    llvm_cbe_rboundarp_0_1_i__PHI_TEMPORARY = llvm_cbe_rboundarp_0_2_i;   /* for PHI node */
    goto llvm_cbe_next_i;
  }

llvm_cbe_cond_next314_i:
  llvm_cbe_rboundarp_2_0_i = llvm_cbe_rboundarp_2_0_i__PHI_TEMPORARY;
  llvm_cbe_rboundarp_0_0_i = llvm_cbe_rboundarp_0_0_i__PHI_TEMPORARY;
  llvm_cbe_tmp317_i = llvm_cbe_rboundarp_1_1_i + ((unsigned int )1);
  llvm_cbe_tmp324_sum_i = (((signed long long )(signed int )llvm_cbe_tmp317_i)) + ((unsigned long long )-1ll);
  *(&llvm_cbe_rboundarp_0_0_i[((signed long long )llvm_cbe_tmp324_sum_i)].field16) = ((unsigned char )1);
  llvm_cbe_tmp332_i = *(&llvm_cbe_y_i);
  llvm_cbe_tmp333_i = *(&llvm_cbe_x_i);
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )71);
  _ZN11regboundobj9firststepEiiP6regobjP9regmngobj((&llvm_cbe_rboundarp_0_0_i[((signed long long )llvm_cbe_tmp324_sum_i)]), llvm_cbe_tmp333_i, llvm_cbe_tmp332_i, llvm_cbe_tmp162163_i);
  llvm_cbe_rboundarp_2_1_i__PHI_TEMPORARY = llvm_cbe_rboundarp_2_0_i;   /* for PHI node */
  llvm_cbe_rboundarp_1_0_i__PHI_TEMPORARY = llvm_cbe_tmp317_i;   /* for PHI node */
  llvm_cbe_rboundarp_0_1_i__PHI_TEMPORARY = llvm_cbe_rboundarp_0_0_i;   /* for PHI node */
  goto llvm_cbe_next_i;

llvm_cbe_cond_next191_i:
  llvm_cbe_tmp194_i = *(&(regmng.field18.field0));
  llvm_cbe_tmp197_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp194_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp197_i)))]) = llvm_cbe_tmp162163_i;
  llvm_cbe_tmp208_i = *(&(regmng.field18.field1.field1));
  llvm_cbe_tmp209_i = llvm_cbe_tmp208_i + ((unsigned int )-1);
  *(&(regmng.field18.field1.field1)) = llvm_cbe_tmp209_i;
  llvm_cbe_tmp214_i = *(&(regmng.field18.field1.field0));
  llvm_cbe_tmp220_i = *(&llvm_cbe_tmp214_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp209_i)))]);
  llvm_cbe_tmp227_i = *(&(regmng.field18.field2.field0));
  llvm_cbe_tmp230_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp227_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp220_i)))]) = llvm_cbe_tmp230_i;
  llvm_cbe_tmp237_i = *(&(regmng.field18.field3.field0));
  llvm_cbe_tmp240_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp237_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp240_i)))]) = llvm_cbe_tmp220_i;
  llvm_cbe_tmp246_i = *(&(regmng.field18.field4));
  *(&(regmng.field18.field4)) = (llvm_cbe_tmp246_i + ((unsigned int )1));
  *(((unsigned int *)llvm_cbe_tmp162_i)) = llvm_cbe_tmp220_i;
  *(&llvm_cbe_tmp162163_i->field9.field2) = ((unsigned int )4);
  *(&llvm_cbe_tmp162163_i->field9.field1) = ((unsigned int )0);
  ltmp_74_2 =  /*tail*/ malloc(((unsigned long long )32ll));
  *(&llvm_cbe_tmp162163_i->field9.field0) = (&(((struct l_struct_2E_regobj *(*)[4])ltmp_74_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  *(&llvm_cbe_tmp162163_i->field1) = ((unsigned char )1);
  llvm_cbe_tmp259_i = *(&llvm_cbe_x_i);
  *(&llvm_cbe_tmp162163_i->field5.field0) = llvm_cbe_tmp259_i;
  llvm_cbe_tmp263_i = *(&llvm_cbe_y_i);
  *(&llvm_cbe_tmp162163_i->field5.field1) = llvm_cbe_tmp263_i;
  if ((llvm_cbe_rboundarp_1_1_i == llvm_cbe_rboundarp_2_2_i)) {
    goto llvm_cbe_cond_true274_i;
  } else {
    llvm_cbe_rboundarp_2_0_i__PHI_TEMPORARY = llvm_cbe_rboundarp_2_2_i;   /* for PHI node */
    llvm_cbe_rboundarp_0_0_i__PHI_TEMPORARY = llvm_cbe_rboundarp_0_2_i;   /* for PHI node */
    goto llvm_cbe_cond_next314_i;
  }

llvm_cbe_cond_next161_i:
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )71);
  llvm_cbe_tmp162_i = _Znwm(((unsigned long long )56ll));
  llvm_cbe_tmp162163_i = ((struct l_struct_2E_regobj *)llvm_cbe_tmp162_i);
  *(&llvm_cbe_tmp162163_i->field3) = (&regmng);
  llvm_cbe_tmp182_i = *(&(regmng.field18.field4));
  llvm_cbe_tmp185_i = *(&(regmng.field18.field5));
  if ((llvm_cbe_tmp182_i == llvm_cbe_tmp185_i)) {
    goto llvm_cbe_cond_true189_i;
  } else {
    goto llvm_cbe_cond_next191_i;
  }

llvm_cbe_cond_true189_i:
  *(&cg_caller_call_site_var) = ((unsigned int )3);
  *(&cg_caller_id_var) = ((unsigned int )71);
  _ZN15largesolidarrayIP6regobjE8doublingEv();
  goto llvm_cbe_cond_next191_i;

llvm_cbe_cond_true274_i:
  llvm_cbe_tmp278_i = llvm_cbe_rboundarp_2_2_i << ((unsigned int )1);
  ltmp_75_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp278_i)) * ((unsigned long long )112ll)));
  ltmp_76_8 = ((struct l_struct_2E_regboundobj *)ltmp_75_2);
  *(&cg_caller_call_site_var) = ((unsigned int )4);
  *(&cg_caller_id_var) = ((unsigned int )71);
  ltmp_77_2 = memcpy((((unsigned char *)ltmp_76_8)), (((unsigned char *)llvm_cbe_rboundarp_0_2_i)), ((((signed long long )(signed int )llvm_cbe_rboundarp_2_2_i)) * ((unsigned long long )112ll)));
   /*tail*/ free((((unsigned char *)llvm_cbe_rboundarp_0_2_i)));
  llvm_cbe_rboundarp_2_0_i__PHI_TEMPORARY = llvm_cbe_tmp278_i;   /* for PHI node */
  llvm_cbe_rboundarp_0_0_i__PHI_TEMPORARY = ltmp_76_8;   /* for PHI node */
  goto llvm_cbe_cond_next314_i;

llvm_cbe_cond_true349_i:
  llvm_cbe_tmp351_i = llvm_cbe_i2_1_i + ((unsigned int )1);
  llvm_cbe_i1_1_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_i2_0_i__PHI_TEMPORARY = llvm_cbe_tmp351_i;   /* for PHI node */
  goto llvm_cbe_cond_next363_i;

llvm_cbe_cond_false353_i:
  if ((llvm_cbe_tmp337_i == llvm_cbe_tmp4142_i)) {
    goto llvm_cbe_cond_true359_i;
  } else {
    llvm_cbe_i1_1_i__PHI_TEMPORARY = llvm_cbe_tmp337_i;   /* for PHI node */
    llvm_cbe_i2_0_i__PHI_TEMPORARY = llvm_cbe_i2_1_i;   /* for PHI node */
    goto llvm_cbe_cond_next363_i;
  }

llvm_cbe_cond_true359_i:
  llvm_cbe_tmp361_i = llvm_cbe_i2_1_i + ((unsigned int )1);
  llvm_cbe_i1_1_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_i2_0_i__PHI_TEMPORARY = llvm_cbe_tmp361_i;   /* for PHI node */
  goto llvm_cbe_cond_next363_i;

  } while (1); /* end of syntactic loop 'bb100.i' */
  do {     /* Syntactic loop 'bb407.i' to make GCC happy */
llvm_cbe_bb407_i:
  llvm_cbe_i_0_i = llvm_cbe_i_0_i__PHI_TEMPORARY;
  llvm_cbe_fldone_1_i = llvm_cbe_fldone_1_i__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )72);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )72));
  if ((((signed int )llvm_cbe_rboundarp_1_0_i) > ((signed int )llvm_cbe_i_0_i))) {
    goto llvm_cbe_bb386_i;
  } else {
    goto llvm_cbe_bb414_i;
  }

llvm_cbe_bb386_i:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )72);
  llvm_cbe_tmp397_i = _ZN11regboundobj4stepEv((&llvm_cbe_rboundarp_0_1_i[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_i)))]));
  llvm_cbe_fldone_0_i = (((llvm_cbe_tmp397_i == ((unsigned char )1))) ? (((unsigned char )0)) : (llvm_cbe_fldone_1_i));
  llvm_cbe_tmp406_i = llvm_cbe_i_0_i + ((unsigned int )1);
  llvm_cbe_i_0_i__PHI_TEMPORARY = llvm_cbe_tmp406_i;   /* for PHI node */
  llvm_cbe_fldone_1_i__PHI_TEMPORARY = llvm_cbe_fldone_0_i;   /* for PHI node */
  goto llvm_cbe_bb407_i;

llvm_cbe_bb414_i:
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((llvm_cbe_fldone_1_i == ((unsigned char )0))) {
    llvm_cbe_i_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_fldone_1_i__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
    goto llvm_cbe_bb407_i;
  } else {
    goto llvm_cbe_bb435_loopexit_i;
  }

  } while (1); /* end of syntactic loop 'bb407.i' */
  do {     /* Syntactic loop 'bb421.i' to make GCC happy */
llvm_cbe_bb421_i:
  llvm_cbe_i_1455_i = llvm_cbe_i_1455_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )73);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )73));
  llvm_cbe_tmp427428_i = ((signed long long )(signed int )llvm_cbe_i_1455_i);
  llvm_cbe_tmp5_i1_i = *(&llvm_cbe_rboundarp_0_1_i[((signed long long )llvm_cbe_tmp427428_i)].field0.field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp5_i1_i)));
  llvm_cbe_tmp13_i_i = *(&llvm_cbe_rboundarp_0_1_i[((signed long long )llvm_cbe_tmp427428_i)].field1.field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp13_i_i)));
  llvm_cbe_tmp434_i = llvm_cbe_i_1455_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_rboundarp_1_0_i) > ((signed int )llvm_cbe_tmp434_i))) {
    llvm_cbe_i_1455_i__PHI_TEMPORARY = llvm_cbe_tmp434_i;   /* for PHI node */
    goto llvm_cbe_bb421_i;
  } else {
    goto llvm_cbe__ZN9regmngobj13defineregionsEv_exit;
  }

  } while (1); /* end of syntactic loop 'bb421.i' */
llvm_cbe_bb435_loopexit_i:
  if ((((signed int )llvm_cbe_rboundarp_1_0_i) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_1455_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb421_i;
  } else {
    goto llvm_cbe__ZN9regmngobj13defineregionsEv_exit;
  }

llvm_cbe__ZN9regmngobj13defineregionsEv_exit:
   /*tail*/ free((((unsigned char *)llvm_cbe_rboundarp_0_1_i)));
  llvm_cbe_tmp6_i = *(&(regmng.field11));
  llvm_cbe_tmp67_i1 = ((double )llvm_cbe_tmp6_i);
  llvm_cbe_tmp1314_i = ((signed int )((llvm_cbe_tmp67_i1 * 0x1.acp+6) * llvm_cbe_tmp67_i1));
  llvm_cbe_tmp37131_i = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp37131_i) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb_i;
  } else {
    llvm_cbe_tmp107136_rle_i__PHI_TEMPORARY = llvm_cbe_tmp37131_i;   /* for PHI node */
    goto llvm_cbe_bb103_preheader_i;
  }

  do {     /* Syntactic loop 'bb.i' to make GCC happy */
llvm_cbe_bb_i:
  llvm_cbe_i_0_reg2mem_0_i = llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )74);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )74));
  llvm_cbe_tmp22_i = *(&(regmng.field18.field0));
  llvm_cbe_tmp29_i = *(&llvm_cbe_tmp22_i[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i)))]);
  *(&llvm_cbe_tmp29_i->field2) = ((unsigned char )1);
  llvm_cbe_tmp32_i3 = llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )1);
  llvm_cbe_tmp37_i4 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_tmp37_i4) > ((signed int )llvm_cbe_tmp32_i3))) {
    llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp32_i3;   /* for PHI node */
    goto llvm_cbe_bb_i;
  } else {
    llvm_cbe_tmp107136_rle_i__PHI_TEMPORARY = llvm_cbe_tmp37_i4;   /* for PHI node */
    goto llvm_cbe_bb103_preheader_i;
  }

  } while (1); /* end of syntactic loop 'bb.i' */
  do {     /* Syntactic loop 'bb42.i' to make GCC happy */
llvm_cbe_bb42_i:
  llvm_cbe_i_1134_i = llvm_cbe_i_1134_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )75);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )75));
  llvm_cbe_tmp51_i5 = *(&(regmng.field18.field0));
  llvm_cbe_tmp5253_i = ((signed long long )(signed int )llvm_cbe_i_1134_i);
  llvm_cbe_tmp58_i = *(&llvm_cbe_tmp51_i5[((signed long long )llvm_cbe_tmp5253_i)]);
  llvm_cbe_tmp60_i = *(&llvm_cbe_tmp58_i->field4);
  if ((((signed int )llvm_cbe_tmp60_i) < ((signed int )llvm_cbe_tmp1314_i))) {
    goto llvm_cbe_cond_true_i9;
  } else {
    goto llvm_cbe_cond_next_i10;
  }

llvm_cbe_cond_next_i10:
  llvm_cbe_tmp102_i = llvm_cbe_i_1134_i + ((unsigned int )1);
  llvm_cbe_tmp107_i = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_tmp107_i) > ((signed int )llvm_cbe_tmp102_i))) {
    llvm_cbe_i_1134_i__PHI_TEMPORARY = llvm_cbe_tmp102_i;   /* for PHI node */
    goto llvm_cbe_bb42_i;
  } else {
    goto llvm_cbe__ZN9regmngobj14enlargeregionsEv_exit;
  }

llvm_cbe_cond_true_i9:
  *(&llvm_cbe_tmp58_i->field2) = ((unsigned char )0);
  llvm_cbe_tmp92_i = *(&(regmng.field18.field0));
  llvm_cbe_tmp99_i = *(&llvm_cbe_tmp92_i[((signed long long )llvm_cbe_tmp5253_i)]);
  *(&llvm_cbe_tmp99_i->field1) = ((unsigned char )0);
  goto llvm_cbe_cond_next_i10;

  } while (1); /* end of syntactic loop 'bb42.i' */
llvm_cbe_bb103_preheader_i:
  llvm_cbe_tmp107136_rle_i = llvm_cbe_tmp107136_rle_i__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_tmp107136_rle_i) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_1134_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb42_i;
  } else {
    goto llvm_cbe__ZN9regmngobj14enlargeregionsEv_exit;
  }

llvm_cbe__ZN9regmngobj14enlargeregionsEv_exit:
  *(&cg_caller_call_site_var) = ((unsigned int )7);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj13deleteregionsEv();
  llvm_cbe_tmp116_i11 = *(&(regmng.field16));
  llvm_cbe_tmp119_i12 = *(&(regmng.field17));
  llvm_cbe_tmp125_i = *(&(regmng.field6));
  *(&cg_caller_call_site_var) = ((unsigned int )8);
  *(&cg_caller_id_var) = ((unsigned int )18);
  ltmp_78_2 = memset((((unsigned char *)llvm_cbe_tmp125_i)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )(llvm_cbe_tmp119_i12 * llvm_cbe_tmp116_i11))) << ((unsigned long long )3ll)));
  *(&cg_caller_call_site_var) = ((unsigned int )9);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj15redefineregionsEv();
  llvm_cbe_tmp63 = *(&(regmng.field11));
  llvm_cbe_tmp6465 = ((signed int )(((float )(llvm_cbe_tmp63 * 0x1.3p+4))));
  *(&(regmng.field9)) = llvm_cbe_tmp6465;
  *(&(regmng.field10)) = (llvm_cbe_tmp6465 * llvm_cbe_tmp6465);
  llvm_cbe_tmp197436_i = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp197436_i) < ((signed int )((unsigned int )0)))) {
    llvm_cbe_tmp411426_rle_i__PHI_TEMPORARY = llvm_cbe_tmp197436_i;   /* for PHI node */
    goto llvm_cbe_bb202_i;
  } else {
    llvm_cbe_y_0434_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb183_preheader_i;
  }

  do {     /* Syntactic loop 'bb183.preheader.i' to make GCC happy */
llvm_cbe_bb183_preheader_i:
  llvm_cbe_y_0434_i = llvm_cbe_y_0434_i__PHI_TEMPORARY;
  llvm_cbe_val335 = *(&cg_caller_id_var);
  llvm_cbe_val436 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )89);
  CallEdgeProfiler(llvm_cbe_val335, llvm_cbe_val436, ((unsigned int )89));
  llvm_cbe_tmp186431_i = *(&(regmng.field12));
  if ((((signed int )llvm_cbe_tmp186431_i) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb191_i;
  } else {
    llvm_cbe_x_0429_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb6_i;
  }

llvm_cbe_bb191_i:
  llvm_cbe_tmp193_i = llvm_cbe_y_0434_i + ((unsigned int )1);
  llvm_cbe_tmp197_i35 = *(&(regmng.field13));
  *(&cg_caller_call_site_var) = llvm_cbe_val436;
  *(&cg_caller_id_var) = llvm_cbe_val335;
  if ((((signed int )llvm_cbe_tmp197_i35) < ((signed int )llvm_cbe_tmp193_i))) {
    llvm_cbe_tmp411426_rle_i__PHI_TEMPORARY = llvm_cbe_tmp197_i35;   /* for PHI node */
    goto llvm_cbe_bb202_i;
  } else {
    llvm_cbe_y_0434_i__PHI_TEMPORARY = llvm_cbe_tmp193_i;   /* for PHI node */
    goto llvm_cbe_bb183_preheader_i;
  }

  do {     /* Syntactic loop 'bb6.i' to make GCC happy */
llvm_cbe_bb6_i:
  llvm_cbe_x_0429_i = llvm_cbe_x_0429_i__PHI_TEMPORARY;
  llvm_cbe_val337 = *(&cg_caller_id_var);
  llvm_cbe_val438 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )90);
  CallEdgeProfiler(llvm_cbe_val337, llvm_cbe_val438, ((unsigned int )90));
  llvm_cbe_tmp16_i = *(&(regmng.field6));
  llvm_cbe_tmp19_i = *(&(regmng.field16));
  llvm_cbe_tmp2324_i14 = ((signed long long )(signed int )((llvm_cbe_tmp19_i * llvm_cbe_y_0434_i) + llvm_cbe_x_0429_i));
  llvm_cbe_tmp29_i16 = *(&llvm_cbe_tmp16_i[((signed long long )llvm_cbe_tmp2324_i14)]);
  if ((llvm_cbe_tmp29_i16 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true_i20;
  } else {
    goto llvm_cbe_cond_next180_i;
  }

llvm_cbe_cond_next180_i:
  llvm_cbe_tmp182_i33 = llvm_cbe_x_0429_i + ((unsigned int )1);
  llvm_cbe_tmp186_i34 = *(&(regmng.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val438;
  *(&cg_caller_id_var) = llvm_cbe_val337;
  if ((((signed int )llvm_cbe_tmp186_i34) < ((signed int )llvm_cbe_tmp182_i33))) {
    goto llvm_cbe_bb191_i;
  } else {
    llvm_cbe_x_0429_i__PHI_TEMPORARY = llvm_cbe_tmp182_i33;   /* for PHI node */
    goto llvm_cbe_bb6_i;
  }

llvm_cbe_cond_true_i20:
  llvm_cbe_tmp42_i = *(&(regmng.field7));
  llvm_cbe_tmp52_i = *(&llvm_cbe_tmp42_i[((signed long long )llvm_cbe_tmp2324_i14)]);
  llvm_cbe_tmp63_i = *(&regmng.field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp52_i)))]);
  if ((llvm_cbe_tmp63_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_next180_i;
  } else {
    goto llvm_cbe_cond_true66_i;
  }

llvm_cbe_cond_true66_i:
  llvm_cbe_tmp3_i_i = *(&y1rnd);
  llvm_cbe_tmp5_i_i22 = ((signed int )(((signed int )(llvm_cbe_tmp3_i_i * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp5_i_i22;
  llvm_cbe_tmp6_i_i = *(&y2rnd);
  llvm_cbe_tmp8_i_i23 = ((signed int )(((signed int )(llvm_cbe_tmp6_i_i * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp8_i_i23;
  llvm_cbe_tmp9_i_i = *(&y3rnd);
  llvm_cbe_tmp11_i_i = ((signed int )(((signed int )(llvm_cbe_tmp9_i_i * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp11_i_i;
  llvm_cbe_tmp31_i_i = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp5_i_i22)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp8_i_i23)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp11_i_i)) * 0x1.14a44ap-15)))));
  if (((((signed int )(((float )((((float )(llvm_cbe_tmp31_i_i - (((float )(signed int )(((signed int )llvm_cbe_tmp31_i_i))))))) * 0x1p+5))))) == ((unsigned int )1))) {
    goto llvm_cbe_cond_true72_i;
  } else {
    goto llvm_cbe_cond_next180_i;
  }

llvm_cbe_cond_next_i32:
  llvm_cbe_tmp111_i = *(&(regmng.field18.field0));
  llvm_cbe_tmp114_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp111_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp114_i)))]) = llvm_cbe_tmp8081_i;
  llvm_cbe_tmp125_i26 = *(&(regmng.field18.field1.field1));
  llvm_cbe_tmp126_i27 = llvm_cbe_tmp125_i26 + ((unsigned int )-1);
  *(&(regmng.field18.field1.field1)) = llvm_cbe_tmp126_i27;
  llvm_cbe_tmp131_i = *(&(regmng.field18.field1.field0));
  llvm_cbe_tmp137_i = *(&llvm_cbe_tmp131_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp126_i27)))]);
  llvm_cbe_tmp144_i28 = *(&(regmng.field18.field2.field0));
  llvm_cbe_tmp147_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp144_i28[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp137_i)))]) = llvm_cbe_tmp147_i;
  llvm_cbe_tmp154_i31 = *(&(regmng.field18.field3.field0));
  llvm_cbe_tmp157_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp154_i31[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp157_i)))]) = llvm_cbe_tmp137_i;
  llvm_cbe_tmp163_i = *(&(regmng.field18.field4));
  *(&(regmng.field18.field4)) = (llvm_cbe_tmp163_i + ((unsigned int )1));
  *(((unsigned int *)llvm_cbe_tmp80_i)) = llvm_cbe_tmp137_i;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )90);
  _ZN6regobj6createEii(llvm_cbe_tmp8081_i, llvm_cbe_x_0429_i, llvm_cbe_y_0434_i);
  goto llvm_cbe_cond_next180_i;

llvm_cbe_cond_true72_i:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )90);
  llvm_cbe_tmp80_i = _Znwm(((unsigned long long )56ll));
  llvm_cbe_tmp8081_i = ((struct l_struct_2E_regobj *)llvm_cbe_tmp80_i);
  *(&llvm_cbe_tmp8081_i->field3) = (&regmng);
  llvm_cbe_tmp100_i25 = *(&(regmng.field18.field4));
  llvm_cbe_tmp103_i = *(&(regmng.field18.field5));
  if ((llvm_cbe_tmp100_i25 == llvm_cbe_tmp103_i)) {
    goto llvm_cbe_cond_true107_i;
  } else {
    goto llvm_cbe_cond_next_i32;
  }

llvm_cbe_cond_true107_i:
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )90);
  _ZN15largesolidarrayIP6regobjE8doublingEv();
  goto llvm_cbe_cond_next_i32;

  } while (1); /* end of syntactic loop 'bb6.i' */
  } while (1); /* end of syntactic loop 'bb183.preheader.i' */
llvm_cbe_bb202_i:
  llvm_cbe_tmp411426_rle_i = llvm_cbe_tmp411426_rle_i__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_tmp411426_rle_i) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe__ZN9regmngobj10addregionsEv_exit;
  } else {
    llvm_cbe_y215_0424_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb397_preheader_i;
  }

  do {     /* Syntactic loop 'bb397.preheader.i' to make GCC happy */
llvm_cbe_bb397_preheader_i:
  llvm_cbe_y215_0424_i = llvm_cbe_y215_0424_i__PHI_TEMPORARY;
  llvm_cbe_val331 = *(&cg_caller_id_var);
  llvm_cbe_val432 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )87);
  CallEdgeProfiler(llvm_cbe_val331, llvm_cbe_val432, ((unsigned int )87));
  llvm_cbe_tmp400422_i = *(&(regmng.field12));
  if ((((signed int )llvm_cbe_tmp400422_i) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb405_i;
  } else {
    llvm_cbe_x214_0420_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb217_i;
  }

llvm_cbe_bb405_i:
  llvm_cbe_tmp407_i = llvm_cbe_y215_0424_i + ((unsigned int )1);
  llvm_cbe_tmp411_i45 = *(&(regmng.field13));
  *(&cg_caller_call_site_var) = llvm_cbe_val432;
  *(&cg_caller_id_var) = llvm_cbe_val331;
  if ((((signed int )llvm_cbe_tmp411_i45) < ((signed int )llvm_cbe_tmp407_i))) {
    goto llvm_cbe__ZN9regmngobj10addregionsEv_exit;
  } else {
    llvm_cbe_y215_0424_i__PHI_TEMPORARY = llvm_cbe_tmp407_i;   /* for PHI node */
    goto llvm_cbe_bb397_preheader_i;
  }

  do {     /* Syntactic loop 'bb217.i' to make GCC happy */
llvm_cbe_bb217_i:
  llvm_cbe_x214_0420_i = llvm_cbe_x214_0420_i__PHI_TEMPORARY;
  llvm_cbe_val333 = *(&cg_caller_id_var);
  llvm_cbe_val434 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )88);
  CallEdgeProfiler(llvm_cbe_val333, llvm_cbe_val434, ((unsigned int )88));
  llvm_cbe_tmp227_i36 = *(&(regmng.field6));
  llvm_cbe_tmp230_i37 = *(&(regmng.field16));
  llvm_cbe_tmp234235_i = ((signed long long )(signed int )((llvm_cbe_tmp230_i37 * llvm_cbe_y215_0424_i) + llvm_cbe_x214_0420_i));
  llvm_cbe_tmp240_i38 = *(&llvm_cbe_tmp227_i36[((signed long long )llvm_cbe_tmp234235_i)]);
  if ((llvm_cbe_tmp240_i38 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true245_i;
  } else {
    goto llvm_cbe_cond_next394_i;
  }

llvm_cbe_cond_next394_i:
  llvm_cbe_tmp396_i = llvm_cbe_x214_0420_i + ((unsigned int )1);
  llvm_cbe_tmp400_i = *(&(regmng.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val434;
  *(&cg_caller_id_var) = llvm_cbe_val333;
  if ((((signed int )llvm_cbe_tmp400_i) < ((signed int )llvm_cbe_tmp396_i))) {
    goto llvm_cbe_bb405_i;
  } else {
    llvm_cbe_x214_0420_i__PHI_TEMPORARY = llvm_cbe_tmp396_i;   /* for PHI node */
    goto llvm_cbe_bb217_i;
  }

llvm_cbe_cond_true245_i:
  llvm_cbe_tmp255_i = *(&(regmng.field7));
  llvm_cbe_tmp265_i39 = *(&llvm_cbe_tmp255_i[((signed long long )llvm_cbe_tmp234235_i)]);
  llvm_cbe_tmp276_i = *(&regmng.field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp265_i39)))]);
  if ((llvm_cbe_tmp276_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_next394_i;
  } else {
    goto llvm_cbe_cond_true279_i;
  }

llvm_cbe_cond_next323_i:
  llvm_cbe_tmp326_i = *(&(regmng.field18.field0));
  llvm_cbe_tmp329_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp326_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp329_i)))]) = llvm_cbe_tmp290291_i;
  llvm_cbe_tmp340_i = *(&(regmng.field18.field1.field1));
  llvm_cbe_tmp341_i = llvm_cbe_tmp340_i + ((unsigned int )-1);
  *(&(regmng.field18.field1.field1)) = llvm_cbe_tmp341_i;
  llvm_cbe_tmp346_i42 = *(&(regmng.field18.field1.field0));
  llvm_cbe_tmp352_i = *(&llvm_cbe_tmp346_i42[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp341_i)))]);
  llvm_cbe_tmp359_i = *(&(regmng.field18.field2.field0));
  llvm_cbe_tmp362_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp359_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp352_i)))]) = llvm_cbe_tmp362_i;
  llvm_cbe_tmp369_i = *(&(regmng.field18.field3.field0));
  llvm_cbe_tmp372_i = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp369_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp372_i)))]) = llvm_cbe_tmp352_i;
  llvm_cbe_tmp378_i44 = *(&(regmng.field18.field4));
  *(&(regmng.field18.field4)) = (llvm_cbe_tmp378_i44 + ((unsigned int )1));
  *(((unsigned int *)llvm_cbe_tmp290_i)) = llvm_cbe_tmp352_i;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )88);
  _ZN6regobj6createEii(llvm_cbe_tmp290291_i, llvm_cbe_x214_0420_i, llvm_cbe_y215_0424_i);
  goto llvm_cbe_cond_next394_i;

llvm_cbe_cond_true279_i:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )88);
  llvm_cbe_tmp290_i = _Znwm(((unsigned long long )56ll));
  llvm_cbe_tmp290291_i = ((struct l_struct_2E_regobj *)llvm_cbe_tmp290_i);
  *(&llvm_cbe_tmp290291_i->field3) = (&regmng);
  llvm_cbe_tmp314_i = *(&(regmng.field18.field4));
  llvm_cbe_tmp317_i40 = *(&(regmng.field18.field5));
  if ((llvm_cbe_tmp314_i == llvm_cbe_tmp317_i40)) {
    goto llvm_cbe_cond_true321_i;
  } else {
    goto llvm_cbe_cond_next323_i;
  }

llvm_cbe_cond_true321_i:
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )88);
  _ZN15largesolidarrayIP6regobjE8doublingEv();
  goto llvm_cbe_cond_next323_i;

  } while (1); /* end of syntactic loop 'bb217.i' */
  } while (1); /* end of syntactic loop 'bb397.preheader.i' */
llvm_cbe__ZN9regmngobj10addregionsEv_exit:
  llvm_cbe_tmp80 = *(&(regmng.field12));
  llvm_cbe_tmp81 = llvm_cbe_tmp80 * ((unsigned int )5);
  *(&(regmng.field9)) = llvm_cbe_tmp81;
  *(&(regmng.field10)) = (llvm_cbe_tmp81 * llvm_cbe_tmp81);
  *(&cg_caller_call_site_var) = ((unsigned int )16);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj19defineneighborhood1Ev();
  llvm_cbe_tmp96 = *(&(regmng.field11));
  *(&cg_caller_call_site_var) = ((unsigned int )17);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj18enlargeneighborsesEi((((signed int )(((float )((((float )(llvm_cbe_tmp96 * 0x1.2cp+6))) * llvm_cbe_tmp96))))));
  *(&cg_caller_call_site_var) = ((unsigned int )18);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj19defineneighborhood1Ev();
  llvm_cbe_tmp107 = *(&(regmng.field11));
  llvm_cbe_tmp107108 = ((double )llvm_cbe_tmp107);
  *(&cg_caller_call_site_var) = ((unsigned int )19);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj18enlargeneighborsesEi((((signed int )((llvm_cbe_tmp107108 * 0x1.2cp+6) * llvm_cbe_tmp107108))));
  llvm_cbe_tmp309876 = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp309876) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb314;
  } else {
    llvm_cbe_y121_0_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb295_outer;
  }

  do {     /* Syntactic loop 'bb295.outer' to make GCC happy */
llvm_cbe_bb295_outer:
  llvm_cbe_y121_0_reg2mem_0_ph = llvm_cbe_y121_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_val327 = *(&cg_caller_id_var);
  llvm_cbe_val428 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )85);
  CallEdgeProfiler(llvm_cbe_val327, llvm_cbe_val428, ((unsigned int )85));
  llvm_cbe_tmp298915 = *(&(regmng.field12));
  if ((((signed int )llvm_cbe_tmp298915) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb306;
  } else {
    llvm_cbe_x120_0913__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb122;
  }

llvm_cbe_bb306:
  llvm_cbe_tmp305 = llvm_cbe_y121_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_tmp309 = *(&(regmng.field13));
  *(&cg_caller_call_site_var) = llvm_cbe_val428;
  *(&cg_caller_id_var) = llvm_cbe_val327;
  if ((((signed int )llvm_cbe_tmp309) < ((signed int )llvm_cbe_tmp305))) {
    goto llvm_cbe_bb314;
  } else {
    llvm_cbe_y121_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp305;   /* for PHI node */
    goto llvm_cbe_bb295_outer;
  }

  do {     /* Syntactic loop 'bb122' to make GCC happy */
llvm_cbe_bb122:
  llvm_cbe_x120_0913 = llvm_cbe_x120_0913__PHI_TEMPORARY;
  llvm_cbe_val329 = *(&cg_caller_id_var);
  llvm_cbe_val430 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )86);
  CallEdgeProfiler(llvm_cbe_val329, llvm_cbe_val430, ((unsigned int )86));
  llvm_cbe_tmp132 = *(&(regmng.field6));
  llvm_cbe_tmp135 = *(&(regmng.field16));
  llvm_cbe_tmp139140 = ((signed long long )(signed int )((llvm_cbe_tmp135 * llvm_cbe_y121_0_reg2mem_0_ph) + llvm_cbe_x120_0913));
  llvm_cbe_tmp145 = *(&llvm_cbe_tmp132[((signed long long )llvm_cbe_tmp139140)]);
  if ((llvm_cbe_tmp145 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true150;
  } else {
    goto llvm_cbe_cond_next292;
  }

llvm_cbe_cond_next292:
  llvm_cbe_tmp294 = llvm_cbe_x120_0913 + ((unsigned int )1);
  llvm_cbe_tmp298 = *(&(regmng.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val430;
  *(&cg_caller_id_var) = llvm_cbe_val329;
  if ((((signed int )llvm_cbe_tmp298) < ((signed int )llvm_cbe_tmp294))) {
    goto llvm_cbe_bb306;
  } else {
    llvm_cbe_x120_0913__PHI_TEMPORARY = llvm_cbe_tmp294;   /* for PHI node */
    goto llvm_cbe_bb122;
  }

llvm_cbe_cond_true150:
  llvm_cbe_tmp160 = *(&(regmng.field7));
  llvm_cbe_tmp170 = *(&llvm_cbe_tmp160[((signed long long )llvm_cbe_tmp139140)]);
  llvm_cbe_tmp181 = *(&regmng.field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp170)))]);
  if ((llvm_cbe_tmp181 == ((unsigned char )0))) {
    goto llvm_cbe_cond_next292;
  } else {
    goto llvm_cbe_cond_true184;
  }

llvm_cbe_cond_next221:
  llvm_cbe_tmp224 = *(&(regmng.field18.field0));
  llvm_cbe_tmp227 = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp224[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp227)))]) = llvm_cbe_tmp192193;
  llvm_cbe_tmp238 = *(&(regmng.field18.field1.field1));
  llvm_cbe_tmp239 = llvm_cbe_tmp238 + ((unsigned int )-1);
  *(&(regmng.field18.field1.field1)) = llvm_cbe_tmp239;
  llvm_cbe_tmp244 = *(&(regmng.field18.field1.field0));
  llvm_cbe_tmp250 = *(&llvm_cbe_tmp244[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp239)))]);
  llvm_cbe_tmp257 = *(&(regmng.field18.field2.field0));
  llvm_cbe_tmp260 = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp257[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp250)))]) = llvm_cbe_tmp260;
  llvm_cbe_tmp267 = *(&(regmng.field18.field3.field0));
  llvm_cbe_tmp270 = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp267[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp270)))]) = llvm_cbe_tmp250;
  llvm_cbe_tmp276 = *(&(regmng.field18.field4));
  *(&(regmng.field18.field4)) = (llvm_cbe_tmp276 + ((unsigned int )1));
  *(((unsigned int *)llvm_cbe_tmp192)) = llvm_cbe_tmp250;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )86);
  _ZN6regobj6createEii(llvm_cbe_tmp192193, llvm_cbe_x120_0913, llvm_cbe_y121_0_reg2mem_0_ph);
  goto llvm_cbe_cond_next292;

llvm_cbe_cond_true184:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )86);
  llvm_cbe_tmp192 = _Znwm(((unsigned long long )56ll));
  llvm_cbe_tmp192193 = ((struct l_struct_2E_regobj *)llvm_cbe_tmp192);
  *(&llvm_cbe_tmp192193->field3) = (&regmng);
  llvm_cbe_tmp212 = *(&(regmng.field18.field4));
  llvm_cbe_tmp215 = *(&(regmng.field18.field5));
  if ((llvm_cbe_tmp212 == llvm_cbe_tmp215)) {
    goto llvm_cbe_cond_true219;
  } else {
    goto llvm_cbe_cond_next221;
  }

llvm_cbe_cond_true219:
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )86);
  _ZN15largesolidarrayIP6regobjE8doublingEv();
  goto llvm_cbe_cond_next221;

  } while (1); /* end of syntactic loop 'bb122' */
  } while (1); /* end of syntactic loop 'bb295.outer' */
llvm_cbe_bb314:
  *(&cg_caller_call_site_var) = ((unsigned int )23);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj13deleteregionsEv();
  llvm_cbe_tmp400883 = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp400883) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb386_outer;
  } else {
    goto llvm_cbe_bb405;
  }

  do {     /* Syntactic loop 'bb386.outer' to make GCC happy */
llvm_cbe_bb386_outer:
  llvm_cbe_y_0_reg2mem_0_ph = llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_val39 = *(&cg_caller_id_var);
  llvm_cbe_val410 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )76);
  CallEdgeProfiler(llvm_cbe_val39, llvm_cbe_val410, ((unsigned int )76));
  llvm_cbe_tmp389934 = *(&(regmng.field12));
  if ((((signed int )llvm_cbe_tmp389934) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_x_0932__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb317;
  } else {
    goto llvm_cbe_bb397;
  }

llvm_cbe_bb397:
  llvm_cbe_tmp396 = llvm_cbe_y_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_tmp400 = *(&(regmng.field13));
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )llvm_cbe_tmp400) > ((signed int )llvm_cbe_tmp396))) {
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp396;   /* for PHI node */
    goto llvm_cbe_bb386_outer;
  } else {
    goto llvm_cbe_bb405;
  }

  do {     /* Syntactic loop 'bb317' to make GCC happy */
llvm_cbe_bb317:
  llvm_cbe_x_0932 = llvm_cbe_x_0932__PHI_TEMPORARY;
  llvm_cbe_val311 = *(&cg_caller_id_var);
  llvm_cbe_val412 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )77);
  CallEdgeProfiler(llvm_cbe_val311, llvm_cbe_val412, ((unsigned int )77));
  llvm_cbe_tmp327 = *(&(regmng.field6));
  llvm_cbe_tmp330 = *(&(regmng.field16));
  llvm_cbe_tmp334335 = ((signed long long )(signed int )((llvm_cbe_tmp330 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0932));
  llvm_cbe_tmp340 = *(&llvm_cbe_tmp327[((signed long long )llvm_cbe_tmp334335)]);
  if ((llvm_cbe_tmp340 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true345;
  } else {
    goto llvm_cbe_cond_next383;
  }

llvm_cbe_cond_next383:
  llvm_cbe_tmp385 = llvm_cbe_x_0932 + ((unsigned int )1);
  llvm_cbe_tmp389 = *(&(regmng.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val412;
  *(&cg_caller_id_var) = llvm_cbe_val311;
  if ((((signed int )llvm_cbe_tmp389) > ((signed int )llvm_cbe_tmp385))) {
    llvm_cbe_x_0932__PHI_TEMPORARY = llvm_cbe_tmp385;   /* for PHI node */
    goto llvm_cbe_bb317;
  } else {
    goto llvm_cbe_bb397;
  }

llvm_cbe_cond_true345:
  llvm_cbe_tmp355 = *(&(regmng.field7));
  llvm_cbe_tmp365 = *(&llvm_cbe_tmp355[((signed long long )llvm_cbe_tmp334335)]);
  llvm_cbe_tmp376 = *(&regmng.field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp365)))]);
  if ((llvm_cbe_tmp376 == ((unsigned char )0))) {
    goto llvm_cbe_cond_next383;
  } else {
    goto llvm_cbe_cond_true379;
  }

llvm_cbe_cond_true379:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )77);
  llvm_cbe_tmp381 = printf((&(_2E_str6[((signed long long )((unsigned long long )0ll))])));
  goto llvm_cbe_cond_next383;

  } while (1); /* end of syntactic loop 'bb317' */
  } while (1); /* end of syntactic loop 'bb386.outer' */
llvm_cbe_bb405:
  *(&cg_caller_call_site_var) = ((unsigned int )25);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj19defineneighborhood1Ev();
  *(&cg_caller_call_site_var) = ((unsigned int )26);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj20definemiddleregpointEv();
  llvm_cbe_tmp459889 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp459889) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i412_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb415;
  } else {
    llvm_cbe_tmp489929_rle__PHI_TEMPORARY = llvm_cbe_tmp459889;   /* for PHI node */
    goto llvm_cbe_bb485_preheader;
  }

  do {     /* Syntactic loop 'bb415' to make GCC happy */
llvm_cbe_bb415:
  llvm_cbe_i412_0_reg2mem_0 = llvm_cbe_i412_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val313 = *(&cg_caller_id_var);
  llvm_cbe_val414 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )78);
  CallEdgeProfiler(llvm_cbe_val313, llvm_cbe_val414, ((unsigned int )78));
  llvm_cbe_tmp423 = *(&(regmng.field18.field0));
  llvm_cbe_tmp430 = *(&llvm_cbe_tmp423[((signed long long )(((signed long long )(signed int )llvm_cbe_i412_0_reg2mem_0)))]);
  llvm_cbe_tmp433 = &llvm_cbe_tmp430->field5.field1;
  llvm_cbe_tmp434 = *llvm_cbe_tmp433;
  llvm_cbe_tmp437 = &llvm_cbe_tmp430->field5.field0;
  llvm_cbe_tmp438 = *llvm_cbe_tmp437;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )78);
  llvm_cbe_tmp440 = _ZN9regmngobj13findfreeplaceEiiRiS0_(llvm_cbe_tmp438, llvm_cbe_tmp434, (&llvm_cbe_x413), (&llvm_cbe_y414));
  if ((llvm_cbe_tmp440 == ((unsigned char )0))) {
    goto llvm_cbe_bb455;
  } else {
    goto llvm_cbe_cond_true443;
  }

llvm_cbe_bb455:
  llvm_cbe_tmp454 = llvm_cbe_i412_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp459 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val414;
  *(&cg_caller_id_var) = llvm_cbe_val313;
  if ((((signed int )llvm_cbe_tmp459) > ((signed int )llvm_cbe_tmp454))) {
    llvm_cbe_i412_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp454;   /* for PHI node */
    goto llvm_cbe_bb415;
  } else {
    llvm_cbe_tmp489929_rle__PHI_TEMPORARY = llvm_cbe_tmp459;   /* for PHI node */
    goto llvm_cbe_bb485_preheader;
  }

llvm_cbe_cond_true443:
  llvm_cbe_tmp444 = *(&llvm_cbe_x413);
  *llvm_cbe_tmp437 = llvm_cbe_tmp444;
  llvm_cbe_tmp448 = *(&llvm_cbe_y414);
  *llvm_cbe_tmp433 = llvm_cbe_tmp448;
  goto llvm_cbe_bb455;

  } while (1); /* end of syntactic loop 'bb415' */
  do {     /* Syntactic loop 'bb465' to make GCC happy */
llvm_cbe_bb465:
  llvm_cbe_i_0927 = llvm_cbe_i_0927__PHI_TEMPORARY;
  llvm_cbe_val315 = *(&cg_caller_id_var);
  llvm_cbe_val416 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )79);
  CallEdgeProfiler(llvm_cbe_val315, llvm_cbe_val416, ((unsigned int )79));
  llvm_cbe_tmp474 = *(&(regmng.field18.field0));
  llvm_cbe_tmp481 = *(&llvm_cbe_tmp474[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0927)))]);
  *(&llvm_cbe_tmp481->field2) = ((unsigned char )1);
  llvm_cbe_tmp484 = llvm_cbe_i_0927 + ((unsigned int )1);
  llvm_cbe_tmp489 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val416;
  *(&cg_caller_id_var) = llvm_cbe_val315;
  if ((((signed int )llvm_cbe_tmp489) > ((signed int )llvm_cbe_tmp484))) {
    llvm_cbe_i_0927__PHI_TEMPORARY = llvm_cbe_tmp484;   /* for PHI node */
    goto llvm_cbe_bb465;
  } else {
    goto llvm_cbe_bb494;
  }

  } while (1); /* end of syntactic loop 'bb465' */
llvm_cbe_bb485_preheader:
  llvm_cbe_tmp489929_rle = llvm_cbe_tmp489929_rle__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_tmp489929_rle) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0927__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb465;
  } else {
    goto llvm_cbe_bb494;
  }

llvm_cbe_bb494:
  llvm_cbe_tmp497 = *(&(regmng.field16));
  llvm_cbe_tmp500 = *(&(regmng.field17));
  llvm_cbe_tmp506 = *(&(regmng.field6));
  *(&cg_caller_call_site_var) = ((unsigned int )28);
  *(&cg_caller_id_var) = ((unsigned int )18);
  ltmp_79_2 = memset((((unsigned char *)llvm_cbe_tmp506)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )(llvm_cbe_tmp500 * llvm_cbe_tmp497))) << ((unsigned long long )3ll)));
  *(&cg_caller_call_site_var) = ((unsigned int )29);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj15redefineregionsEv();
  llvm_cbe_tmp562896 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp562896) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i513_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb514;
  } else {
    goto llvm_cbe_bb567;
  }

  do {     /* Syntactic loop 'bb514' to make GCC happy */
llvm_cbe_bb514:
  llvm_cbe_i513_0_reg2mem_0 = llvm_cbe_i513_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val317 = *(&cg_caller_id_var);
  llvm_cbe_val418 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )80);
  CallEdgeProfiler(llvm_cbe_val317, llvm_cbe_val418, ((unsigned int )80));
  llvm_cbe_tmp523 = *(&(regmng.field18.field0));
  llvm_cbe_tmp530 = *(&llvm_cbe_tmp523[((signed long long )(((signed long long )(signed int )llvm_cbe_i513_0_reg2mem_0)))]);
  llvm_cbe_tmp532 = *(&llvm_cbe_tmp530->field4);
  if ((llvm_cbe_tmp532 == ((unsigned int )0))) {
    goto llvm_cbe_cond_true537;
  } else {
    goto llvm_cbe_bb558;
  }

llvm_cbe_bb558:
  llvm_cbe_tmp557 = llvm_cbe_i513_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp562 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val418;
  *(&cg_caller_id_var) = llvm_cbe_val317;
  if ((((signed int )llvm_cbe_tmp562) > ((signed int )llvm_cbe_tmp557))) {
    llvm_cbe_i513_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp557;   /* for PHI node */
    goto llvm_cbe_bb514;
  } else {
    goto llvm_cbe_bb567;
  }

llvm_cbe_cond_true537:
  *(&llvm_cbe_tmp530->field1) = ((unsigned char )0);
  goto llvm_cbe_bb558;

  } while (1); /* end of syntactic loop 'bb514' */
llvm_cbe_bb567:
  *(&cg_caller_call_site_var) = ((unsigned int )30);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj13deleteregionsEv();
  llvm_cbe_tmp771904 = *(&(regmng.field13));
  if ((((signed int )llvm_cbe_tmp771904) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb776;
  } else {
    llvm_cbe_y575_0_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb757_outer;
  }

  do {     /* Syntactic loop 'bb757.outer' to make GCC happy */
llvm_cbe_bb757_outer:
  llvm_cbe_y575_0_reg2mem_0_ph = llvm_cbe_y575_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_val323 = *(&cg_caller_id_var);
  llvm_cbe_val424 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )83);
  CallEdgeProfiler(llvm_cbe_val323, llvm_cbe_val424, ((unsigned int )83));
  llvm_cbe_tmp760919 = *(&(regmng.field12));
  if ((((signed int )llvm_cbe_tmp760919) < ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb768;
  } else {
    llvm_cbe_x574_0917__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb577;
  }

llvm_cbe_bb768:
  llvm_cbe_tmp767 = llvm_cbe_y575_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_tmp771 = *(&(regmng.field13));
  *(&cg_caller_call_site_var) = llvm_cbe_val424;
  *(&cg_caller_id_var) = llvm_cbe_val323;
  if ((((signed int )llvm_cbe_tmp771) < ((signed int )llvm_cbe_tmp767))) {
    goto llvm_cbe_bb776;
  } else {
    llvm_cbe_y575_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp767;   /* for PHI node */
    goto llvm_cbe_bb757_outer;
  }

  do {     /* Syntactic loop 'bb577' to make GCC happy */
llvm_cbe_bb577:
  llvm_cbe_x574_0917 = llvm_cbe_x574_0917__PHI_TEMPORARY;
  llvm_cbe_val325 = *(&cg_caller_id_var);
  llvm_cbe_val426 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )84);
  CallEdgeProfiler(llvm_cbe_val325, llvm_cbe_val426, ((unsigned int )84));
  llvm_cbe_tmp587 = *(&(regmng.field6));
  llvm_cbe_tmp590 = *(&(regmng.field16));
  llvm_cbe_tmp594595 = ((signed long long )(signed int )((llvm_cbe_tmp590 * llvm_cbe_y575_0_reg2mem_0_ph) + llvm_cbe_x574_0917));
  llvm_cbe_tmp600 = *(&llvm_cbe_tmp587[((signed long long )llvm_cbe_tmp594595)]);
  if ((llvm_cbe_tmp600 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true605;
  } else {
    goto llvm_cbe_cond_next754;
  }

llvm_cbe_cond_next754:
  llvm_cbe_tmp756 = llvm_cbe_x574_0917 + ((unsigned int )1);
  llvm_cbe_tmp760 = *(&(regmng.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val426;
  *(&cg_caller_id_var) = llvm_cbe_val325;
  if ((((signed int )llvm_cbe_tmp760) < ((signed int )llvm_cbe_tmp756))) {
    goto llvm_cbe_bb768;
  } else {
    llvm_cbe_x574_0917__PHI_TEMPORARY = llvm_cbe_tmp756;   /* for PHI node */
    goto llvm_cbe_bb577;
  }

llvm_cbe_cond_true605:
  llvm_cbe_tmp615 = *(&(regmng.field7));
  llvm_cbe_tmp625 = *(&llvm_cbe_tmp615[((signed long long )llvm_cbe_tmp594595)]);
  llvm_cbe_tmp636 = *(&regmng.field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp625)))]);
  if ((llvm_cbe_tmp636 == ((unsigned char )0))) {
    goto llvm_cbe_cond_next754;
  } else {
    goto llvm_cbe_cond_true639;
  }

llvm_cbe_cond_next683:
  llvm_cbe_tmp686 = *(&(regmng.field18.field0));
  llvm_cbe_tmp689 = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp686[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp689)))]) = llvm_cbe_tmp650651;
  llvm_cbe_tmp700 = *(&(regmng.field18.field1.field1));
  llvm_cbe_tmp701 = llvm_cbe_tmp700 + ((unsigned int )-1);
  *(&(regmng.field18.field1.field1)) = llvm_cbe_tmp701;
  llvm_cbe_tmp706 = *(&(regmng.field18.field1.field0));
  llvm_cbe_tmp712 = *(&llvm_cbe_tmp706[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp701)))]);
  llvm_cbe_tmp719 = *(&(regmng.field18.field2.field0));
  llvm_cbe_tmp722 = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp719[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp712)))]) = llvm_cbe_tmp722;
  llvm_cbe_tmp729 = *(&(regmng.field18.field3.field0));
  llvm_cbe_tmp732 = *(&(regmng.field18.field4));
  *(&llvm_cbe_tmp729[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp732)))]) = llvm_cbe_tmp712;
  llvm_cbe_tmp738 = *(&(regmng.field18.field4));
  *(&(regmng.field18.field4)) = (llvm_cbe_tmp738 + ((unsigned int )1));
  *(((unsigned int *)llvm_cbe_tmp650)) = llvm_cbe_tmp712;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )84);
  _ZN6regobj6createEii(llvm_cbe_tmp650651, llvm_cbe_x574_0917, llvm_cbe_y575_0_reg2mem_0_ph);
  goto llvm_cbe_cond_next754;

llvm_cbe_cond_true639:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )84);
  llvm_cbe_tmp650 = _Znwm(((unsigned long long )56ll));
  llvm_cbe_tmp650651 = ((struct l_struct_2E_regobj *)llvm_cbe_tmp650);
  *(&llvm_cbe_tmp650651->field3) = (&regmng);
  llvm_cbe_tmp674 = *(&(regmng.field18.field4));
  llvm_cbe_tmp677 = *(&(regmng.field18.field5));
  if ((llvm_cbe_tmp674 == llvm_cbe_tmp677)) {
    goto llvm_cbe_cond_true681;
  } else {
    goto llvm_cbe_cond_next683;
  }

llvm_cbe_cond_true681:
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )84);
  _ZN15largesolidarrayIP6regobjE8doublingEv();
  goto llvm_cbe_cond_next683;

  } while (1); /* end of syntactic loop 'bb577' */
  } while (1); /* end of syntactic loop 'bb757.outer' */
llvm_cbe_bb776:
  *(&cg_caller_call_site_var) = ((unsigned int )34);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj19defineneighborhood1Ev();
  *(&cg_caller_call_site_var) = ((unsigned int )35);
  *(&cg_caller_id_var) = ((unsigned int )18);
  _ZN9regmngobj20definemiddleregpointEv();
  llvm_cbe_tmp832910 = *(&(regmng.field18.field4));
  if ((((signed int )llvm_cbe_tmp832910) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i784_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb787;
  } else {
    llvm_cbe_tmp865924_rle__PHI_TEMPORARY = llvm_cbe_tmp832910;   /* for PHI node */
    goto llvm_cbe_bb861_preheader;
  }

  do {     /* Syntactic loop 'bb787' to make GCC happy */
llvm_cbe_bb787:
  llvm_cbe_i784_0_reg2mem_0 = llvm_cbe_i784_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val319 = *(&cg_caller_id_var);
  llvm_cbe_val420 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )81);
  CallEdgeProfiler(llvm_cbe_val319, llvm_cbe_val420, ((unsigned int )81));
  llvm_cbe_tmp796 = *(&(regmng.field18.field0));
  llvm_cbe_tmp803 = *(&llvm_cbe_tmp796[((signed long long )(((signed long long )(signed int )llvm_cbe_i784_0_reg2mem_0)))]);
  llvm_cbe_tmp806 = &llvm_cbe_tmp803->field5.field1;
  llvm_cbe_tmp807 = *llvm_cbe_tmp806;
  llvm_cbe_tmp810 = &llvm_cbe_tmp803->field5.field0;
  llvm_cbe_tmp811 = *llvm_cbe_tmp810;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )81);
  llvm_cbe_tmp813 = _ZN9regmngobj13findfreeplaceEiiRiS0_(llvm_cbe_tmp811, llvm_cbe_tmp807, (&llvm_cbe_x785), (&llvm_cbe_y786));
  if ((llvm_cbe_tmp813 == ((unsigned char )0))) {
    goto llvm_cbe_bb828;
  } else {
    goto llvm_cbe_cond_true816;
  }

llvm_cbe_bb828:
  llvm_cbe_tmp827 = llvm_cbe_i784_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp832 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val420;
  *(&cg_caller_id_var) = llvm_cbe_val319;
  if ((((signed int )llvm_cbe_tmp832) > ((signed int )llvm_cbe_tmp827))) {
    llvm_cbe_i784_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp827;   /* for PHI node */
    goto llvm_cbe_bb787;
  } else {
    llvm_cbe_tmp865924_rle__PHI_TEMPORARY = llvm_cbe_tmp832;   /* for PHI node */
    goto llvm_cbe_bb861_preheader;
  }

llvm_cbe_cond_true816:
  llvm_cbe_tmp817 = *(&llvm_cbe_x785);
  *llvm_cbe_tmp810 = llvm_cbe_tmp817;
  llvm_cbe_tmp821 = *(&llvm_cbe_y786);
  *llvm_cbe_tmp806 = llvm_cbe_tmp821;
  goto llvm_cbe_bb828;

  } while (1); /* end of syntactic loop 'bb787' */
  do {     /* Syntactic loop 'bb838' to make GCC happy */
llvm_cbe_bb838:
  llvm_cbe_i_1922 = llvm_cbe_i_1922__PHI_TEMPORARY;
  llvm_cbe_val321 = *(&cg_caller_id_var);
  llvm_cbe_val422 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )82);
  CallEdgeProfiler(llvm_cbe_val321, llvm_cbe_val422, ((unsigned int )82));
  llvm_cbe_tmp847 = *(&(regmng.field18.field0));
  llvm_cbe_tmp854 = *(&llvm_cbe_tmp847[((signed long long )(((signed long long )(signed int )llvm_cbe_i_1922)))]);
  llvm_cbe_tmp857 = *(&(regmng.field5));
  *(&llvm_cbe_tmp854->field7) = llvm_cbe_tmp857;
  llvm_cbe_tmp860 = llvm_cbe_i_1922 + ((unsigned int )1);
  llvm_cbe_tmp865 = *(&(regmng.field18.field4));
  *(&cg_caller_call_site_var) = llvm_cbe_val422;
  *(&cg_caller_id_var) = llvm_cbe_val321;
  if ((((signed int )llvm_cbe_tmp865) > ((signed int )llvm_cbe_tmp860))) {
    llvm_cbe_i_1922__PHI_TEMPORARY = llvm_cbe_tmp860;   /* for PHI node */
    goto llvm_cbe_bb838;
  } else {
    goto llvm_cbe_return;
  }

  } while (1); /* end of syntactic loop 'bb838' */
llvm_cbe_bb861_preheader:
  llvm_cbe_tmp865924_rle = llvm_cbe_tmp865924_rle__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_tmp865924_rle) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_1922__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb838;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static unsigned char _ZN7way2obj9createwayEiiiiPhRP6pointtRi(unsigned int llvm_cbe_startx, unsigned int llvm_cbe_starty, unsigned int llvm_cbe_endx, unsigned int llvm_cbe_endy, unsigned char *llvm_cbe_movetimearp, struct l_struct_2E_pointt **llvm_cbe_wayar, unsigned int *llvm_cbe_waylength) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned long long llvm_cbe_tmp1516;
  unsigned char llvm_cbe_tmp18;
  unsigned int llvm_cbe_indvar_next;
  unsigned char *ltmp_80_2;
  unsigned int llvm_cbe_i_0_reg2mem_0_i;
  unsigned int llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar_next328_i;
  unsigned short llvm_cbe_tmp19_i;
  unsigned short llvm_cbe_tmp20_i;
  unsigned int llvm_cbe_tmp32_i;
  unsigned int llvm_cbe_tmp35_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp41_i;
  unsigned char *ltmp_81_2;
  unsigned int llvm_cbe_tmp62_i;
  unsigned int llvm_cbe_tmp65_i;
  unsigned int llvm_cbe_tmp76_i;
  unsigned char *ltmp_82_2;
  struct l_struct_2E_pointt *ltmp_83_5;
  struct l_struct_2E_pointt *llvm_cbe_tmp99_i;
  unsigned char *ltmp_84_2;
  struct l_struct_2E_pointt *llvm_cbe_tmp106_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp118_i;
  unsigned int llvm_cbe_tmp121_i;
  unsigned long long llvm_cbe_tmp121129_i;
  unsigned int llvm_cbe_tmp139_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp145_i;
  unsigned int llvm_cbe_tmp148_i;
  unsigned char llvm_cbe_tmp276303_i;
  unsigned int llvm_cbe_tmp164_i;
  unsigned long long llvm_cbe_tmp174177_i;
  unsigned int llvm_cbe_tmp180_i;
  unsigned int llvm_cbe_tmp188_i;
  unsigned int llvm_cbe_tmp270307_i;
  unsigned int llvm_cbe_i171_0316_i;
  unsigned int llvm_cbe_tmp324_i;
  unsigned int llvm_cbe_tmp227_rle_i;
  unsigned int llvm_cbe_tmp227_rle_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar_i;
  unsigned int llvm_cbe_indvar_i__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp206209_reg2mem_0_i;
  unsigned long long llvm_cbe_tmp206209_reg2mem_0_i__PHI_TEMPORARY;
  struct l_struct_2E_pointt *llvm_cbe_tmp216_i;
  unsigned long long llvm_cbe_tmp217218_i;
  unsigned int llvm_cbe_tmp224_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp238_i;
  unsigned int llvm_cbe_tmp246_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp7_i_i;
  unsigned int llvm_cbe_tmp10_i_i;
  unsigned short *llvm_cbe_tmp17_i_i;
  unsigned short llvm_cbe_tmp18_i_i;
  unsigned short llvm_cbe_tmp21_i_i;
  unsigned int llvm_cbe_tmp41_i_i;
  unsigned int llvm_cbe_tmp43_i_i;
  unsigned int llvm_cbe_tmp45_i_i;
  unsigned int llvm_cbe_tmp47_i_i;
  unsigned int llvm_cbe_x1_0_i_i;
  unsigned int llvm_cbe_y1_0_i_i;
  unsigned int llvm_cbe_tmp62_i_i;
  unsigned int llvm_cbe_x2_0_i_i;
  unsigned int llvm_cbe_tmp74_i_i;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph_i_i;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph_i_i;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mindist_1_ph_i_i;
  unsigned int llvm_cbe_mindist_1_ph_i_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flcenter_1_ph_i_i;
  unsigned char llvm_cbe_flcenter_1_ph_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar553_i_i;
  unsigned int llvm_cbe_indvar553_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mindist_1_reg2mem_0_i_i;
  unsigned int llvm_cbe_mindist_1_reg2mem_0_i_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flcenter_1_reg2mem_0_i_i;
  unsigned char llvm_cbe_flcenter_1_reg2mem_0_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0_i_i;
  struct l_struct_2E_point16t *llvm_cbe_tmp103_i_i;
  unsigned int llvm_cbe_tmp106_i_i;
  unsigned long long llvm_cbe_tmp110111_i_i;
  unsigned short llvm_cbe_tmp114_i_i;
  unsigned short llvm_cbe_tmp117_i_i;
  unsigned short llvm_cbe_tmp135_i_i;
  unsigned int llvm_cbe_tmp135136_i_i;
  unsigned int llvm_cbe_indvar_next554_i_i;
  unsigned int llvm_cbe_tmp164_rle_i_i;
  unsigned int llvm_cbe_tmp164_rle_i_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flcenter_1_reg2mem_0_lcssa520_us_lcssa_i_i;
  unsigned char llvm_cbe_flcenter_1_reg2mem_0_lcssa520_us_lcssa_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mindist_1_reg2mem_0_lcssa517_us_lcssa_i_i;
  unsigned int llvm_cbe_mindist_1_reg2mem_0_lcssa517_us_lcssa_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i;
  unsigned int llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i__PHI_TEMPORARY;
  unsigned char *llvm_cbe_tmp161_i_i;
  unsigned char llvm_cbe_tmp171_i_i;
  unsigned char llvm_cbe_tmp177_i_i;
  unsigned int llvm_cbe_tmp207_i_i;
  unsigned long long llvm_cbe_tmp248251_i_i;
  unsigned int *llvm_cbe_tmp256_i_i;
  unsigned int llvm_cbe_tmp257_i_i;
  unsigned int *llvm_cbe_tmp259_i_i;
  unsigned int llvm_cbe_tmp260_i_i;
  unsigned int llvm_cbe_tmp271_i_i;
  unsigned char *ltmp_85_2;
  struct l_struct_2E_pointt *ltmp_86_5;
  struct l_struct_2E_pointt **llvm_cbe_tmp293_i_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp294_i_i;
  unsigned char *ltmp_87_2;
  struct l_struct_2E_pointt *llvm_cbe_tmp301_i_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp313_i_i;
  unsigned int llvm_cbe_tmp316_i_i;
  unsigned long long llvm_cbe_tmp316324_i_i;
  unsigned int llvm_cbe_tmp334_i_i;
  unsigned char llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i;
  unsigned char llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i;
  unsigned int llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0_lcssa515_i_i;
  unsigned int llvm_cbe_x_0_reg2mem_0_lcssa515_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp342_i_i;
  unsigned int llvm_cbe_x_0_i_i;
  unsigned int llvm_cbe_x_0_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mindist_1_i_i;
  unsigned int llvm_cbe_mindist_1_i_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flcenter_1_i_i;
  unsigned char llvm_cbe_flcenter_1_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val39;
  unsigned int llvm_cbe_val410;
  struct l_struct_2E_point16t *llvm_cbe_tmp103_us_i_i;
  unsigned int llvm_cbe_tmp106_us_i_i;
  unsigned int llvm_cbe_tmp108_us_i_i;
  unsigned short llvm_cbe_tmp117_us_i_i;
  unsigned int llvm_cbe_indvar_i_i;
  unsigned int llvm_cbe_indvar_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mindist_1_reg2mem_0_us_i_i;
  unsigned int llvm_cbe_mindist_1_reg2mem_0_us_i_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flcenter_1_reg2mem_0_us_i_i;
  unsigned char llvm_cbe_flcenter_1_reg2mem_0_us_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0_reg2mem_0_us_i_i;
  unsigned long long llvm_cbe_tmp110111_us_i_i;
  unsigned short llvm_cbe_tmp114_us_i_i;
  unsigned int llvm_cbe_indvar_next_i_i;
  unsigned short llvm_cbe_tmp135_us_i_i;
  unsigned int llvm_cbe_tmp135136_us_i_i;
  unsigned int llvm_cbe_mindist_1_reg2mem_1_i_i;
  unsigned int llvm_cbe_mindist_1_reg2mem_1_i_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flcenter_1_reg2mem_1_i_i;
  unsigned char llvm_cbe_flcenter_1_reg2mem_1_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp351_i_i;
  unsigned int llvm_cbe_y2_0_i_i;
  unsigned int llvm_cbe_y2_0_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_i_i;
  unsigned int llvm_cbe_y_0_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mindist_2_i_i;
  unsigned int llvm_cbe_mindist_2_i_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flcenter_2_i_i;
  unsigned char llvm_cbe_flcenter_2_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mindist_2_reg2mem_0_i_i;
  unsigned int llvm_cbe_mindist_2_reg2mem_0_i_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flcenter_2_reg2mem_0_i_i;
  unsigned char llvm_cbe_flcenter_2_reg2mem_0_i_i__PHI_TEMPORARY;
  struct l_struct_2E_point16t *llvm_cbe_tmp367_i_i;
  unsigned int llvm_cbe_tmp370_i_i;
  unsigned long long llvm_cbe_tmp374375_i_i;
  unsigned char *llvm_cbe_tmp386_i_i;
  unsigned char llvm_cbe_tmp396_i_i;
  unsigned char llvm_cbe_tmp402_i_i;
  unsigned short llvm_cbe_tmp406407408_i_i;
  unsigned int llvm_cbe_tmp462510_i_i;
  unsigned int llvm_cbe_tmp462_i_i;
  unsigned int llvm_cbe_tmp470_i_i;
  unsigned int llvm_cbe_tmp206_i;
  unsigned long long llvm_cbe_tmp206209_i;
  unsigned int llvm_cbe_indvar_next_i;
  unsigned int llvm_cbe__promoted24_rle25;
  unsigned int llvm_cbe__promoted24_rle25__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp206209_reg2mem_1_i;
  unsigned long long llvm_cbe_tmp206209_reg2mem_1_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp269_i;
  unsigned int llvm_cbe_tmp270_i;
  unsigned char llvm_cbe_tmp276_i;
  unsigned int llvm_cbe__promoted24_rle;
  unsigned int llvm_cbe__promoted24_rle__PHI_TEMPORARY;
  unsigned int llvm_cbe__promoted23_rle;
  unsigned int llvm_cbe__promoted23_rle__PHI_TEMPORARY;
  unsigned char llvm_cbe_tmp276310_rle_i_ph;
  unsigned char llvm_cbe_tmp276310_rle_i_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp163_rle_i_ph;
  unsigned int llvm_cbe_tmp163_rle_i_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe__promoted;
  unsigned int llvm_cbe__tmp22_0;
  unsigned int llvm_cbe__tmp22_0__PHI_TEMPORARY;
  unsigned int llvm_cbe__tmp21_0;
  unsigned int llvm_cbe__tmp21_0__PHI_TEMPORARY;
  unsigned int llvm_cbe__tmp_0;
  unsigned int llvm_cbe__tmp_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp163_rle_i;
  unsigned int llvm_cbe_tmp163_rle_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val35;
  unsigned int llvm_cbe_val46;
  unsigned int llvm_cbe__tmp22_1;
  unsigned int llvm_cbe__tmp22_1__PHI_TEMPORARY;
  unsigned int llvm_cbe__tmp21_1;
  unsigned int llvm_cbe__tmp21_1__PHI_TEMPORARY;
  unsigned int llvm_cbe__tmp_1;
  unsigned int llvm_cbe__tmp_1__PHI_TEMPORARY;
  unsigned char llvm_cbe_tmp292_rle_i;
  unsigned char llvm_cbe_tmp292_rle_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp15_i;
  unsigned char *ltmp_88_2;
  unsigned char *ltmp_89_2;
  unsigned int llvm_cbe_tmp35_i1;
  unsigned int llvm_cbe_tmp38_i2;
  unsigned int llvm_cbe_tmp53_i;
  unsigned char *ltmp_90_2;
  unsigned char *ltmp_91_2;
  unsigned char *ltmp_92_2;
  unsigned char *llvm_cbe_wayar_0_2_in_i;
  unsigned char *llvm_cbe_wayar_0_2_in_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_wayar_2_2_i;
  unsigned int llvm_cbe_wayar_2_2_i__PHI_TEMPORARY;
  struct l_struct_2E_pointt *llvm_cbe_wayar_0_2_i;
  unsigned int llvm_cbe_tmp115_i;
  unsigned long long llvm_cbe_tmp121122_i;
  unsigned int llvm_cbe_tmp128_i;
  unsigned int llvm_cbe_tmp129_i;
  unsigned int llvm_cbe_tmp144_i;
  unsigned int llvm_cbe_tmp145_i4;
  unsigned int llvm_cbe_tmp161_i;
  unsigned int llvm_cbe_tmp177_i;
  unsigned int llvm_cbe_x1_0_i;
  unsigned int llvm_cbe_y1_0_i;
  unsigned int llvm_cbe_tmp192_i;
  unsigned int llvm_cbe_x2_0_i;
  unsigned int llvm_cbe_tmp204_i;
  unsigned int llvm_cbe_val418_rle8;
  unsigned int llvm_cbe_val418_rle8__PHI_TEMPORARY;
  unsigned int llvm_cbe_val317_rle5;
  unsigned int llvm_cbe_val317_rle5__PHI_TEMPORARY;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph_i;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph_i;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mx_1_ph_i;
  unsigned int llvm_cbe_mx_1_ph_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_my_1_ph_i;
  unsigned int llvm_cbe_my_1_ph_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mind_1_ph_i;
  unsigned int llvm_cbe_mind_1_ph_i__PHI_TEMPORARY;
  struct l_struct_2E_point16t *llvm_cbe_tmp220_i;
  unsigned int llvm_cbe_tmp225_i;
  unsigned short llvm_cbe_tmp234_i;
  unsigned int llvm_cbe_indvar658_i;
  unsigned int llvm_cbe_indvar658_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mind_1646_i;
  unsigned int llvm_cbe_mind_1646_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_my_1644_i;
  unsigned int llvm_cbe_my_1644_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mx_1643_i;
  unsigned int llvm_cbe_mx_1643_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_x_0645_i;
  unsigned long long llvm_cbe_tmp227228_i;
  unsigned short llvm_cbe_tmp231_i;
  unsigned short llvm_cbe_tmp252_i;
  unsigned int llvm_cbe_tmp252253_i;
  unsigned int llvm_cbe_tmp298_i;
  unsigned int llvm_cbe_tmp300_i;
  unsigned int llvm_cbe_tmp310_i;
  unsigned int llvm_cbe_tmp312_i;
  unsigned int llvm_cbe_tmp327_i;
  unsigned int llvm_cbe_tmp339_i;
  unsigned int llvm_cbe_mx_0_i;
  unsigned int llvm_cbe_mx_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_my_0_i;
  unsigned int llvm_cbe_my_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mind_0_i;
  unsigned int llvm_cbe_mind_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar_next659_i;
  unsigned int llvm_cbe_mind_1_lcssa_i;
  unsigned int llvm_cbe_mind_1_lcssa_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_my_1_lcssa_i;
  unsigned int llvm_cbe_my_1_lcssa_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mx_1_lcssa_i;
  unsigned int llvm_cbe_mx_1_lcssa_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp372_i;
  unsigned int llvm_cbe_val418_rle9;
  unsigned int llvm_cbe_val418_rle9__PHI_TEMPORARY;
  unsigned int llvm_cbe_val317_rle6;
  unsigned int llvm_cbe_val317_rle6__PHI_TEMPORARY;
  unsigned int llvm_cbe_y2_0_i;
  unsigned int llvm_cbe_y2_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mx_2_i;
  unsigned int llvm_cbe_mx_2_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_my_2_i;
  unsigned int llvm_cbe_my_2_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_i;
  unsigned int llvm_cbe_y_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mind_2_i;
  unsigned int llvm_cbe_mind_2_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mx_2_reg2mem_0_i;
  unsigned int llvm_cbe_mx_2_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_my_2_reg2mem_0_i;
  unsigned int llvm_cbe_my_2_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp410_i;
  unsigned char *ltmp_93_2;
  struct l_struct_2E_pointt *ltmp_94_5;
  unsigned char *ltmp_95_2;
  struct l_struct_2E_pointt *llvm_cbe_wayar_0_0_i;
  struct l_struct_2E_pointt *llvm_cbe_wayar_0_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_wayar_2_0_i;
  unsigned int llvm_cbe_wayar_2_0_i__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp451459_i;
  unsigned int llvm_cbe_tmp473_i;
  unsigned int llvm_cbe_tmp481_i;
  unsigned char llvm_cbe_flfinish_0_i;
  unsigned char llvm_cbe_flfinish_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_index_0_reg2mem_0_i;
  unsigned int llvm_cbe_index_0_reg2mem_0_i__PHI_TEMPORARY;
  struct l_struct_2E_pointt *llvm_cbe_wayar_0_1_reg2mem_0_i;
  struct l_struct_2E_pointt *llvm_cbe_wayar_0_1_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_wayar_2_1_reg2mem_0_i;
  unsigned int llvm_cbe_wayar_2_1_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_mx_3_reg2mem_0_i;
  unsigned int llvm_cbe_mx_3_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_my_3_reg2mem_0_i;
  unsigned int llvm_cbe_my_3_reg2mem_0_i__PHI_TEMPORARY;
  unsigned char llvm_cbe_flfinish_0_reg2mem_0_i;
  unsigned char llvm_cbe_flfinish_0_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val315;
  unsigned int llvm_cbe_val416;
  unsigned int llvm_cbe_wayar_1_0_reg2mem_0_i;
  unsigned int llvm_cbe_tmp499_i;
  unsigned int llvm_cbe_tmp502_i;
  unsigned int llvm_cbe_tmp469_i;
  struct l_struct_2E_pointt *llvm_cbe_wayar_0_1_reg2mem_1_i;
  struct l_struct_2E_pointt *llvm_cbe_wayar_0_1_reg2mem_1_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_wayar_1_0_reg2mem_1_i;
  unsigned int llvm_cbe_wayar_1_0_reg2mem_1_i__PHI_TEMPORARY;
  unsigned char *ltmp_96_2;
  unsigned int llvm_cbe_i_0640_i;
  unsigned int llvm_cbe_tmp655_i;
  unsigned int llvm_cbe_indvar_i10;
  unsigned int llvm_cbe_indvar_i10__PHI_TEMPORARY;
  struct l_struct_2E_pointt *llvm_cbe_tmp536_i;
  unsigned long long llvm_cbe_tmp547548_i;
  unsigned int llvm_cbe_tmp555_i;
  unsigned int llvm_cbe_tmp558_i;
  unsigned long long llvm_cbe_tmp541559_i;
  unsigned int llvm_cbe_indvar_next_i12;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )19);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )19));
  *(&(way2.field10)) = llvm_cbe_startx;
  *(&(way2.field11)) = llvm_cbe_starty;
  *(&(way2.field8)) = llvm_cbe_endx;
  *(&(way2.field9)) = llvm_cbe_endy;
  llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )91);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )91));
  llvm_cbe_tmp1516 = ((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0);
  llvm_cbe_tmp18 = *(&llvm_cbe_movetimearp[((signed long long )llvm_cbe_tmp1516)]);
  *(&way2.field3[((signed long long )llvm_cbe_tmp1516)]) = llvm_cbe_tmp18;
  llvm_cbe_indvar_next = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next == ((unsigned int )256))) {
    goto llvm_cbe_bb29;
  } else {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb;
  }

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_bb29:
  if (((llvm_cbe_starty == llvm_cbe_endy) & (llvm_cbe_startx == llvm_cbe_endx))) {
    goto llvm_cbe_cond_true;
  } else {
    llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb_i;
  }

llvm_cbe_cond_true:
  ltmp_80_2 =  /*tail*/ malloc(((unsigned long long )8ll));
  *llvm_cbe_wayar = (((struct l_struct_2E_pointt *)ltmp_80_2));
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )1);
  do {     /* Syntactic loop 'bb.i' to make GCC happy */
llvm_cbe_bb_i:
  llvm_cbe_i_0_reg2mem_0_i = llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )92);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )92));
  *(&way2.field4[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i)))].field1) = ((unsigned int )0);
  llvm_cbe_indvar_next328_i = llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_indvar_next328_i == ((unsigned int )256))) {
    goto llvm_cbe_bb16_i;
  } else {
    llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_indvar_next328_i;   /* for PHI node */
    goto llvm_cbe_bb_i;
  }

  } while (1); /* end of syntactic loop 'bb.i' */
llvm_cbe_bb16_i:
  llvm_cbe_tmp19_i = *(&(way2.field2));
  llvm_cbe_tmp20_i = ((unsigned short )(llvm_cbe_tmp19_i + ((unsigned short )1)));
  *(&(way2.field2)) = llvm_cbe_tmp20_i;
  if ((llvm_cbe_tmp20_i == ((unsigned short )-1))) {
    goto llvm_cbe_cond_true_i;
  } else {
    goto llvm_cbe_cond_next_i;
  }

llvm_cbe_cond_true_i:
  llvm_cbe_tmp32_i = *(&(way2.field17));
  llvm_cbe_tmp35_i = *(&(way2.field18));
  llvm_cbe_tmp41_i = *(&(way2.field1));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )19);
  ltmp_81_2 = memset((((unsigned char *)llvm_cbe_tmp41_i)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )(llvm_cbe_tmp35_i * llvm_cbe_tmp32_i))) << ((unsigned long long )2ll)));
  *(&(way2.field2)) = ((unsigned short )1);
  goto llvm_cbe_cond_next_i;

llvm_cbe_cond_next_i:
  *(&(way2.field12)) = ((unsigned char )0);
  *(&(way2.field6)) = ((unsigned int )0);
  llvm_cbe_tmp62_i = *(&(way2.field4[((signed int )((unsigned int )0))].field1));
  llvm_cbe_tmp65_i = *(&(way2.field4[((signed int )((unsigned int )0))].field2));
  if ((llvm_cbe_tmp62_i == llvm_cbe_tmp65_i)) {
    goto llvm_cbe_cond_true69_i;
  } else {
    goto llvm_cbe_cond_next115_i;
  }

llvm_cbe_cond_true69_i:
  llvm_cbe_tmp76_i = llvm_cbe_tmp65_i << ((unsigned int )1);
  ltmp_82_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp76_i)) * ((unsigned long long )8ll)));
  ltmp_83_5 = ((struct l_struct_2E_pointt *)ltmp_82_2);
  llvm_cbe_tmp99_i = *(&(way2.field4[((signed int )((unsigned int )0))].field0));
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )19);
  ltmp_84_2 = memcpy((((unsigned char *)ltmp_83_5)), (((unsigned char *)llvm_cbe_tmp99_i)), ((((signed long long )(signed int )llvm_cbe_tmp65_i)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp106_i = *(&(way2.field4[((signed int )((unsigned int )0))].field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp106_i)));
  *(&(way2.field4[((signed int )((unsigned int )0))].field0)) = ltmp_83_5;
  *(&(way2.field4[((signed int )((unsigned int )0))].field2)) = llvm_cbe_tmp76_i;
  goto llvm_cbe_cond_next115_i;

llvm_cbe_cond_next115_i:
  llvm_cbe_tmp118_i = *(&(way2.field4[((signed int )((unsigned int )0))].field0));
  llvm_cbe_tmp121_i = *(&(way2.field4[((signed int )((unsigned int )0))].field1));
  llvm_cbe_tmp121129_i = ((signed long long )(signed int )llvm_cbe_tmp121_i);
  *(&llvm_cbe_tmp118_i[((signed long long )llvm_cbe_tmp121129_i)].field0) = llvm_cbe_startx;
  *(&llvm_cbe_tmp118_i[((signed long long )llvm_cbe_tmp121129_i)].field1) = llvm_cbe_starty;
  llvm_cbe_tmp139_i = *(&(way2.field4[((signed int )((unsigned int )0))].field1));
  *(&(way2.field4[((signed int )((unsigned int )0))].field1)) = (llvm_cbe_tmp139_i + ((unsigned int )1));
  llvm_cbe_tmp145_i = *(&(way2.field1));
  llvm_cbe_tmp148_i = *(&(way2.field17));
  *(&llvm_cbe_tmp145_i[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp148_i * llvm_cbe_starty) + llvm_cbe_startx))))].field1) = ((unsigned short )0);
  *(&(way2.field5)) = ((unsigned int )0);
  *(&(way2.field7)) = ((unsigned int )0);
  llvm_cbe_tmp276303_i = *(&(way2.field12));
  if ((llvm_cbe_tmp276303_i == ((unsigned char )0))) {
    llvm_cbe__promoted24_rle__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe__promoted23_rle__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_tmp276310_rle_i_ph__PHI_TEMPORARY = llvm_cbe_tmp276303_i;   /* for PHI node */
    llvm_cbe_tmp163_rle_i_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_cond_next282_i_outer;
  } else {
    llvm_cbe_tmp292_rle_i__PHI_TEMPORARY = llvm_cbe_tmp276303_i;   /* for PHI node */
    goto llvm_cbe__ZN7way2obj4fillEii_exit;
  }

  do {     /* Syntactic loop 'cond_next282.i.outer' to make GCC happy */
llvm_cbe_cond_next282_i_outer:
  llvm_cbe__promoted24_rle = llvm_cbe__promoted24_rle__PHI_TEMPORARY;
  llvm_cbe__promoted23_rle = llvm_cbe__promoted23_rle__PHI_TEMPORARY;
  llvm_cbe_tmp276310_rle_i_ph = llvm_cbe_tmp276310_rle_i_ph__PHI_TEMPORARY;
  llvm_cbe_tmp163_rle_i_ph = llvm_cbe_tmp163_rle_i_ph__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )93);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )93));
  llvm_cbe__promoted = *(&(way2.field6));
  llvm_cbe__tmp22_0__PHI_TEMPORARY = llvm_cbe__promoted24_rle;   /* for PHI node */
  llvm_cbe__tmp21_0__PHI_TEMPORARY = llvm_cbe__promoted23_rle;   /* for PHI node */
  llvm_cbe__tmp_0__PHI_TEMPORARY = llvm_cbe__promoted;   /* for PHI node */
  llvm_cbe_tmp163_rle_i__PHI_TEMPORARY = llvm_cbe_tmp163_rle_i_ph;   /* for PHI node */
  goto llvm_cbe_cond_next282_i;

llvm_cbe_bb255_i:
  llvm_cbe__promoted24_rle25 = llvm_cbe__promoted24_rle25__PHI_TEMPORARY;
  llvm_cbe_tmp206209_reg2mem_1_i = llvm_cbe_tmp206209_reg2mem_1_i__PHI_TEMPORARY;
  *(&way2.field4[((signed long long )llvm_cbe_tmp206209_reg2mem_1_i)].field1) = ((unsigned int )0);
  llvm_cbe_tmp269_i = *(&(way2.field7));
  llvm_cbe_tmp270_i = llvm_cbe_tmp269_i + ((unsigned int )1);
  *(&(way2.field7)) = llvm_cbe_tmp270_i;
  llvm_cbe_tmp276_i = *(&(way2.field12));
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((llvm_cbe_tmp276_i == ((unsigned char )0))) {
    llvm_cbe__promoted24_rle__PHI_TEMPORARY = llvm_cbe__promoted24_rle25;   /* for PHI node */
    llvm_cbe__promoted23_rle__PHI_TEMPORARY = llvm_cbe_tmp270_i;   /* for PHI node */
    llvm_cbe_tmp276310_rle_i_ph__PHI_TEMPORARY = llvm_cbe_tmp276_i;   /* for PHI node */
    llvm_cbe_tmp163_rle_i_ph__PHI_TEMPORARY = llvm_cbe_tmp270_i;   /* for PHI node */
    goto llvm_cbe_cond_next282_i_outer;
  } else {
    llvm_cbe_tmp292_rle_i__PHI_TEMPORARY = llvm_cbe_tmp276_i;   /* for PHI node */
    goto llvm_cbe__ZN7way2obj4fillEii_exit;
  }

llvm_cbe_cond_false_i:
  *(&(way2.field7)) = llvm_cbe__tmp21_0;
  *(&(way2.field5)) = llvm_cbe_tmp164_i;
  *(&(way2.field6)) = ((unsigned int )0);
  llvm_cbe_i171_0316_i = llvm_cbe_tmp180_i + ((unsigned int )-1);
  if ((((signed int )llvm_cbe_i171_0316_i) > ((signed int )((unsigned int )-1)))) {
    goto llvm_cbe_bb203_preheader_i;
  } else {
    llvm_cbe__promoted24_rle25__PHI_TEMPORARY = llvm_cbe_tmp164_i;   /* for PHI node */
    llvm_cbe_tmp206209_reg2mem_1_i__PHI_TEMPORARY = llvm_cbe_tmp174177_i;   /* for PHI node */
    goto llvm_cbe_bb255_i;
  }

  do {     /* Syntactic loop 'cond_next282.i' to make GCC happy */
llvm_cbe_cond_next282_i:
  llvm_cbe__tmp22_0 = llvm_cbe__tmp22_0__PHI_TEMPORARY;
  llvm_cbe__tmp21_0 = llvm_cbe__tmp21_0__PHI_TEMPORARY;
  llvm_cbe__tmp_0 = llvm_cbe__tmp_0__PHI_TEMPORARY;
  llvm_cbe_tmp163_rle_i = llvm_cbe_tmp163_rle_i__PHI_TEMPORARY;
  llvm_cbe_val35 = *(&cg_caller_id_var);
  llvm_cbe_val46 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )94);
  CallEdgeProfiler(llvm_cbe_val35, llvm_cbe_val46, ((unsigned int )94));
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((((signed int )llvm_cbe__tmp_0) < ((signed int )((unsigned int )265)))) {
    goto llvm_cbe_bb160_i;
  } else {
    llvm_cbe__tmp22_1__PHI_TEMPORARY = llvm_cbe__tmp22_0;   /* for PHI node */
    llvm_cbe__tmp21_1__PHI_TEMPORARY = llvm_cbe__tmp21_0;   /* for PHI node */
    llvm_cbe__tmp_1__PHI_TEMPORARY = llvm_cbe__tmp_0;   /* for PHI node */
    goto llvm_cbe__ZN7way2obj4fillEii_exit_loopexit_loopexit;
  }

llvm_cbe_cond_true184_i:
  llvm_cbe_tmp188_i = llvm_cbe__tmp_0 + ((unsigned int )1);
  llvm_cbe_tmp270307_i = llvm_cbe_tmp163_rle_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((llvm_cbe_tmp276310_rle_i_ph == ((unsigned char )0))) {
    llvm_cbe__tmp22_0__PHI_TEMPORARY = llvm_cbe_tmp164_i;   /* for PHI node */
    llvm_cbe__tmp21_0__PHI_TEMPORARY = llvm_cbe_tmp270307_i;   /* for PHI node */
    llvm_cbe__tmp_0__PHI_TEMPORARY = llvm_cbe_tmp188_i;   /* for PHI node */
    llvm_cbe_tmp163_rle_i__PHI_TEMPORARY = llvm_cbe_tmp270307_i;   /* for PHI node */
    goto llvm_cbe_cond_next282_i;
  } else {
    llvm_cbe__tmp22_1__PHI_TEMPORARY = llvm_cbe_tmp164_i;   /* for PHI node */
    llvm_cbe__tmp21_1__PHI_TEMPORARY = llvm_cbe_tmp270307_i;   /* for PHI node */
    llvm_cbe__tmp_1__PHI_TEMPORARY = llvm_cbe_tmp188_i;   /* for PHI node */
    goto llvm_cbe__ZN7way2obj4fillEii_exit_loopexit_loopexit;
  }

llvm_cbe_bb160_i:
  llvm_cbe_tmp164_i = ((signed int )(((signed int )llvm_cbe_tmp163_rle_i) % ((signed int )((unsigned int )256))));
  llvm_cbe_tmp174177_i = ((signed long long )(signed int )llvm_cbe_tmp164_i);
  llvm_cbe_tmp180_i = *(&way2.field4[((signed long long )llvm_cbe_tmp174177_i)].field1);
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((llvm_cbe_tmp180_i == ((unsigned int )0))) {
    goto llvm_cbe_cond_true184_i;
  } else {
    goto llvm_cbe_cond_false_i;
  }

  } while (1); /* end of syntactic loop 'cond_next282.i' */
  do {     /* Syntactic loop 'bb203.i' to make GCC happy */
llvm_cbe_bb203_i:
  llvm_cbe_tmp227_rle_i = llvm_cbe_tmp227_rle_i__PHI_TEMPORARY;
  llvm_cbe_indvar_i = llvm_cbe_indvar_i__PHI_TEMPORARY;
  llvm_cbe_tmp206209_reg2mem_0_i = llvm_cbe_tmp206209_reg2mem_0_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )95);
  CallEdgeProfiler(llvm_cbe_val35, llvm_cbe_val46, ((unsigned int )95));
  llvm_cbe_tmp216_i = *(&way2.field4[((signed long long )llvm_cbe_tmp206209_reg2mem_0_i)].field0);
  llvm_cbe_tmp217218_i = ((signed long long )(signed int )(llvm_cbe_i171_0316_i - llvm_cbe_indvar_i));
  llvm_cbe_tmp224_i = *(&llvm_cbe_tmp216_i[((signed long long )llvm_cbe_tmp217218_i)].field1);
  llvm_cbe_tmp238_i = *(&way2.field4[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp227_rle_i)))].field0);
  llvm_cbe_tmp246_i = *(&llvm_cbe_tmp238_i[((signed long long )llvm_cbe_tmp217218_i)].field0);
  llvm_cbe_tmp7_i_i = *(&(way2.field1));
  llvm_cbe_tmp10_i_i = *(&(way2.field17));
  llvm_cbe_tmp17_i_i = &llvm_cbe_tmp7_i_i[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp10_i_i * llvm_cbe_tmp224_i) + llvm_cbe_tmp246_i))))].field0;
  llvm_cbe_tmp18_i_i = *llvm_cbe_tmp17_i_i;
  llvm_cbe_tmp21_i_i = *(&(way2.field2));
  if ((llvm_cbe_tmp18_i_i == llvm_cbe_tmp21_i_i)) {
    goto llvm_cbe__ZN7way2obj12releasepointEii_exit_i;
  } else {
    goto llvm_cbe_cond_next_i_i;
  }

llvm_cbe__ZN7way2obj12releasepointEii_exit_i:
  llvm_cbe_tmp206_i = *(&(way2.field5));
  llvm_cbe_tmp206209_i = ((signed long long )(signed int )llvm_cbe_tmp206_i);
  llvm_cbe_indvar_next_i = llvm_cbe_indvar_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((llvm_cbe_indvar_next_i == llvm_cbe_tmp324_i)) {
    llvm_cbe__promoted24_rle25__PHI_TEMPORARY = llvm_cbe_tmp206_i;   /* for PHI node */
    llvm_cbe_tmp206209_reg2mem_1_i__PHI_TEMPORARY = llvm_cbe_tmp206209_i;   /* for PHI node */
    goto llvm_cbe_bb255_i;
  } else {
    llvm_cbe_tmp227_rle_i__PHI_TEMPORARY = llvm_cbe_tmp206_i;   /* for PHI node */
    llvm_cbe_indvar_i__PHI_TEMPORARY = llvm_cbe_indvar_next_i;   /* for PHI node */
    llvm_cbe_tmp206209_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp206209_i;   /* for PHI node */
    goto llvm_cbe_bb203_i;
  }

llvm_cbe_cond_true364_i_i:
  *(&llvm_cbe_tmp367_i_i[((signed long long )llvm_cbe_tmp374375_i_i)].field1) = (((unsigned short )(llvm_cbe_tmp406407408_i_i + (((unsigned short )llvm_cbe_mindist_2_reg2mem_0_i_i)))));
  llvm_cbe_tmp462510_i_i = *(&(way2.field8));
  if ((llvm_cbe_tmp462510_i_i == llvm_cbe_tmp246_i)) {
    goto llvm_cbe_cond_true467_i_i;
  } else {
    goto llvm_cbe__ZN7way2obj12releasepointEii_exit_i;
  }

llvm_cbe_bb358_i_i:
  llvm_cbe_mindist_2_reg2mem_0_i_i = llvm_cbe_mindist_2_reg2mem_0_i_i__PHI_TEMPORARY;
  llvm_cbe_flcenter_2_reg2mem_0_i_i = llvm_cbe_flcenter_2_reg2mem_0_i_i__PHI_TEMPORARY;
  llvm_cbe_tmp367_i_i = *(&(way2.field1));
  llvm_cbe_tmp370_i_i = *(&(way2.field17));
  llvm_cbe_tmp374375_i_i = ((signed long long )(signed int )((llvm_cbe_tmp370_i_i * llvm_cbe_tmp224_i) + llvm_cbe_tmp246_i));
  llvm_cbe_tmp386_i_i = *(&(way2.field0));
  llvm_cbe_tmp396_i_i = *(&llvm_cbe_tmp386_i_i[((signed long long )llvm_cbe_tmp374375_i_i)]);
  llvm_cbe_tmp402_i_i = *(&way2.field3[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp396_i_i)))]);
  llvm_cbe_tmp406407408_i_i = ((unsigned short )(unsigned char )llvm_cbe_tmp402_i_i);
  if ((llvm_cbe_flcenter_2_reg2mem_0_i_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_true364_i_i;
  } else {
    goto llvm_cbe_cond_false413_i_i;
  }

llvm_cbe_cond_true79_i_i:
  if ((((signed int )llvm_cbe_y1_0_i_i) > ((signed int )llvm_cbe_tmp74_i_i))) {
    llvm_cbe_mindist_2_reg2mem_0_i_i__PHI_TEMPORARY = ((unsigned int )10000000);   /* for PHI node */
    llvm_cbe_flcenter_2_reg2mem_0_i_i__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
    goto llvm_cbe_bb358_i_i;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph_i_i__PHI_TEMPORARY = llvm_cbe_tmp74_i_i;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph_i_i__PHI_TEMPORARY = llvm_cbe_y1_0_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_ph_i_i__PHI_TEMPORARY = ((unsigned int )10000000);   /* for PHI node */
    llvm_cbe_flcenter_1_ph_i_i__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
    goto llvm_cbe_bb343_preheader_i_i;
  }

llvm_cbe_cond_next_i_i:
  *llvm_cbe_tmp17_i_i = llvm_cbe_tmp21_i_i;
  llvm_cbe_tmp41_i_i = llvm_cbe_tmp246_i + ((unsigned int )-1);
  llvm_cbe_tmp43_i_i = llvm_cbe_tmp224_i + ((unsigned int )-1);
  llvm_cbe_tmp45_i_i = llvm_cbe_tmp246_i + ((unsigned int )1);
  llvm_cbe_tmp47_i_i = llvm_cbe_tmp224_i + ((unsigned int )1);
  llvm_cbe_x1_0_i_i = (((((signed int )llvm_cbe_tmp41_i_i) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp41_i_i));
  llvm_cbe_y1_0_i_i = (((((signed int )llvm_cbe_tmp43_i_i) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp43_i_i));
  llvm_cbe_tmp62_i_i = *(&(way2.field13));
  llvm_cbe_x2_0_i_i = (((((signed int )llvm_cbe_tmp62_i_i) < ((signed int )llvm_cbe_tmp45_i_i))) ? (llvm_cbe_tmp62_i_i) : (llvm_cbe_tmp45_i_i));
  llvm_cbe_tmp74_i_i = *(&(way2.field14));
  if ((((signed int )llvm_cbe_tmp74_i_i) < ((signed int )llvm_cbe_tmp47_i_i))) {
    goto llvm_cbe_cond_true79_i_i;
  } else {
    llvm_cbe_y2_0_i_i__PHI_TEMPORARY = llvm_cbe_tmp47_i_i;   /* for PHI node */
    llvm_cbe_y_0_i_i__PHI_TEMPORARY = llvm_cbe_y1_0_i_i;   /* for PHI node */
    llvm_cbe_mindist_2_i_i__PHI_TEMPORARY = ((unsigned int )10000000);   /* for PHI node */
    llvm_cbe_flcenter_2_i_i__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
    goto llvm_cbe_bb352_i_i;
  }

llvm_cbe_bb352_i_i:
  llvm_cbe_y2_0_i_i = llvm_cbe_y2_0_i_i__PHI_TEMPORARY;
  llvm_cbe_y_0_i_i = llvm_cbe_y_0_i_i__PHI_TEMPORARY;
  llvm_cbe_mindist_2_i_i = llvm_cbe_mindist_2_i_i__PHI_TEMPORARY;
  llvm_cbe_flcenter_2_i_i = llvm_cbe_flcenter_2_i_i__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_y_0_i_i) > ((signed int )llvm_cbe_y2_0_i_i))) {
    llvm_cbe_mindist_2_reg2mem_0_i_i__PHI_TEMPORARY = llvm_cbe_mindist_2_i_i;   /* for PHI node */
    llvm_cbe_flcenter_2_reg2mem_0_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_2_i_i;   /* for PHI node */
    goto llvm_cbe_bb358_i_i;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph_i_i__PHI_TEMPORARY = llvm_cbe_y2_0_i_i;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph_i_i__PHI_TEMPORARY = llvm_cbe_y_0_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_ph_i_i__PHI_TEMPORARY = llvm_cbe_mindist_2_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_ph_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_2_i_i;   /* for PHI node */
    goto llvm_cbe_bb343_preheader_i_i;
  }

llvm_cbe_bb349_i_i:
  llvm_cbe_mindist_1_reg2mem_1_i_i = llvm_cbe_mindist_1_reg2mem_1_i_i__PHI_TEMPORARY;
  llvm_cbe_flcenter_1_reg2mem_1_i_i = llvm_cbe_flcenter_1_reg2mem_1_i_i__PHI_TEMPORARY;
  llvm_cbe_tmp351_i_i = llvm_cbe_y_0_reg2mem_0_ph_i_i + ((unsigned int )1);
  llvm_cbe_y2_0_i_i__PHI_TEMPORARY = llvm_cbe_y2_0_reg2mem_0_ph_i_i;   /* for PHI node */
  llvm_cbe_y_0_i_i__PHI_TEMPORARY = llvm_cbe_tmp351_i_i;   /* for PHI node */
  llvm_cbe_mindist_2_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_1_i_i;   /* for PHI node */
  llvm_cbe_flcenter_2_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_1_i_i;   /* for PHI node */
  goto llvm_cbe_bb352_i_i;

  do {     /* Syntactic loop 'bb343.i.i' to make GCC happy */
llvm_cbe_bb343_i_i:
  llvm_cbe_x_0_i_i = llvm_cbe_x_0_i_i__PHI_TEMPORARY;
  llvm_cbe_mindist_1_i_i = llvm_cbe_mindist_1_i_i__PHI_TEMPORARY;
  llvm_cbe_flcenter_1_i_i = llvm_cbe_flcenter_1_i_i__PHI_TEMPORARY;
  llvm_cbe_val39 = *(&cg_caller_id_var);
  llvm_cbe_val410 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )96);
  CallEdgeProfiler(llvm_cbe_val39, llvm_cbe_val410, ((unsigned int )96));
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )llvm_cbe_x_0_i_i) > ((signed int )llvm_cbe_x2_0_i_i))) {
    llvm_cbe_mindist_1_reg2mem_1_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_reg2mem_1_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_i_i;   /* for PHI node */
    goto llvm_cbe_bb349_i_i;
  } else {
    goto llvm_cbe_bb86_preheader_i_i;
  }

llvm_cbe_cond_next340_i_i:
  llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i = llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i__PHI_TEMPORARY;
  llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i = llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i__PHI_TEMPORARY;
  llvm_cbe_x_0_reg2mem_0_lcssa515_i_i = llvm_cbe_x_0_reg2mem_0_lcssa515_i_i__PHI_TEMPORARY;
  llvm_cbe_tmp342_i_i = llvm_cbe_x_0_reg2mem_0_lcssa515_i_i + ((unsigned int )1);
  llvm_cbe_x_0_i_i__PHI_TEMPORARY = llvm_cbe_tmp342_i_i;   /* for PHI node */
  llvm_cbe_mindist_1_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i;   /* for PHI node */
  llvm_cbe_flcenter_1_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i;   /* for PHI node */
  goto llvm_cbe_bb343_i_i;

  do {     /* Syntactic loop 'bb86.i.i' to make GCC happy */
llvm_cbe_bb86_i_i:
  llvm_cbe_indvar553_i_i = llvm_cbe_indvar553_i_i__PHI_TEMPORARY;
  llvm_cbe_mindist_1_reg2mem_0_i_i = llvm_cbe_mindist_1_reg2mem_0_i_i__PHI_TEMPORARY;
  llvm_cbe_flcenter_1_reg2mem_0_i_i = llvm_cbe_flcenter_1_reg2mem_0_i_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )97);
  CallEdgeProfiler(llvm_cbe_val39, llvm_cbe_val410, ((unsigned int )97));
  llvm_cbe_x_0_reg2mem_0_i_i = llvm_cbe_indvar553_i_i + llvm_cbe_x_0_i_i;
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((llvm_cbe_x_0_reg2mem_0_i_i == llvm_cbe_tmp246_i)) {
    llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_0_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_0_i_i;   /* for PHI node */
    llvm_cbe_x_0_reg2mem_0_lcssa515_i_i__PHI_TEMPORARY = llvm_cbe_x_0_reg2mem_0_i_i;   /* for PHI node */
    goto llvm_cbe_cond_next340_i_i;
  } else {
    goto llvm_cbe_cond_true100_i_i;
  }

llvm_cbe_cond_true142_i_i:
  llvm_cbe_indvar_next554_i_i = llvm_cbe_indvar553_i_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )(llvm_cbe_x_0_reg2mem_0_i_i + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0_i_i))) {
    llvm_cbe_mindist_1_reg2mem_1_i_i__PHI_TEMPORARY = llvm_cbe_tmp135136_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_reg2mem_1_i_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_bb349_i_i;
  } else {
    llvm_cbe_indvar553_i_i__PHI_TEMPORARY = llvm_cbe_indvar_next554_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_i_i__PHI_TEMPORARY = llvm_cbe_tmp135136_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_reg2mem_0_i_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_bb86_i_i;
  }

llvm_cbe_cond_true121_i_i:
  llvm_cbe_tmp135_i_i = *(&llvm_cbe_tmp103_i_i[((signed long long )llvm_cbe_tmp110111_i_i)].field1);
  llvm_cbe_tmp135136_i_i = ((unsigned int )(unsigned short )llvm_cbe_tmp135_i_i);
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )llvm_cbe_tmp135136_i_i) < ((signed int )llvm_cbe_mindist_1_reg2mem_0_i_i))) {
    goto llvm_cbe_cond_true142_i_i;
  } else {
    llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_0_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_0_i_i;   /* for PHI node */
    llvm_cbe_x_0_reg2mem_0_lcssa515_i_i__PHI_TEMPORARY = llvm_cbe_x_0_reg2mem_0_i_i;   /* for PHI node */
    goto llvm_cbe_cond_next340_i_i;
  }

llvm_cbe_cond_true100_i_i:
  llvm_cbe_tmp103_i_i = *(&(way2.field1));
  llvm_cbe_tmp106_i_i = *(&(way2.field17));
  llvm_cbe_tmp110111_i_i = ((signed long long )(signed int )((llvm_cbe_tmp106_i_i * llvm_cbe_y_0_reg2mem_0_ph_i_i) + llvm_cbe_x_0_reg2mem_0_i_i));
  llvm_cbe_tmp114_i_i = *(&llvm_cbe_tmp103_i_i[((signed long long )llvm_cbe_tmp110111_i_i)].field0);
  llvm_cbe_tmp117_i_i = *(&(way2.field2));
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((llvm_cbe_tmp114_i_i == llvm_cbe_tmp117_i_i)) {
    goto llvm_cbe_cond_true121_i_i;
  } else {
    llvm_cbe_tmp164_rle_i_i__PHI_TEMPORARY = llvm_cbe_tmp106_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_reg2mem_0_lcssa520_us_lcssa_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_0_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_lcssa517_us_lcssa_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_0_i_i;   /* for PHI node */
    llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i__PHI_TEMPORARY = llvm_cbe_x_0_reg2mem_0_i_i;   /* for PHI node */
    goto llvm_cbe_cond_false_split_i_i;
  }

  } while (1); /* end of syntactic loop 'bb86.i.i' */
llvm_cbe_bb86_preheader_i_i:
  if ((llvm_cbe_y_0_reg2mem_0_ph_i_i == llvm_cbe_tmp224_i)) {
    llvm_cbe_indvar553_i_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_reg2mem_0_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_i_i;   /* for PHI node */
    goto llvm_cbe_bb86_i_i;
  } else {
    goto llvm_cbe_bb86_us_i_i_preheader;
  }

llvm_cbe_cond_false_split_i_i:
  llvm_cbe_tmp164_rle_i_i = llvm_cbe_tmp164_rle_i_i__PHI_TEMPORARY;
  llvm_cbe_flcenter_1_reg2mem_0_lcssa520_us_lcssa_i_i = llvm_cbe_flcenter_1_reg2mem_0_lcssa520_us_lcssa_i_i__PHI_TEMPORARY;
  llvm_cbe_mindist_1_reg2mem_0_lcssa517_us_lcssa_i_i = llvm_cbe_mindist_1_reg2mem_0_lcssa517_us_lcssa_i_i__PHI_TEMPORARY;
  llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i = llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i__PHI_TEMPORARY;
  llvm_cbe_tmp161_i_i = *(&(way2.field0));
  llvm_cbe_tmp171_i_i = *(&llvm_cbe_tmp161_i_i[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp164_rle_i_i * llvm_cbe_y_0_reg2mem_0_ph_i_i) + llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i))))]);
  llvm_cbe_tmp177_i_i = *(&way2.field3[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp171_i_i)))]);
  if ((llvm_cbe_tmp177_i_i == ((unsigned char )0))) {
    llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_0_lcssa520_us_lcssa_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_0_lcssa517_us_lcssa_i_i;   /* for PHI node */
    llvm_cbe_x_0_reg2mem_0_lcssa515_i_i__PHI_TEMPORARY = llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i;   /* for PHI node */
    goto llvm_cbe_cond_next340_i_i;
  } else {
    goto llvm_cbe_cond_true197_critedge_i_i;
  }

  do {     /* Syntactic loop 'bb86.us.i.i' to make GCC happy */
llvm_cbe_bb86_us_i_i:
  llvm_cbe_indvar_i_i = llvm_cbe_indvar_i_i__PHI_TEMPORARY;
  llvm_cbe_mindist_1_reg2mem_0_us_i_i = llvm_cbe_mindist_1_reg2mem_0_us_i_i__PHI_TEMPORARY;
  llvm_cbe_flcenter_1_reg2mem_0_us_i_i = llvm_cbe_flcenter_1_reg2mem_0_us_i_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )98);
  CallEdgeProfiler(llvm_cbe_val39, llvm_cbe_val410, ((unsigned int )98));
  llvm_cbe_x_0_reg2mem_0_us_i_i = llvm_cbe_indvar_i_i + llvm_cbe_x_0_i_i;
  llvm_cbe_tmp110111_us_i_i = ((signed long long )(signed int )(llvm_cbe_tmp108_us_i_i + llvm_cbe_x_0_reg2mem_0_us_i_i));
  llvm_cbe_tmp114_us_i_i = *(&llvm_cbe_tmp103_us_i_i[((signed long long )llvm_cbe_tmp110111_us_i_i)].field0);
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((llvm_cbe_tmp114_us_i_i == llvm_cbe_tmp117_us_i_i)) {
    goto llvm_cbe_cond_true121_us_i_i;
  } else {
    llvm_cbe_tmp164_rle_i_i__PHI_TEMPORARY = llvm_cbe_tmp106_us_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_reg2mem_0_lcssa520_us_lcssa_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_0_us_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_lcssa517_us_lcssa_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_0_us_i_i;   /* for PHI node */
    llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i__PHI_TEMPORARY = llvm_cbe_x_0_reg2mem_0_us_i_i;   /* for PHI node */
    goto llvm_cbe_cond_false_split_i_i;
  }

llvm_cbe_cond_true142_us_i_i:
  llvm_cbe_indvar_next_i_i = llvm_cbe_indvar_i_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )(llvm_cbe_x_0_reg2mem_0_us_i_i + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0_i_i))) {
    llvm_cbe_mindist_1_reg2mem_1_i_i__PHI_TEMPORARY = llvm_cbe_tmp135136_us_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_reg2mem_1_i_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_bb349_i_i;
  } else {
    llvm_cbe_indvar_i_i__PHI_TEMPORARY = llvm_cbe_indvar_next_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_us_i_i__PHI_TEMPORARY = llvm_cbe_tmp135136_us_i_i;   /* for PHI node */
    llvm_cbe_flcenter_1_reg2mem_0_us_i_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_bb86_us_i_i;
  }

llvm_cbe_cond_true121_us_i_i:
  llvm_cbe_tmp135_us_i_i = *(&llvm_cbe_tmp103_us_i_i[((signed long long )llvm_cbe_tmp110111_us_i_i)].field1);
  llvm_cbe_tmp135136_us_i_i = ((unsigned int )(unsigned short )llvm_cbe_tmp135_us_i_i);
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((((signed int )llvm_cbe_tmp135136_us_i_i) < ((signed int )llvm_cbe_mindist_1_reg2mem_0_us_i_i))) {
    goto llvm_cbe_cond_true142_us_i_i;
  } else {
    llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_0_us_i_i;   /* for PHI node */
    llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_0_us_i_i;   /* for PHI node */
    llvm_cbe_x_0_reg2mem_0_lcssa515_i_i__PHI_TEMPORARY = llvm_cbe_x_0_reg2mem_0_us_i_i;   /* for PHI node */
    goto llvm_cbe_cond_next340_i_i;
  }

  } while (1); /* end of syntactic loop 'bb86.us.i.i' */
llvm_cbe_bb86_us_i_i_preheader:
  llvm_cbe_tmp103_us_i_i = *(&(way2.field1));
  llvm_cbe_tmp106_us_i_i = *(&(way2.field17));
  llvm_cbe_tmp108_us_i_i = llvm_cbe_tmp106_us_i_i * llvm_cbe_y_0_reg2mem_0_ph_i_i;
  llvm_cbe_tmp117_us_i_i = *(&(way2.field2));
  llvm_cbe_indvar_i_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_mindist_1_reg2mem_0_us_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_i_i;   /* for PHI node */
  llvm_cbe_flcenter_1_reg2mem_0_us_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_i_i;   /* for PHI node */
  goto llvm_cbe_bb86_us_i_i;

llvm_cbe_cond_next310_i_i:
  llvm_cbe_tmp313_i_i = *(&way2.field4[((signed long long )llvm_cbe_tmp248251_i_i)].field0);
  llvm_cbe_tmp316_i_i = *llvm_cbe_tmp256_i_i;
  llvm_cbe_tmp316324_i_i = ((signed long long )(signed int )llvm_cbe_tmp316_i_i);
  *(&llvm_cbe_tmp313_i_i[((signed long long )llvm_cbe_tmp316324_i_i)].field0) = llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i;
  *(&llvm_cbe_tmp313_i_i[((signed long long )llvm_cbe_tmp316324_i_i)].field1) = llvm_cbe_y_0_reg2mem_0_ph_i_i;
  llvm_cbe_tmp334_i_i = *llvm_cbe_tmp256_i_i;
  *llvm_cbe_tmp256_i_i = (llvm_cbe_tmp334_i_i + ((unsigned int )1));
  llvm_cbe_flcenter_1_reg2mem_0_lcssa521_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_reg2mem_0_lcssa520_us_lcssa_i_i;   /* for PHI node */
  llvm_cbe_mindist_1_reg2mem_0_lcssa518_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_reg2mem_0_lcssa517_us_lcssa_i_i;   /* for PHI node */
  llvm_cbe_x_0_reg2mem_0_lcssa515_i_i__PHI_TEMPORARY = llvm_cbe_x_0_reg2mem_0_lcssa514_us_lcssa_i_i;   /* for PHI node */
  goto llvm_cbe_cond_next340_i_i;

llvm_cbe_cond_true197_critedge_i_i:
  llvm_cbe_tmp207_i_i = *(&(way2.field7));
  llvm_cbe_tmp248251_i_i = ((signed long long )(signed int )(((signed int )(((signed int )((((unsigned int )(unsigned char )llvm_cbe_tmp177_i_i)) + llvm_cbe_tmp207_i_i)) % ((signed int )((unsigned int )256))))));
  llvm_cbe_tmp256_i_i = &way2.field4[((signed long long )llvm_cbe_tmp248251_i_i)].field1;
  llvm_cbe_tmp257_i_i = *llvm_cbe_tmp256_i_i;
  llvm_cbe_tmp259_i_i = &way2.field4[((signed long long )llvm_cbe_tmp248251_i_i)].field2;
  llvm_cbe_tmp260_i_i = *llvm_cbe_tmp259_i_i;
  if ((llvm_cbe_tmp257_i_i == llvm_cbe_tmp260_i_i)) {
    goto llvm_cbe_cond_true264_i_i;
  } else {
    goto llvm_cbe_cond_next310_i_i;
  }

llvm_cbe_cond_true264_i_i:
  llvm_cbe_tmp271_i_i = llvm_cbe_tmp260_i_i << ((unsigned int )1);
  ltmp_85_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp271_i_i)) * ((unsigned long long )8ll)));
  ltmp_86_5 = ((struct l_struct_2E_pointt *)ltmp_85_2);
  llvm_cbe_tmp293_i_i = &way2.field4[((signed long long )llvm_cbe_tmp248251_i_i)].field0;
  llvm_cbe_tmp294_i_i = *llvm_cbe_tmp293_i_i;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )96);
  ltmp_87_2 = memcpy((((unsigned char *)ltmp_86_5)), (((unsigned char *)llvm_cbe_tmp294_i_i)), ((((signed long long )(signed int )llvm_cbe_tmp260_i_i)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp301_i_i = *llvm_cbe_tmp293_i_i;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp301_i_i)));
  *llvm_cbe_tmp293_i_i = ltmp_86_5;
  *llvm_cbe_tmp259_i_i = llvm_cbe_tmp271_i_i;
  goto llvm_cbe_cond_next310_i_i;

  } while (1); /* end of syntactic loop 'bb343.i.i' */
llvm_cbe_bb343_preheader_i_i:
  llvm_cbe_y2_0_reg2mem_0_ph_i_i = llvm_cbe_y2_0_reg2mem_0_ph_i_i__PHI_TEMPORARY;
  llvm_cbe_y_0_reg2mem_0_ph_i_i = llvm_cbe_y_0_reg2mem_0_ph_i_i__PHI_TEMPORARY;
  llvm_cbe_mindist_1_ph_i_i = llvm_cbe_mindist_1_ph_i_i__PHI_TEMPORARY;
  llvm_cbe_flcenter_1_ph_i_i = llvm_cbe_flcenter_1_ph_i_i__PHI_TEMPORARY;
  llvm_cbe_x_0_i_i__PHI_TEMPORARY = llvm_cbe_x1_0_i_i;   /* for PHI node */
  llvm_cbe_mindist_1_i_i__PHI_TEMPORARY = llvm_cbe_mindist_1_ph_i_i;   /* for PHI node */
  llvm_cbe_flcenter_1_i_i__PHI_TEMPORARY = llvm_cbe_flcenter_1_ph_i_i;   /* for PHI node */
  goto llvm_cbe_bb343_i_i;

llvm_cbe_cond_false413_i_i:
  *(&llvm_cbe_tmp367_i_i[((signed long long )llvm_cbe_tmp374375_i_i)].field1) = llvm_cbe_tmp406407408_i_i;
  llvm_cbe_tmp462_i_i = *(&(way2.field8));
  if ((llvm_cbe_tmp462_i_i == llvm_cbe_tmp246_i)) {
    goto llvm_cbe_cond_true467_i_i;
  } else {
    goto llvm_cbe__ZN7way2obj12releasepointEii_exit_i;
  }

llvm_cbe_cond_true467_i_i:
  llvm_cbe_tmp470_i_i = *(&(way2.field9));
  if ((llvm_cbe_tmp470_i_i == llvm_cbe_tmp224_i)) {
    goto llvm_cbe_cond_true475_i_i;
  } else {
    goto llvm_cbe__ZN7way2obj12releasepointEii_exit_i;
  }

llvm_cbe_cond_true475_i_i:
  *(&(way2.field12)) = ((unsigned char )1);
  goto llvm_cbe__ZN7way2obj12releasepointEii_exit_i;

  } while (1); /* end of syntactic loop 'bb203.i' */
llvm_cbe_bb203_preheader_i:
  llvm_cbe_tmp324_i = (((((signed int )llvm_cbe_i171_0316_i) < ((signed int )((unsigned int )0)))) ? (((unsigned int )1)) : (llvm_cbe_tmp180_i));
  llvm_cbe_tmp227_rle_i__PHI_TEMPORARY = llvm_cbe_tmp164_i;   /* for PHI node */
  llvm_cbe_indvar_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_tmp206209_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp174177_i;   /* for PHI node */
  goto llvm_cbe_bb203_i;

  } while (1); /* end of syntactic loop 'cond_next282.i.outer' */
llvm_cbe__ZN7way2obj4fillEii_exit_loopexit_loopexit:
  llvm_cbe__tmp22_1 = llvm_cbe__tmp22_1__PHI_TEMPORARY;
  llvm_cbe__tmp21_1 = llvm_cbe__tmp21_1__PHI_TEMPORARY;
  llvm_cbe__tmp_1 = llvm_cbe__tmp_1__PHI_TEMPORARY;
  *(&(way2.field6)) = llvm_cbe__tmp_1;
  *(&(way2.field7)) = llvm_cbe__tmp21_1;
  *(&(way2.field5)) = llvm_cbe__tmp22_1;
  llvm_cbe_tmp292_rle_i__PHI_TEMPORARY = llvm_cbe_tmp276310_rle_i_ph;   /* for PHI node */
  goto llvm_cbe__ZN7way2obj4fillEii_exit;

llvm_cbe__ZN7way2obj4fillEii_exit:
  llvm_cbe_tmp292_rle_i = llvm_cbe_tmp292_rle_i__PHI_TEMPORARY;
  if ((llvm_cbe_tmp292_rle_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_true56;
  } else {
    goto llvm_cbe_cond_next60;
  }

llvm_cbe_cond_true56:
  *llvm_cbe_wayar = ((struct l_struct_2E_pointt *)/*NULL*/0);
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
llvm_cbe_cond_next60:
  llvm_cbe_tmp15_i = *(&(way2.field17));
  ltmp_88_2 =  /*tail*/ malloc((llvm_cbe_tmp15_i << ((unsigned int )3)));
  ltmp_89_2 = ((unsigned char *)ltmp_88_2);
  llvm_cbe_tmp35_i1 = *(&(way2.field9));
  llvm_cbe_tmp38_i2 = *(&(way2.field8));
  if ((llvm_cbe_tmp15_i == ((unsigned int )0))) {
    goto llvm_cbe_cond_true_i3;
  } else {
    llvm_cbe_wayar_0_2_in_i__PHI_TEMPORARY = ltmp_89_2;   /* for PHI node */
    llvm_cbe_wayar_2_2_i__PHI_TEMPORARY = llvm_cbe_tmp15_i;   /* for PHI node */
    goto llvm_cbe_cond_next88_i;
  }

llvm_cbe_cond_true_i3:
  llvm_cbe_tmp53_i = llvm_cbe_tmp15_i << ((unsigned int )1);
  ltmp_90_2 =  /*tail*/ malloc((llvm_cbe_tmp15_i << ((unsigned int )4)));
  ltmp_91_2 = ((unsigned char *)ltmp_90_2);
  *(&cg_caller_call_site_var) = ((unsigned int )3);
  *(&cg_caller_id_var) = ((unsigned int )19);
  ltmp_92_2 = memcpy(ltmp_91_2, ltmp_89_2, ((((signed long long )(signed int )llvm_cbe_tmp15_i)) << ((unsigned long long )3ll)));
   /*tail*/ free((((unsigned char *)ltmp_89_2)));
  llvm_cbe_wayar_0_2_in_i__PHI_TEMPORARY = ltmp_91_2;   /* for PHI node */
  llvm_cbe_wayar_2_2_i__PHI_TEMPORARY = llvm_cbe_tmp53_i;   /* for PHI node */
  goto llvm_cbe_cond_next88_i;

llvm_cbe_cond_next88_i:
  llvm_cbe_wayar_0_2_in_i = llvm_cbe_wayar_0_2_in_i__PHI_TEMPORARY;
  llvm_cbe_wayar_2_2_i = llvm_cbe_wayar_2_2_i__PHI_TEMPORARY;
  llvm_cbe_wayar_0_2_i = ((struct l_struct_2E_pointt *)llvm_cbe_wayar_0_2_in_i);
  *(((unsigned int *)llvm_cbe_wayar_0_2_in_i)) = llvm_cbe_tmp38_i2;
  *(&llvm_cbe_wayar_0_2_i->field1) = llvm_cbe_tmp35_i1;
  *llvm_cbe_waylength = ((unsigned int )1);
  llvm_cbe_index_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_wayar_0_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_wayar_0_2_i;   /* for PHI node */
  llvm_cbe_wayar_2_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_wayar_2_2_i;   /* for PHI node */
  llvm_cbe_mx_3_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_my_3_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_flfinish_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
  goto llvm_cbe_cond_next496_i;

  do {     /* Syntactic loop 'cond_next496.i' to make GCC happy */
llvm_cbe_cond_next496_i:
  llvm_cbe_index_0_reg2mem_0_i = llvm_cbe_index_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_wayar_0_1_reg2mem_0_i = llvm_cbe_wayar_0_1_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_wayar_2_1_reg2mem_0_i = llvm_cbe_wayar_2_1_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_mx_3_reg2mem_0_i = llvm_cbe_mx_3_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_my_3_reg2mem_0_i = llvm_cbe_my_3_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_flfinish_0_reg2mem_0_i = llvm_cbe_flfinish_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_val315 = *(&cg_caller_id_var);
  llvm_cbe_val416 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )99);
  CallEdgeProfiler(llvm_cbe_val315, llvm_cbe_val416, ((unsigned int )99));
  llvm_cbe_wayar_1_0_reg2mem_0_i = llvm_cbe_index_0_reg2mem_0_i + ((unsigned int )1);
  llvm_cbe_tmp499_i = *(&(way2.field17));
  llvm_cbe_tmp502_i = *(&(way2.field18));
  *(&cg_caller_call_site_var) = llvm_cbe_val416;
  *(&cg_caller_id_var) = llvm_cbe_val315;
  if ((((signed int )(llvm_cbe_tmp502_i * llvm_cbe_tmp499_i)) > ((signed int )llvm_cbe_index_0_reg2mem_0_i))) {
    goto llvm_cbe_bb113_i;
  } else {
    goto llvm_cbe_bb508_i;
  }

llvm_cbe_bb489_i:
  llvm_cbe_flfinish_0_i = llvm_cbe_flfinish_0_i__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = llvm_cbe_val416;
  *(&cg_caller_id_var) = llvm_cbe_val315;
  if ((llvm_cbe_flfinish_0_i == ((unsigned char )0))) {
    llvm_cbe_index_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_wayar_1_0_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_wayar_0_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_wayar_0_0_i;   /* for PHI node */
    llvm_cbe_wayar_2_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_wayar_2_0_i;   /* for PHI node */
    llvm_cbe_mx_3_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_mx_2_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_my_3_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_my_2_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_flfinish_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_flfinish_0_i;   /* for PHI node */
    goto llvm_cbe_cond_next496_i;
  } else {
    goto llvm_cbe_cond_next523_i_loopexit;
  }

llvm_cbe_cond_next447_i:
  llvm_cbe_wayar_0_0_i = llvm_cbe_wayar_0_0_i__PHI_TEMPORARY;
  llvm_cbe_wayar_2_0_i = llvm_cbe_wayar_2_0_i__PHI_TEMPORARY;
  llvm_cbe_tmp451459_i = ((signed long long )(signed int )llvm_cbe_wayar_1_0_reg2mem_0_i);
  *(&llvm_cbe_wayar_0_0_i[((signed long long )llvm_cbe_tmp451459_i)].field0) = llvm_cbe_mx_2_reg2mem_0_i;
  *(&llvm_cbe_wayar_0_0_i[((signed long long )llvm_cbe_tmp451459_i)].field1) = llvm_cbe_my_2_reg2mem_0_i;
  llvm_cbe_tmp473_i = *(&(way2.field10));
  if ((llvm_cbe_tmp473_i == llvm_cbe_mx_2_reg2mem_0_i)) {
    goto llvm_cbe_cond_true478_i;
  } else {
    llvm_cbe_flfinish_0_i__PHI_TEMPORARY = llvm_cbe_flfinish_0_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_bb489_i;
  }

llvm_cbe_bb379_i:
  llvm_cbe_mx_2_reg2mem_0_i = llvm_cbe_mx_2_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_my_2_reg2mem_0_i = llvm_cbe_my_2_reg2mem_0_i__PHI_TEMPORARY;
  *llvm_cbe_waylength = (llvm_cbe_tmp115_i + ((unsigned int )1));
  if ((llvm_cbe_wayar_1_0_reg2mem_0_i == llvm_cbe_wayar_2_1_reg2mem_0_i)) {
    goto llvm_cbe_cond_true403_i;
  } else {
    llvm_cbe_wayar_0_0_i__PHI_TEMPORARY = llvm_cbe_wayar_0_1_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_wayar_2_0_i__PHI_TEMPORARY = llvm_cbe_wayar_2_1_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_cond_next447_i;
  }

llvm_cbe_cond_true209_i:
  if ((((signed int )llvm_cbe_y1_0_i) > ((signed int )llvm_cbe_tmp204_i))) {
    llvm_cbe_mx_2_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_mx_3_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_my_2_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_my_3_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_bb379_i;
  } else {
    llvm_cbe_val418_rle8__PHI_TEMPORARY = llvm_cbe_val416;   /* for PHI node */
    llvm_cbe_val317_rle5__PHI_TEMPORARY = llvm_cbe_val315;   /* for PHI node */
    llvm_cbe_y2_0_reg2mem_0_ph_i__PHI_TEMPORARY = llvm_cbe_tmp204_i;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph_i__PHI_TEMPORARY = llvm_cbe_y1_0_i;   /* for PHI node */
    llvm_cbe_mx_1_ph_i__PHI_TEMPORARY = llvm_cbe_mx_3_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_my_1_ph_i__PHI_TEMPORARY = llvm_cbe_my_3_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_mind_1_ph_i__PHI_TEMPORARY = ((unsigned int )100000000);   /* for PHI node */
    goto llvm_cbe_bb364_preheader_i;
  }

llvm_cbe_bb113_i:
  llvm_cbe_tmp115_i = *llvm_cbe_waylength;
  llvm_cbe_tmp121122_i = ((signed long long )(signed int )(llvm_cbe_tmp115_i + ((unsigned int )-1)));
  llvm_cbe_tmp128_i = *(&llvm_cbe_wayar_0_1_reg2mem_0_i[((signed long long )llvm_cbe_tmp121122_i)].field0);
  llvm_cbe_tmp129_i = llvm_cbe_tmp128_i + ((unsigned int )-1);
  llvm_cbe_tmp144_i = *(&llvm_cbe_wayar_0_1_reg2mem_0_i[((signed long long )llvm_cbe_tmp121122_i)].field1);
  llvm_cbe_tmp145_i4 = llvm_cbe_tmp144_i + ((unsigned int )-1);
  llvm_cbe_tmp161_i = llvm_cbe_tmp128_i + ((unsigned int )1);
  llvm_cbe_tmp177_i = llvm_cbe_tmp144_i + ((unsigned int )1);
  llvm_cbe_x1_0_i = (((((signed int )llvm_cbe_tmp129_i) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp129_i));
  llvm_cbe_y1_0_i = (((((signed int )llvm_cbe_tmp145_i4) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp145_i4));
  llvm_cbe_tmp192_i = *(&(way2.field13));
  llvm_cbe_x2_0_i = (((((signed int )llvm_cbe_tmp192_i) < ((signed int )llvm_cbe_tmp161_i))) ? (llvm_cbe_tmp192_i) : (llvm_cbe_tmp161_i));
  llvm_cbe_tmp204_i = *(&(way2.field14));
  if ((((signed int )llvm_cbe_tmp204_i) < ((signed int )llvm_cbe_tmp177_i))) {
    goto llvm_cbe_cond_true209_i;
  } else {
    llvm_cbe_val418_rle9__PHI_TEMPORARY = llvm_cbe_val416;   /* for PHI node */
    llvm_cbe_val317_rle6__PHI_TEMPORARY = llvm_cbe_val315;   /* for PHI node */
    llvm_cbe_y2_0_i__PHI_TEMPORARY = llvm_cbe_tmp177_i;   /* for PHI node */
    llvm_cbe_mx_2_i__PHI_TEMPORARY = llvm_cbe_mx_3_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_my_2_i__PHI_TEMPORARY = llvm_cbe_my_3_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_y_0_i__PHI_TEMPORARY = llvm_cbe_y1_0_i;   /* for PHI node */
    llvm_cbe_mind_2_i__PHI_TEMPORARY = ((unsigned int )100000000);   /* for PHI node */
    goto llvm_cbe_bb373_i;
  }

llvm_cbe_bb373_i:
  llvm_cbe_val418_rle9 = llvm_cbe_val418_rle9__PHI_TEMPORARY;
  llvm_cbe_val317_rle6 = llvm_cbe_val317_rle6__PHI_TEMPORARY;
  llvm_cbe_y2_0_i = llvm_cbe_y2_0_i__PHI_TEMPORARY;
  llvm_cbe_mx_2_i = llvm_cbe_mx_2_i__PHI_TEMPORARY;
  llvm_cbe_my_2_i = llvm_cbe_my_2_i__PHI_TEMPORARY;
  llvm_cbe_y_0_i = llvm_cbe_y_0_i__PHI_TEMPORARY;
  llvm_cbe_mind_2_i = llvm_cbe_mind_2_i__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_y_0_i) > ((signed int )llvm_cbe_y2_0_i))) {
    llvm_cbe_mx_2_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_mx_2_i;   /* for PHI node */
    llvm_cbe_my_2_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_my_2_i;   /* for PHI node */
    goto llvm_cbe_bb379_i;
  } else {
    llvm_cbe_val418_rle8__PHI_TEMPORARY = llvm_cbe_val418_rle9;   /* for PHI node */
    llvm_cbe_val317_rle5__PHI_TEMPORARY = llvm_cbe_val317_rle6;   /* for PHI node */
    llvm_cbe_y2_0_reg2mem_0_ph_i__PHI_TEMPORARY = llvm_cbe_y2_0_i;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph_i__PHI_TEMPORARY = llvm_cbe_y_0_i;   /* for PHI node */
    llvm_cbe_mx_1_ph_i__PHI_TEMPORARY = llvm_cbe_mx_2_i;   /* for PHI node */
    llvm_cbe_my_1_ph_i__PHI_TEMPORARY = llvm_cbe_my_2_i;   /* for PHI node */
    llvm_cbe_mind_1_ph_i__PHI_TEMPORARY = llvm_cbe_mind_2_i;   /* for PHI node */
    goto llvm_cbe_bb364_preheader_i;
  }

llvm_cbe_bb370_i:
  llvm_cbe_mind_1_lcssa_i = llvm_cbe_mind_1_lcssa_i__PHI_TEMPORARY;
  llvm_cbe_my_1_lcssa_i = llvm_cbe_my_1_lcssa_i__PHI_TEMPORARY;
  llvm_cbe_mx_1_lcssa_i = llvm_cbe_mx_1_lcssa_i__PHI_TEMPORARY;
  llvm_cbe_tmp372_i = llvm_cbe_y_0_reg2mem_0_ph_i + ((unsigned int )1);
  llvm_cbe_val418_rle9__PHI_TEMPORARY = llvm_cbe_val418_rle8;   /* for PHI node */
  llvm_cbe_val317_rle6__PHI_TEMPORARY = llvm_cbe_val317_rle5;   /* for PHI node */
  llvm_cbe_y2_0_i__PHI_TEMPORARY = llvm_cbe_y2_0_reg2mem_0_ph_i;   /* for PHI node */
  llvm_cbe_mx_2_i__PHI_TEMPORARY = llvm_cbe_mx_1_lcssa_i;   /* for PHI node */
  llvm_cbe_my_2_i__PHI_TEMPORARY = llvm_cbe_my_1_lcssa_i;   /* for PHI node */
  llvm_cbe_y_0_i__PHI_TEMPORARY = llvm_cbe_tmp372_i;   /* for PHI node */
  llvm_cbe_mind_2_i__PHI_TEMPORARY = llvm_cbe_mind_1_lcssa_i;   /* for PHI node */
  goto llvm_cbe_bb373_i;

llvm_cbe_bb364_preheader_i:
  llvm_cbe_val418_rle8 = llvm_cbe_val418_rle8__PHI_TEMPORARY;
  llvm_cbe_val317_rle5 = llvm_cbe_val317_rle5__PHI_TEMPORARY;
  llvm_cbe_y2_0_reg2mem_0_ph_i = llvm_cbe_y2_0_reg2mem_0_ph_i__PHI_TEMPORARY;
  llvm_cbe_y_0_reg2mem_0_ph_i = llvm_cbe_y_0_reg2mem_0_ph_i__PHI_TEMPORARY;
  llvm_cbe_mx_1_ph_i = llvm_cbe_mx_1_ph_i__PHI_TEMPORARY;
  llvm_cbe_my_1_ph_i = llvm_cbe_my_1_ph_i__PHI_TEMPORARY;
  llvm_cbe_mind_1_ph_i = llvm_cbe_mind_1_ph_i__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_x1_0_i) > ((signed int )llvm_cbe_x2_0_i))) {
    llvm_cbe_mind_1_lcssa_i__PHI_TEMPORARY = llvm_cbe_mind_1_ph_i;   /* for PHI node */
    llvm_cbe_my_1_lcssa_i__PHI_TEMPORARY = llvm_cbe_my_1_ph_i;   /* for PHI node */
    llvm_cbe_mx_1_lcssa_i__PHI_TEMPORARY = llvm_cbe_mx_1_ph_i;   /* for PHI node */
    goto llvm_cbe_bb370_i;
  } else {
    goto llvm_cbe_bb_nph_i;
  }

  do {     /* Syntactic loop 'bb217.i' to make GCC happy */
llvm_cbe_bb217_i:
  llvm_cbe_indvar658_i = llvm_cbe_indvar658_i__PHI_TEMPORARY;
  llvm_cbe_mind_1646_i = llvm_cbe_mind_1646_i__PHI_TEMPORARY;
  llvm_cbe_my_1644_i = llvm_cbe_my_1644_i__PHI_TEMPORARY;
  llvm_cbe_mx_1643_i = llvm_cbe_mx_1643_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )100);
  CallEdgeProfiler(llvm_cbe_val317_rle5, llvm_cbe_val418_rle8, ((unsigned int )100));
  llvm_cbe_x_0645_i = llvm_cbe_indvar658_i + llvm_cbe_x1_0_i;
  llvm_cbe_tmp227228_i = ((signed long long )(signed int )(llvm_cbe_tmp225_i + llvm_cbe_x_0645_i));
  llvm_cbe_tmp231_i = *(&llvm_cbe_tmp220_i[((signed long long )llvm_cbe_tmp227228_i)].field0);
  if ((llvm_cbe_tmp231_i == llvm_cbe_tmp234_i)) {
    goto llvm_cbe_cond_true238_i;
  } else {
    llvm_cbe_mx_0_i__PHI_TEMPORARY = llvm_cbe_mx_1643_i;   /* for PHI node */
    llvm_cbe_my_0_i__PHI_TEMPORARY = llvm_cbe_my_1644_i;   /* for PHI node */
    llvm_cbe_mind_0_i__PHI_TEMPORARY = llvm_cbe_mind_1646_i;   /* for PHI node */
    goto llvm_cbe_cond_next361_i;
  }

llvm_cbe_cond_next361_i:
  llvm_cbe_mx_0_i = llvm_cbe_mx_0_i__PHI_TEMPORARY;
  llvm_cbe_my_0_i = llvm_cbe_my_0_i__PHI_TEMPORARY;
  llvm_cbe_mind_0_i = llvm_cbe_mind_0_i__PHI_TEMPORARY;
  llvm_cbe_indvar_next659_i = llvm_cbe_indvar658_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val418_rle8;
  *(&cg_caller_id_var) = llvm_cbe_val317_rle5;
  if ((((signed int )(llvm_cbe_x_0645_i + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0_i))) {
    llvm_cbe_mind_1_lcssa_i__PHI_TEMPORARY = llvm_cbe_mind_0_i;   /* for PHI node */
    llvm_cbe_my_1_lcssa_i__PHI_TEMPORARY = llvm_cbe_my_0_i;   /* for PHI node */
    llvm_cbe_mx_1_lcssa_i__PHI_TEMPORARY = llvm_cbe_mx_0_i;   /* for PHI node */
    goto llvm_cbe_bb370_i;
  } else {
    llvm_cbe_indvar658_i__PHI_TEMPORARY = llvm_cbe_indvar_next659_i;   /* for PHI node */
    llvm_cbe_mind_1646_i__PHI_TEMPORARY = llvm_cbe_mind_0_i;   /* for PHI node */
    llvm_cbe_my_1644_i__PHI_TEMPORARY = llvm_cbe_my_0_i;   /* for PHI node */
    llvm_cbe_mx_1643_i__PHI_TEMPORARY = llvm_cbe_mx_0_i;   /* for PHI node */
    goto llvm_cbe_bb217_i;
  }

llvm_cbe_cond_true238_i:
  llvm_cbe_tmp252_i = *(&llvm_cbe_tmp220_i[((signed long long )llvm_cbe_tmp227228_i)].field1);
  llvm_cbe_tmp252253_i = ((unsigned int )(unsigned short )llvm_cbe_tmp252_i);
  if ((((signed int )llvm_cbe_tmp252253_i) < ((signed int )llvm_cbe_mind_1646_i))) {
    llvm_cbe_mx_0_i__PHI_TEMPORARY = llvm_cbe_x_0645_i;   /* for PHI node */
    llvm_cbe_my_0_i__PHI_TEMPORARY = llvm_cbe_y_0_reg2mem_0_ph_i;   /* for PHI node */
    llvm_cbe_mind_0_i__PHI_TEMPORARY = llvm_cbe_tmp252253_i;   /* for PHI node */
    goto llvm_cbe_cond_next361_i;
  } else {
    goto llvm_cbe_cond_false_i8;
  }

llvm_cbe_cond_false_i8:
  if ((llvm_cbe_tmp252253_i == llvm_cbe_mind_1646_i)) {
    goto llvm_cbe_cond_true295_i;
  } else {
    llvm_cbe_mx_0_i__PHI_TEMPORARY = llvm_cbe_mx_1643_i;   /* for PHI node */
    llvm_cbe_my_0_i__PHI_TEMPORARY = llvm_cbe_my_1644_i;   /* for PHI node */
    llvm_cbe_mind_0_i__PHI_TEMPORARY = llvm_cbe_mind_1646_i;   /* for PHI node */
    goto llvm_cbe_cond_next361_i;
  }

llvm_cbe_cond_true295_i:
  llvm_cbe_tmp298_i = *(&(way2.field10));
  llvm_cbe_tmp300_i = llvm_cbe_tmp298_i - llvm_cbe_mx_1643_i;
  llvm_cbe_tmp310_i = *(&(way2.field11));
  llvm_cbe_tmp312_i = llvm_cbe_tmp310_i - llvm_cbe_my_1644_i;
  llvm_cbe_tmp327_i = llvm_cbe_tmp298_i - llvm_cbe_x_0645_i;
  llvm_cbe_tmp339_i = llvm_cbe_tmp310_i - llvm_cbe_y_0_reg2mem_0_ph_i;
  if ((((signed int )((llvm_cbe_tmp339_i * llvm_cbe_tmp339_i) + (llvm_cbe_tmp327_i * llvm_cbe_tmp327_i))) < ((signed int )((llvm_cbe_tmp312_i * llvm_cbe_tmp312_i) + (llvm_cbe_tmp300_i * llvm_cbe_tmp300_i))))) {
    goto llvm_cbe_cond_true355_i;
  } else {
    llvm_cbe_mx_0_i__PHI_TEMPORARY = llvm_cbe_mx_1643_i;   /* for PHI node */
    llvm_cbe_my_0_i__PHI_TEMPORARY = llvm_cbe_my_1644_i;   /* for PHI node */
    llvm_cbe_mind_0_i__PHI_TEMPORARY = llvm_cbe_mind_1646_i;   /* for PHI node */
    goto llvm_cbe_cond_next361_i;
  }

llvm_cbe_cond_true355_i:
  llvm_cbe_mx_0_i__PHI_TEMPORARY = llvm_cbe_x_0645_i;   /* for PHI node */
  llvm_cbe_my_0_i__PHI_TEMPORARY = llvm_cbe_y_0_reg2mem_0_ph_i;   /* for PHI node */
  llvm_cbe_mind_0_i__PHI_TEMPORARY = llvm_cbe_mind_1646_i;   /* for PHI node */
  goto llvm_cbe_cond_next361_i;

  } while (1); /* end of syntactic loop 'bb217.i' */
llvm_cbe_bb_nph_i:
  llvm_cbe_tmp220_i = *(&(way2.field1));
  llvm_cbe_tmp225_i = llvm_cbe_tmp499_i * llvm_cbe_y_0_reg2mem_0_ph_i;
  llvm_cbe_tmp234_i = *(&(way2.field2));
  llvm_cbe_indvar658_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_mind_1646_i__PHI_TEMPORARY = llvm_cbe_mind_1_ph_i;   /* for PHI node */
  llvm_cbe_my_1644_i__PHI_TEMPORARY = llvm_cbe_my_1_ph_i;   /* for PHI node */
  llvm_cbe_mx_1643_i__PHI_TEMPORARY = llvm_cbe_mx_1_ph_i;   /* for PHI node */
  goto llvm_cbe_bb217_i;

llvm_cbe_cond_true403_i:
  llvm_cbe_tmp410_i = llvm_cbe_wayar_2_1_reg2mem_0_i << ((unsigned int )1);
  ltmp_93_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp410_i)) * ((unsigned long long )8ll)));
  ltmp_94_5 = ((struct l_struct_2E_pointt *)ltmp_93_2);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )99);
  ltmp_95_2 = memcpy((((unsigned char *)ltmp_94_5)), (((unsigned char *)llvm_cbe_wayar_0_1_reg2mem_0_i)), ((((signed long long )(signed int )llvm_cbe_wayar_2_1_reg2mem_0_i)) << ((unsigned long long )3ll)));
   /*tail*/ free((((unsigned char *)llvm_cbe_wayar_0_1_reg2mem_0_i)));
  llvm_cbe_wayar_0_0_i__PHI_TEMPORARY = ltmp_94_5;   /* for PHI node */
  llvm_cbe_wayar_2_0_i__PHI_TEMPORARY = llvm_cbe_tmp410_i;   /* for PHI node */
  goto llvm_cbe_cond_next447_i;

llvm_cbe_cond_true478_i:
  llvm_cbe_tmp481_i = *(&(way2.field11));
  if ((llvm_cbe_tmp481_i == llvm_cbe_my_2_reg2mem_0_i)) {
    goto llvm_cbe_cond_true486_i;
  } else {
    llvm_cbe_flfinish_0_i__PHI_TEMPORARY = llvm_cbe_flfinish_0_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_bb489_i;
  }

llvm_cbe_cond_true486_i:
  llvm_cbe_flfinish_0_i__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
  goto llvm_cbe_bb489_i;

  } while (1); /* end of syntactic loop 'cond_next496.i' */
llvm_cbe_bb508_i:
  if ((llvm_cbe_flfinish_0_reg2mem_0_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_true514_i;
  } else {
    llvm_cbe_wayar_0_1_reg2mem_1_i__PHI_TEMPORARY = llvm_cbe_wayar_0_1_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_wayar_1_0_reg2mem_1_i__PHI_TEMPORARY = llvm_cbe_wayar_1_0_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_cond_next523_i;
  }

llvm_cbe_cond_true514_i:
   /*tail*/ free((((unsigned char *)llvm_cbe_wayar_0_1_reg2mem_0_i)));
  *llvm_cbe_wayar = ((struct l_struct_2E_pointt *)/*NULL*/0);
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
llvm_cbe_cond_next523_i_loopexit:
  llvm_cbe_tmp469_i = llvm_cbe_index_0_reg2mem_0_i + ((unsigned int )2);
  llvm_cbe_wayar_0_1_reg2mem_1_i__PHI_TEMPORARY = llvm_cbe_wayar_0_0_i;   /* for PHI node */
  llvm_cbe_wayar_1_0_reg2mem_1_i__PHI_TEMPORARY = llvm_cbe_tmp469_i;   /* for PHI node */
  goto llvm_cbe_cond_next523_i;

llvm_cbe_cond_next523_i:
  llvm_cbe_wayar_0_1_reg2mem_1_i = llvm_cbe_wayar_0_1_reg2mem_1_i__PHI_TEMPORARY;
  llvm_cbe_wayar_1_0_reg2mem_1_i = llvm_cbe_wayar_1_0_reg2mem_1_i__PHI_TEMPORARY;
  ltmp_96_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_wayar_1_0_reg2mem_1_i)) * ((unsigned long long )8ll)));
  *llvm_cbe_wayar = (((struct l_struct_2E_pointt *)ltmp_96_2));
  llvm_cbe_i_0640_i = llvm_cbe_wayar_1_0_reg2mem_1_i + ((unsigned int )-1);
  if ((((signed int )llvm_cbe_i_0640_i) > ((signed int )((unsigned int )-1)))) {
    goto llvm_cbe_bb534_preheader_i;
  } else {
    goto llvm_cbe_bb574_i;
  }

llvm_cbe_bb534_preheader_i:
  llvm_cbe_tmp655_i = (((((signed int )llvm_cbe_i_0640_i) < ((signed int )((unsigned int )0)))) ? (((unsigned int )1)) : (llvm_cbe_wayar_1_0_reg2mem_1_i));
  llvm_cbe_indvar_i10__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb534_i;

  do {     /* Syntactic loop 'bb534.i' to make GCC happy */
llvm_cbe_bb534_i:
  llvm_cbe_indvar_i10 = llvm_cbe_indvar_i10__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )101);
  CallEdgeProfiler(llvm_cbe_val315, llvm_cbe_val416, ((unsigned int )101));
  llvm_cbe_tmp536_i = *llvm_cbe_wayar;
  llvm_cbe_tmp547548_i = ((signed long long )(signed int )(llvm_cbe_i_0640_i - llvm_cbe_indvar_i10));
  llvm_cbe_tmp555_i = *(&llvm_cbe_wayar_0_1_reg2mem_1_i[((signed long long )llvm_cbe_tmp547548_i)].field0);
  llvm_cbe_tmp558_i = *(&llvm_cbe_wayar_0_1_reg2mem_1_i[((signed long long )llvm_cbe_tmp547548_i)].field1);
  llvm_cbe_tmp541559_i = ((signed long long )(signed int )llvm_cbe_indvar_i10);
  *(&llvm_cbe_tmp536_i[((signed long long )llvm_cbe_tmp541559_i)].field0) = llvm_cbe_tmp555_i;
  *(&llvm_cbe_tmp536_i[((signed long long )llvm_cbe_tmp541559_i)].field1) = llvm_cbe_tmp558_i;
  llvm_cbe_indvar_next_i12 = llvm_cbe_indvar_i10 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val416;
  *(&cg_caller_id_var) = llvm_cbe_val315;
  if ((llvm_cbe_indvar_next_i12 == llvm_cbe_tmp655_i)) {
    goto llvm_cbe_bb574_i;
  } else {
    llvm_cbe_indvar_i10__PHI_TEMPORARY = llvm_cbe_indvar_next_i12;   /* for PHI node */
    goto llvm_cbe_bb534_i;
  }

  } while (1); /* end of syntactic loop 'bb534.i' */
llvm_cbe_bb574_i:
   /*tail*/ free((((unsigned char *)llvm_cbe_wayar_0_1_reg2mem_1_i)));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )1);
}


static void _ZN6wayobj7destroyEv(void) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int *llvm_cbe_tmp2;
  unsigned int *llvm_cbe_tmp11;
  struct l_struct_2E_point16t *llvm_cbe_tmp23;
  unsigned short *llvm_cbe_tmp36;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )20);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )20));
  llvm_cbe_tmp2 = *(&way_2E_19);
  if ((llvm_cbe_tmp2 == ((unsigned int *)/*NULL*/0))) {
    goto llvm_cbe_cond_next;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_cond_true:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )20);
   /*tail*/ _ZdaPv((((unsigned char *)llvm_cbe_tmp2)));
  goto llvm_cbe_cond_next;

llvm_cbe_cond_next:
  llvm_cbe_tmp11 = *(&way_2E_18);
  if ((llvm_cbe_tmp11 == ((unsigned int *)/*NULL*/0))) {
    goto llvm_cbe_cond_next20;
  } else {
    goto llvm_cbe_cond_true15;
  }

llvm_cbe_cond_true15:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )20);
   /*tail*/ _ZdaPv((((unsigned char *)llvm_cbe_tmp11)));
  goto llvm_cbe_cond_next20;

llvm_cbe_cond_next20:
  llvm_cbe_tmp23 = *(&way_2E_17);
  if ((llvm_cbe_tmp23 == ((struct l_struct_2E_point16t *)/*NULL*/0))) {
    goto llvm_cbe_cond_next32;
  } else {
    goto llvm_cbe_cond_true27;
  }

llvm_cbe_cond_true27:
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )20);
   /*tail*/ _ZdaPv((((unsigned char *)llvm_cbe_tmp23)));
  goto llvm_cbe_cond_next32;

llvm_cbe_cond_next32:
  llvm_cbe_tmp36 = *(&way_2E_16);
  if ((llvm_cbe_tmp36 == ((unsigned short *)/*NULL*/0))) {
    goto llvm_cbe_UnifiedReturnBlock;
  } else {
    goto llvm_cbe_cond_true40;
  }

llvm_cbe_cond_true40:
  *(&cg_caller_call_site_var) = ((unsigned int )3);
  *(&cg_caller_id_var) = ((unsigned int )20);
   /*tail*/ _ZdaPv((((unsigned char *)llvm_cbe_tmp36)));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
llvm_cbe_UnifiedReturnBlock:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN6wayobj6createE17createwaymnginfot(unsigned int llvm_cbe_info_0_0, unsigned int llvm_cbe_info_0_1, unsigned int llvm_cbe_info_0_2, unsigned int llvm_cbe_info_0_3, unsigned int llvm_cbe_info_0_4, unsigned int llvm_cbe_info_0_5, unsigned int llvm_cbe_info_0_6, unsigned int llvm_cbe_info_0_7) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  struct l_struct_2E_createwaymnginfot llvm_cbe_info_addr;    /* Address-exposed local */
  struct l_unnamed1 *llvm_cbe_tmp;
  unsigned int llvm_cbe_tmp30;
  unsigned int llvm_cbe_tmp33;
  unsigned int llvm_cbe_tmp55;
  unsigned int llvm_cbe_tmp62;
  unsigned long long llvm_cbe_tmp196197;
  unsigned char *llvm_cbe_tmp200;
  unsigned char *llvm_cbe_tmp208;
  unsigned int llvm_cbe_tmp217;
  unsigned int llvm_cbe_tmp221;
  unsigned long long llvm_cbe_tmp223224;
  unsigned short *llvm_cbe_tmp228;
  unsigned char *ltmp_97_2;
  struct l_struct_2E_point16t *llvm_cbe_tmp235;
  unsigned char *ltmp_98_2;
  unsigned int llvm_cbe_tmp252370;
  unsigned short *llvm_cbe_tmp239;
  unsigned int llvm_cbe_tmp242;
  unsigned int llvm_cbe_y_0_reg2mem_0;
  unsigned int llvm_cbe_y_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp248;
  unsigned int llvm_cbe_y_1_reg2mem_0;
  unsigned int llvm_cbe_y_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp274;
  unsigned short *llvm_cbe_tmp261;
  unsigned int llvm_cbe_tmp264;
  unsigned int llvm_cbe_tmp269;
  unsigned int llvm_cbe_x_0_reg2mem_0;
  unsigned int llvm_cbe_x_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_tmp292;
  unsigned int llvm_cbe_tmp296;
  unsigned short *llvm_cbe_tmp287;
  unsigned int llvm_cbe_x_1385;
  unsigned int llvm_cbe_x_1385__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp318;
  unsigned short *llvm_cbe_tmp305;
  unsigned int llvm_cbe_tmp308;
  unsigned int llvm_cbe_tmp311;
  unsigned int llvm_cbe_tmp312;
  unsigned int llvm_cbe_tmp335;
  unsigned char *llvm_cbe_tmp344;
  unsigned int llvm_cbe_tmp350;
  unsigned char *llvm_cbe_tmp354;
  unsigned int llvm_cbe_tmp360;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )21);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )21));
  llvm_cbe_tmp = ((struct l_unnamed1 *)(&llvm_cbe_info_addr));
  *(((unsigned int *)(&llvm_cbe_info_addr))) = llvm_cbe_info_0_0;
  *(&llvm_cbe_tmp->field0[((signed int )((unsigned int )1))]) = llvm_cbe_info_0_1;
  *(&llvm_cbe_tmp->field0[((signed int )((unsigned int )2))]) = llvm_cbe_info_0_2;
  *(&llvm_cbe_tmp->field0[((signed int )((unsigned int )3))]) = llvm_cbe_info_0_3;
  *(&llvm_cbe_tmp->field0[((signed int )((unsigned int )4))]) = llvm_cbe_info_0_4;
  *(&llvm_cbe_tmp->field0[((signed int )((unsigned int )5))]) = llvm_cbe_info_0_5;
  *(&llvm_cbe_tmp->field0[((signed int )((unsigned int )6))]) = llvm_cbe_info_0_6;
  *(&llvm_cbe_tmp->field0[((signed int )((unsigned int )7))]) = llvm_cbe_info_0_7;
  llvm_cbe_tmp30 = *(&llvm_cbe_info_addr.field4);
  llvm_cbe_tmp33 = *(&llvm_cbe_info_addr.field5);
  *(&way_2E_0) = llvm_cbe_tmp30;
  *(&way_2E_1) = llvm_cbe_tmp33;
  *(&way_2E_2) = llvm_cbe_tmp30;
  llvm_cbe_tmp55 = ((unsigned int )1) << llvm_cbe_tmp30;
  *(&way_2E_3) = (llvm_cbe_tmp55 + ((unsigned int )-1));
  llvm_cbe_tmp62 = ((unsigned int )1) << llvm_cbe_tmp33;
  *(&way_2E_4) = (llvm_cbe_tmp62 + ((unsigned int )-1));
  *(&way_2E_5) = (llvm_cbe_tmp55 + ((unsigned int )-2));
  *(&way_2E_6) = (llvm_cbe_tmp62 + ((unsigned int )-2));
  *(&way_2E_7) = llvm_cbe_tmp55;
  *(&way_2E_8) = llvm_cbe_tmp62;
  llvm_cbe_tmp196197 = ((signed long long )(signed int )(llvm_cbe_tmp55 << llvm_cbe_tmp33));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )21);
  llvm_cbe_tmp200 = _Znam((llvm_cbe_tmp196197 << ((unsigned long long )1ll)));
  *(&way_2E_16) = (((unsigned short *)llvm_cbe_tmp200));
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )21);
  llvm_cbe_tmp208 = _Znam((llvm_cbe_tmp196197 << ((unsigned long long )2ll)));
  *(&way_2E_17) = (((struct l_struct_2E_point16t *)llvm_cbe_tmp208));
  llvm_cbe_tmp217 = *(&way_2E_0);
  llvm_cbe_tmp221 = *(&way_2E_1);
  llvm_cbe_tmp223224 = ((signed long long )(signed int )((((unsigned int )1) << llvm_cbe_tmp217) << llvm_cbe_tmp221));
  llvm_cbe_tmp228 = *(&way_2E_16);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )21);
  ltmp_97_2 = memset((((unsigned char *)llvm_cbe_tmp228)), (((unsigned int )(unsigned char )((unsigned char )0))), (llvm_cbe_tmp223224 << ((unsigned long long )1ll)));
  llvm_cbe_tmp235 = *(&way_2E_17);
  *(&cg_caller_call_site_var) = ((unsigned int )3);
  *(&cg_caller_id_var) = ((unsigned int )21);
  ltmp_98_2 = memset((((unsigned char *)llvm_cbe_tmp235)), (((unsigned int )(unsigned char )((unsigned char )0))), (llvm_cbe_tmp223224 << ((unsigned long long )2ll)));
  llvm_cbe_tmp252370 = *(&way_2E_8);
  if ((((signed int )llvm_cbe_tmp252370) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_preheader;
  } else {
    goto llvm_cbe_bb293;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp239 = *(&way_2E_16);
  llvm_cbe_tmp242 = *(&way_2E_2);
  llvm_cbe_y_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_y_0_reg2mem_0 = llvm_cbe_y_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )102);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )102));
  *(&llvm_cbe_tmp239[((signed long long )(((signed long long )(signed int )(llvm_cbe_y_0_reg2mem_0 << llvm_cbe_tmp242))))]) = ((unsigned short )-1);
  llvm_cbe_tmp248 = llvm_cbe_y_0_reg2mem_0 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp252370) > ((signed int )llvm_cbe_tmp248))) {
    llvm_cbe_y_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp248;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_bb275;
  }

  } while (1); /* end of syntactic loop 'bb' */
  do {     /* Syntactic loop 'bb258' to make GCC happy */
llvm_cbe_bb258:
  llvm_cbe_y_1_reg2mem_0 = llvm_cbe_y_1_reg2mem_0__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )103);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )103));
  *(&llvm_cbe_tmp261[((signed long long )(((signed long long )(signed int )((llvm_cbe_y_1_reg2mem_0 << llvm_cbe_tmp264) | llvm_cbe_tmp269))))]) = ((unsigned short )-1);
  llvm_cbe_tmp274 = llvm_cbe_y_1_reg2mem_0 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp252370) > ((signed int )llvm_cbe_tmp274))) {
    llvm_cbe_y_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp274;   /* for PHI node */
    goto llvm_cbe_bb258;
  } else {
    goto llvm_cbe_bb293;
  }

  } while (1); /* end of syntactic loop 'bb258' */
llvm_cbe_bb275:
  if ((((signed int )llvm_cbe_tmp252370) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb258_preheader;
  } else {
    goto llvm_cbe_bb293;
  }

llvm_cbe_bb258_preheader:
  llvm_cbe_tmp261 = *(&way_2E_16);
  llvm_cbe_tmp264 = *(&way_2E_2);
  llvm_cbe_tmp269 = *(&way_2E_3);
  llvm_cbe_y_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb258;

  do {     /* Syntactic loop 'bb284' to make GCC happy */
llvm_cbe_bb284:
  llvm_cbe_x_0_reg2mem_0 = llvm_cbe_x_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )104);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )104));
  *(&llvm_cbe_tmp287[((signed long long )(((signed long long )(signed int )llvm_cbe_x_0_reg2mem_0)))]) = ((unsigned short )-1);
  llvm_cbe_tmp292 = llvm_cbe_x_0_reg2mem_0 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )llvm_cbe_tmp296) > ((signed int )llvm_cbe_tmp292))) {
    llvm_cbe_x_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp292;   /* for PHI node */
    goto llvm_cbe_bb284;
  } else {
    goto llvm_cbe_bb319_preheader;
  }

  } while (1); /* end of syntactic loop 'bb284' */
llvm_cbe_bb293:
  llvm_cbe_tmp296 = *(&way_2E_7);
  if ((((signed int )llvm_cbe_tmp296) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb284_preheader;
  } else {
    goto llvm_cbe_bb327;
  }

llvm_cbe_bb284_preheader:
  llvm_cbe_tmp287 = *(&way_2E_16);
  llvm_cbe_x_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb284;

  do {     /* Syntactic loop 'bb302' to make GCC happy */
llvm_cbe_bb302:
  llvm_cbe_x_1385 = llvm_cbe_x_1385__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )105);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )105));
  *(&llvm_cbe_tmp305[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp312 | llvm_cbe_x_1385))))]) = ((unsigned short )-1);
  llvm_cbe_tmp318 = llvm_cbe_x_1385 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )llvm_cbe_tmp296) > ((signed int )llvm_cbe_tmp318))) {
    llvm_cbe_x_1385__PHI_TEMPORARY = llvm_cbe_tmp318;   /* for PHI node */
    goto llvm_cbe_bb302;
  } else {
    goto llvm_cbe_bb327;
  }

  } while (1); /* end of syntactic loop 'bb302' */
llvm_cbe_bb319_preheader:
  if ((((signed int )llvm_cbe_tmp296) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb302_preheader;
  } else {
    goto llvm_cbe_bb327;
  }

llvm_cbe_bb302_preheader:
  llvm_cbe_tmp305 = *(&way_2E_16);
  llvm_cbe_tmp308 = *(&way_2E_4);
  llvm_cbe_tmp311 = *(&way_2E_2);
  llvm_cbe_tmp312 = llvm_cbe_tmp308 << llvm_cbe_tmp311;
  llvm_cbe_x_1385__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb302;

llvm_cbe_bb327:
  llvm_cbe_tmp335 = (llvm_cbe_tmp252370 + llvm_cbe_tmp296) * ((unsigned int )12);
  *(&way_2E_20) = llvm_cbe_tmp335;
  *(&cg_caller_call_site_var) = ((unsigned int )4);
  *(&cg_caller_id_var) = ((unsigned int )21);
  llvm_cbe_tmp344 = _Znam(((((signed long long )(signed int )llvm_cbe_tmp335)) << ((unsigned long long )2ll)));
  *(&way_2E_18) = (((unsigned int *)llvm_cbe_tmp344));
  llvm_cbe_tmp350 = *(&way_2E_20);
  *(&cg_caller_call_site_var) = ((unsigned int )5);
  *(&cg_caller_id_var) = ((unsigned int )21);
  llvm_cbe_tmp354 = _Znam(((((signed long long )(signed int )llvm_cbe_tmp350)) << ((unsigned long long )2ll)));
  *(&way_2E_19) = (((unsigned int *)llvm_cbe_tmp354));
  llvm_cbe_tmp360 = *(&way_2E_2);
  *(&way_2E_21) = ((((unsigned int )1) << llvm_cbe_tmp360) + ((unsigned int )-1));
  *(&way_2E_25) = ((unsigned short )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


unsigned int main(unsigned int llvm_cbe_argc, unsigned char **llvm_cbe_argv) {
  struct l_struct_2E_createwaymnginfot llvm_cbe_info_i286;    /* Address-exposed local */
  struct l_struct_2E__2E_1_2E__38 llvm_cbe_xRunion_i;    /* Address-exposed local */
  struct l_struct_2E__2E_1_2E__38 llvm_cbe_yRunion_i;    /* Address-exposed local */
  struct l_struct_2E_createwaymnginfot llvm_cbe_info_i;    /* Address-exposed local */
  struct l_struct_2E_workinfot llvm_cbe_info;    /* Address-exposed local */
  unsigned int llvm_cbe_startx;    /* Address-exposed local */
  unsigned int llvm_cbe_starty;    /* Address-exposed local */
  unsigned int llvm_cbe_endx;    /* Address-exposed local */
  unsigned int llvm_cbe_endy;    /* Address-exposed local */
  struct l_struct_2E_point16t *llvm_cbe_wayar;    /* Address-exposed local */
  unsigned int llvm_cbe_waylength;    /* Address-exposed local */
  struct l_struct_2E_regobj **llvm_cbe_wayar187;    /* Address-exposed local */
  unsigned int llvm_cbe_waylength188;    /* Address-exposed local */
  struct l_struct_2E_pointt *llvm_cbe_wayar288;    /* Address-exposed local */
  unsigned int llvm_cbe_waylength289;    /* Address-exposed local */
  unsigned char llvm_cbe_movetimear[256];    /* Address-exposed local */
  struct l_struct_2E_pointt *llvm_cbe_wayar453;    /* Address-exposed local */
  unsigned int llvm_cbe_waylength454;    /* Address-exposed local */
  unsigned char llvm_cbe_movetimear456[256];    /* Address-exposed local */
  unsigned int llvm_cbe_startx703;    /* Address-exposed local */
  unsigned int llvm_cbe_starty704;    /* Address-exposed local */
  unsigned int llvm_cbe_endx705;    /* Address-exposed local */
  unsigned int llvm_cbe_endy706;    /* Address-exposed local */
  struct l_struct_2E_point16t *llvm_cbe_wayar707;    /* Address-exposed local */
  unsigned int llvm_cbe_waylength708;    /* Address-exposed local */
  struct l_struct_2E_regobj **llvm_cbe_wayar779;    /* Address-exposed local */
  unsigned int llvm_cbe_waylength780;    /* Address-exposed local */
  unsigned int llvm_cbe_tmp19;
  unsigned int llvm_cbe_tmp21;
  unsigned int llvm_cbe_tmp26;
  unsigned char *llvm_cbe_tmp30;
  struct l_struct_2E_FILE *llvm_cbe_tmp32;
  unsigned int llvm_cbe_tmp39;
  unsigned char *llvm_cbe_tmp45;
  unsigned int llvm_cbe_tmp46;
  unsigned int *llvm_cbe_tmp49;
  unsigned int llvm_cbe_tmp50;
  unsigned int *llvm_cbe_tmp53;
  unsigned int llvm_cbe_tmp54;
  unsigned int *llvm_cbe_tmp57;
  unsigned int llvm_cbe_tmp58;
  unsigned int *llvm_cbe_tmp61;
  unsigned int llvm_cbe_tmp62;
  unsigned int *llvm_cbe_tmp65;
  unsigned int llvm_cbe_tmp66;
  unsigned int *llvm_cbe_tmp69;
  unsigned int llvm_cbe_tmp70;
  unsigned int *llvm_cbe_tmp73;
  unsigned int llvm_cbe_tmp74;
  float *llvm_cbe_tmp77;
  unsigned int llvm_cbe_tmp78;
  unsigned int *llvm_cbe_tmp81;
  unsigned int llvm_cbe_tmp82;
  unsigned int *llvm_cbe_tmp85;
  unsigned int llvm_cbe_tmp86;
  unsigned int *llvm_cbe_tmp89;
  unsigned int llvm_cbe_tmp90;
  unsigned int llvm_cbe_tmp92;
  unsigned int llvm_cbe_tmp94;
  unsigned int llvm_cbe_tmp97;
  unsigned int llvm_cbe_tmp8_i;
  unsigned int llvm_cbe_tmp9_i;
  unsigned char *ltmp_99_2;
  unsigned char *ltmp_100_2;
  unsigned int llvm_cbe_tmp2_i;
  unsigned long long llvm_cbe_tmp11_i;
  struct l_struct_2E__2E_0_2E__27 *llvm_cbe_tmp1314_i;
  unsigned long long llvm_cbe_tmp16_i;
  unsigned long long llvm_cbe_tmp21_i6;
  unsigned long long llvm_cbe_tmp26_i7;
  unsigned long long llvm_cbe_tmp31_i8;
  struct l_struct_2E__2E_0_2E__27 *llvm_cbe_tmp3334_i;
  unsigned long long llvm_cbe_tmp36_i9;
  unsigned long long llvm_cbe_tmp41_i;
  unsigned long long llvm_cbe_tmp47_i11;
  unsigned int llvm_cbe_tmp49_i;
  unsigned int llvm_cbe_tmp51_i;
  double llvm_cbe_tmp58_i;
  double llvm_cbe_tmp66_i;
  struct l_unnamed1 *llvm_cbe_tmp75_i;
  unsigned int llvm_cbe_tmp78_i;
  unsigned int llvm_cbe_tmp80_i;
  unsigned int llvm_cbe_tmp82_i;
  unsigned int llvm_cbe_tmp84_i;
  unsigned int llvm_cbe_tmp86_i;
  unsigned int llvm_cbe_tmp88_i;
  unsigned int llvm_cbe_tmp91_i;
  unsigned int llvm_cbe_tmp93_i;
  unsigned int llvm_cbe_tmp96_i;
  unsigned char *ltmp_101_2;
  unsigned char *ltmp_102_2;
  unsigned long long llvm_cbe_tmp105_i;
  unsigned int llvm_cbe_tmp147163_i;
  unsigned int llvm_cbe_tmp136168_i;
  unsigned short *llvm_cbe_tmp109_i;
  unsigned int llvm_cbe_tmp112_i;
  unsigned int llvm_cbe_indvar170_i;
  unsigned int llvm_cbe_indvar170_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val329;
  unsigned int llvm_cbe_val430;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph_i;
  unsigned int llvm_cbe_tmp114_i;
  unsigned int llvm_cbe_indvar_i;
  unsigned int llvm_cbe_indvar_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val331;
  unsigned int llvm_cbe_val432;
  unsigned int llvm_cbe_x_0166_i;
  unsigned long long llvm_cbe_tmp123125_i;
  unsigned char llvm_cbe_tmp127_i;
  unsigned int llvm_cbe_tmp155_i;
  unsigned int llvm_cbe_tmp2_i14;
  unsigned long long llvm_cbe_tmp13_i16;
  unsigned long long llvm_cbe_tmp20_i17;
  unsigned long long llvm_cbe_tmp27_i;
  unsigned long long llvm_cbe_tmp34_i;
  unsigned long long llvm_cbe_tmp41_i18;
  unsigned long long llvm_cbe_tmp48_i19;
  unsigned long long llvm_cbe_tmp55_i20;
  unsigned long long llvm_cbe_tmp62_i21;
  unsigned int llvm_cbe_tmp66_i22;
  unsigned int llvm_cbe_tmp72_i23;
  unsigned int llvm_cbe_tmp93_i26;
  unsigned char *ltmp_103_2;
  unsigned char *ltmp_104_2;
  unsigned char *ltmp_105_2;
  unsigned short *ltmp_106_10;
  unsigned char *ltmp_107_2;
  unsigned int llvm_cbe_tmp141_i;
  unsigned int llvm_cbe_tmp144_i;
  unsigned char *llvm_cbe_tmp149_i29;
  unsigned long long llvm_cbe_tmp151_i;
  unsigned int llvm_cbe_i_0_reg2mem_0_i;
  unsigned int llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val327;
  unsigned int llvm_cbe_val428;
  unsigned int llvm_cbe_indvar_next_i;
  unsigned int llvm_cbe_tmp169_i;
  unsigned int llvm_cbe_tmp118;
  unsigned long long llvm_cbe_tmp120;
  unsigned int llvm_cbe_tmp178921;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_8_4;
  unsigned long long llvm_cbe_stat_8_4__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_5_4;
  unsigned long long llvm_cbe_stat_5_4__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp122;
  unsigned int llvm_cbe_tmp8_i66;
  unsigned int llvm_cbe_tmp10_i68;
  unsigned int llvm_cbe_tmp11_i69;
  unsigned int llvm_cbe_tmp13_i70;
  unsigned int llvm_cbe_tmp14_i;
  unsigned int llvm_cbe_tmp16_i72;
  float llvm_cbe_tmp36_i79;
  unsigned int llvm_cbe_tmp50_i83;
  unsigned int llvm_cbe_tmp125;
  unsigned int llvm_cbe_tmp10_i87;
  unsigned int llvm_cbe_tmp13_i90;
  unsigned int llvm_cbe_tmp16_i93;
  float llvm_cbe_tmp36_i101;
  unsigned int llvm_cbe_tmp50_i107;
  unsigned char llvm_cbe_tmp129;
  unsigned int llvm_cbe_tmp134;
  unsigned int llvm_cbe_tmp8_i157;
  unsigned int llvm_cbe_tmp10_i159;
  unsigned int llvm_cbe_tmp11_i160;
  unsigned int llvm_cbe_tmp13_i162;
  unsigned int llvm_cbe_tmp14_i163;
  unsigned int llvm_cbe_tmp16_i165;
  float llvm_cbe_tmp36_i173;
  unsigned int llvm_cbe_tmp50_i179;
  unsigned int llvm_cbe_tmp137;
  unsigned int llvm_cbe_tmp10_i231;
  unsigned int llvm_cbe_tmp13_i234;
  unsigned int llvm_cbe_tmp16_i237;
  float llvm_cbe_tmp36_i245;
  unsigned int llvm_cbe_tmp50_i251;
  unsigned char llvm_cbe_tmp141;
  unsigned int llvm_cbe_tmp145;
  unsigned int llvm_cbe_tmp146;
  unsigned int llvm_cbe_tmp147;
  unsigned int llvm_cbe_tmp148;
  unsigned char llvm_cbe_tmp149;
  unsigned char llvm_cbe_flcreate_0;
  unsigned char llvm_cbe_flcreate_0__PHI_TEMPORARY;
  struct l_struct_2E_point16t *llvm_cbe_tmp151;
  unsigned char llvm_cbe_flcreate_1;
  unsigned char llvm_cbe_flcreate_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp165;
  unsigned long long llvm_cbe_tmp167;
  unsigned long long llvm_cbe_tmp171;
  unsigned long long llvm_cbe_stat_8_3;
  unsigned long long llvm_cbe_stat_8_3__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_5_3;
  unsigned long long llvm_cbe_stat_5_3__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp175;
  unsigned int llvm_cbe_tmp178;
  unsigned long long llvm_cbe_stat_8_5;
  unsigned long long llvm_cbe_stat_8_5__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_5_5;
  unsigned long long llvm_cbe_stat_5_5__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp185;
  unsigned int llvm_cbe_tmp273926;
  unsigned int llvm_cbe_i_1_reg2mem_0;
  unsigned int llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_12_4;
  unsigned long long llvm_cbe_stat_12_4__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_11_4;
  unsigned long long llvm_cbe_stat_11_4__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_tmp192;
  unsigned int llvm_cbe_tmp3_i320;
  unsigned int llvm_cbe_tmp5_i322;
  unsigned int llvm_cbe_tmp6_i323;
  unsigned int llvm_cbe_tmp8_i325;
  unsigned int llvm_cbe_tmp9_i326;
  unsigned int llvm_cbe_tmp11_i328;
  float llvm_cbe_tmp31_i336;
  float llvm_cbe_tmp4142_i340;
  unsigned int llvm_cbe_tmp5_i353;
  unsigned int llvm_cbe_tmp8_i356;
  unsigned int llvm_cbe_tmp11_i359;
  float llvm_cbe_tmp31_i367;
  struct l_struct_2E_regobj **llvm_cbe_tmp204;
  struct l_struct_2E_regobj *llvm_cbe_tmp211;
  unsigned int llvm_cbe_tmp215;
  struct l_struct_2E_regobj *llvm_cbe_tmp233;
  unsigned int llvm_cbe_tmp237;
  unsigned char llvm_cbe_tmp245;
  struct l_struct_2E_regobj **llvm_cbe_tmp246;
  unsigned int llvm_cbe_tmp259;
  unsigned long long llvm_cbe_tmp261;
  unsigned long long llvm_cbe_tmp265;
  unsigned long long llvm_cbe_stat_12_3;
  unsigned long long llvm_cbe_stat_12_3__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_11_3;
  unsigned long long llvm_cbe_stat_11_3__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp270;
  unsigned int llvm_cbe_tmp273;
  unsigned long long llvm_cbe_stat_12_5;
  unsigned long long llvm_cbe_stat_12_5__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_11_5;
  unsigned long long llvm_cbe_stat_11_5__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_tmp5_i470;
  struct l_struct_2E_regobj **llvm_cbe_tmp13_i471;
  unsigned int llvm_cbe_tmp2_i568;
  unsigned long long llvm_cbe_tmp13_i570;
  unsigned long long llvm_cbe_tmp20_i571;
  unsigned long long llvm_cbe_tmp27_i572;
  unsigned long long llvm_cbe_tmp34_i573;
  unsigned long long llvm_cbe_tmp41_i574;
  unsigned long long llvm_cbe_tmp48_i575;
  unsigned long long llvm_cbe_tmp55_i576;
  unsigned long long llvm_cbe_tmp62_i577;
  unsigned int llvm_cbe_tmp66_i578;
  unsigned int llvm_cbe_tmp72_i579;
  unsigned int llvm_cbe_i_0_reg2mem_0_i581;
  unsigned int llvm_cbe_i_0_reg2mem_0_i581__PHI_TEMPORARY;
  unsigned int llvm_cbe_val325;
  unsigned int llvm_cbe_val426;
  unsigned long long llvm_cbe_tmp7578_i;
  unsigned char *ltmp_108_2;
  unsigned int llvm_cbe_indvar_next_i584;
  unsigned int llvm_cbe_tmp129_i;
  unsigned char *ltmp_109_2;
  struct l_struct_2E_point16t *ltmp_110_11;
  unsigned char *ltmp_111_2;
  unsigned int llvm_cbe_tmp153_i;
  unsigned int llvm_cbe_tmp156_i591;
  unsigned int llvm_cbe_tmp157_i;
  unsigned char *ltmp_112_2;
  unsigned char *ltmp_113_2;
  unsigned long long llvm_cbe_tmp174_i;
  unsigned int llvm_cbe_tmp176_i;
  unsigned int llvm_cbe_tmp440931;
  unsigned char *llvm_cbe_tmp305;
  unsigned char *llvm_cbe_tmp306;
  unsigned char *llvm_cbe_tmp307;
  unsigned int llvm_cbe_i_2_reg2mem_0_ph;
  unsigned int llvm_cbe_i_2_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_9_1_ph;
  unsigned long long llvm_cbe_stat_9_1_ph__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_6_1_ph;
  unsigned long long llvm_cbe_stat_6_1_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  unsigned int llvm_cbe_j_0965;
  unsigned int llvm_cbe_j_0965__PHI_TEMPORARY;
  unsigned int llvm_cbe_val35;
  unsigned int llvm_cbe_val46;
  unsigned int llvm_cbe_indvar_next984;
  unsigned int llvm_cbe_tmp309;
  float llvm_cbe_tmp56_i544;
  unsigned int llvm_cbe_tmp8_i545;
  unsigned int llvm_cbe_tmp10_i547;
  unsigned int llvm_cbe_tmp11_i548;
  unsigned int llvm_cbe_tmp13_i550;
  unsigned int llvm_cbe_tmp14_i551;
  unsigned int llvm_cbe_tmp16_i553;
  float llvm_cbe_tmp36_i561;
  unsigned int llvm_cbe_tmp50_i567;
  unsigned int llvm_cbe_tmp319;
  float llvm_cbe_tmp56_i520;
  unsigned int llvm_cbe_tmp10_i523;
  unsigned int llvm_cbe_tmp13_i526;
  unsigned int llvm_cbe_tmp16_i529;
  float llvm_cbe_tmp36_i537;
  unsigned int llvm_cbe_tmp50_i543;
  unsigned char *llvm_cbe_tmp334;
  unsigned char llvm_cbe_tmp343;
  unsigned char llvm_cbe_tmp352;
  unsigned int llvm_cbe_tmp10_i499;
  unsigned int llvm_cbe_tmp13_i502;
  unsigned int llvm_cbe_tmp16_i505;
  float llvm_cbe_tmp36_i513;
  unsigned int llvm_cbe_tmp10_i475;
  unsigned int llvm_cbe_tmp13_i478;
  unsigned int llvm_cbe_tmp16_i481;
  float llvm_cbe_tmp36_i489;
  unsigned char llvm_cbe_tmp417;
  struct l_struct_2E_pointt *llvm_cbe_tmp419;
  unsigned int llvm_cbe_tmp427;
  unsigned long long llvm_cbe_tmp429;
  unsigned long long llvm_cbe_tmp433;
  unsigned long long llvm_cbe_stat_9_0;
  unsigned long long llvm_cbe_stat_9_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_6_0;
  unsigned long long llvm_cbe_stat_6_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp437;
  unsigned int llvm_cbe_tmp440;
  unsigned long long llvm_cbe_stat_9_2;
  unsigned long long llvm_cbe_stat_9_2__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_6_2;
  unsigned long long llvm_cbe_stat_6_2__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp447;
  unsigned int llvm_cbe_tmp611936;
  unsigned char *llvm_cbe_tmp472;
  unsigned char *llvm_cbe_tmp473;
  unsigned char *llvm_cbe_tmp474;
  unsigned int llvm_cbe_i_3_reg2mem_0_ph;
  unsigned int llvm_cbe_i_3_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_10_1_ph;
  unsigned long long llvm_cbe_stat_10_1_ph__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_7_1_ph;
  unsigned long long llvm_cbe_stat_7_1_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_val37;
  unsigned int llvm_cbe_val48;
  unsigned int llvm_cbe_j457_0963;
  unsigned int llvm_cbe_j457_0963__PHI_TEMPORARY;
  unsigned int llvm_cbe_val39;
  unsigned int llvm_cbe_val410;
  unsigned int llvm_cbe_indvar_next979;
  unsigned int llvm_cbe_tmp476;
  float llvm_cbe_tmp56_i446;
  unsigned int llvm_cbe_tmp8_i447;
  unsigned int llvm_cbe_tmp10_i449;
  unsigned int llvm_cbe_tmp11_i450;
  unsigned int llvm_cbe_tmp13_i452;
  unsigned int llvm_cbe_tmp14_i453;
  unsigned int llvm_cbe_tmp16_i455;
  float llvm_cbe_tmp36_i463;
  unsigned int llvm_cbe_tmp50_i469;
  unsigned int llvm_cbe_tmp488;
  float llvm_cbe_tmp56_i422;
  unsigned int llvm_cbe_tmp10_i425;
  unsigned int llvm_cbe_tmp13_i428;
  unsigned int llvm_cbe_tmp16_i431;
  float llvm_cbe_tmp36_i439;
  unsigned int llvm_cbe_tmp50_i445;
  unsigned char *llvm_cbe_tmp505;
  unsigned char llvm_cbe_tmp514;
  unsigned char llvm_cbe_tmp523;
  unsigned int llvm_cbe_tmp10_i401;
  unsigned int llvm_cbe_tmp13_i404;
  unsigned int llvm_cbe_tmp16_i407;
  float llvm_cbe_tmp36_i415;
  unsigned int llvm_cbe_tmp10_i377;
  unsigned int llvm_cbe_tmp13_i380;
  unsigned int llvm_cbe_tmp16_i383;
  float llvm_cbe_tmp36_i391;
  unsigned char llvm_cbe_tmp588;
  struct l_struct_2E_pointt *llvm_cbe_tmp590;
  unsigned int llvm_cbe_tmp598;
  unsigned long long llvm_cbe_tmp600;
  unsigned long long llvm_cbe_tmp604;
  unsigned long long llvm_cbe_stat_10_0;
  unsigned long long llvm_cbe_stat_10_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_7_0;
  unsigned long long llvm_cbe_stat_7_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp608;
  unsigned int llvm_cbe_tmp611;
  unsigned long long llvm_cbe_stat_10_2;
  unsigned long long llvm_cbe_stat_10_2__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_7_2;
  unsigned long long llvm_cbe_stat_7_2__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_0_reg2mem_0_i343;
  unsigned int llvm_cbe_i_0_reg2mem_0_i343__PHI_TEMPORARY;
  unsigned int llvm_cbe_val311;
  unsigned int llvm_cbe_val412;
  struct l_struct_2E_pointt *llvm_cbe_tmp8_i346;
  unsigned int llvm_cbe_indvar_next_i347;
  unsigned char *llvm_cbe_tmp20_i350;
  struct l_struct_2E_point16t *llvm_cbe_tmp23_i;
  unsigned int llvm_cbe_tmp4_i;
  unsigned int llvm_cbe_tmp5_i;
  unsigned int llvm_cbe_tmp10_i;
  unsigned int llvm_cbe_tmp15_i;
  unsigned int llvm_cbe_tmp20_i;
  unsigned int llvm_cbe_tmp21_i;
  unsigned int llvm_cbe_tmp26_i;
  unsigned int llvm_cbe_tmp31_i;
  unsigned int llvm_cbe_tmp36_i;
  unsigned int llvm_cbe_tmp37_i;
  unsigned int llvm_cbe_tmp42_i;
  unsigned int llvm_cbe_tmp47_i;
  unsigned int llvm_cbe_tmp52_i;
  unsigned int llvm_cbe_tmp57_i;
  unsigned int llvm_cbe_tmp62_i;
  unsigned int llvm_cbe_tmp67_i;
  unsigned int llvm_cbe_tmp618;
  unsigned int llvm_cbe_tmp620;
  unsigned int llvm_cbe_tmp622;
  unsigned int llvm_cbe_tmp8_i314;
  unsigned int llvm_cbe_tmp9_i315;
  unsigned char *ltmp_114_2;
  unsigned char *ltmp_115_2;
  float llvm_cbe_tmp624;
  unsigned int llvm_cbe_tmp626;
  unsigned int llvm_cbe_tmp628;
  double llvm_cbe_tmp7_i291;
  double llvm_cbe_tmp15_i296;
  struct l_unnamed1 *llvm_cbe_tmp24_i299;
  unsigned int llvm_cbe_tmp27_i301;
  unsigned int llvm_cbe_tmp29_i303;
  unsigned int llvm_cbe_tmp31_i305;
  unsigned int llvm_cbe_tmp33_i;
  unsigned int llvm_cbe_tmp35_i308;
  unsigned int llvm_cbe_tmp37_i310;
  unsigned int llvm_cbe_tmp39_i311;
  unsigned int llvm_cbe_tmp41_i313;
  unsigned int llvm_cbe_tmp16_i276;
  unsigned int llvm_cbe_tmp25_i277;
  unsigned char *ltmp_116_2;
  unsigned char *ltmp_117_2;
  unsigned char *ltmp_118_2;
  unsigned short *ltmp_119_10;
  unsigned char *ltmp_120_2;
  unsigned int llvm_cbe_i_0_reg2mem_0_i281;
  unsigned int llvm_cbe_i_0_reg2mem_0_i281__PHI_TEMPORARY;
  unsigned int llvm_cbe_val313;
  unsigned int llvm_cbe_val414;
  unsigned int llvm_cbe_indvar_next_i283;
  unsigned char *llvm_cbe_tmp638;
  unsigned int llvm_cbe_tmp977;
  float llvm_cbe_tmp4_i261;
  unsigned short *llvm_cbe_tmp2_i252;
  unsigned int llvm_cbe_tmp5_i253;
  unsigned int llvm_cbe_y1rnd_promoted;
  unsigned int llvm_cbe_y2rnd_promoted;
  unsigned int llvm_cbe_y3rnd_promoted;
  unsigned int llvm_cbe_y3rnd_tmp_1;
  unsigned int llvm_cbe_y3rnd_tmp_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_y2rnd_tmp_1;
  unsigned int llvm_cbe_y2rnd_tmp_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_y1rnd_tmp_1;
  unsigned int llvm_cbe_y1rnd_tmp_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_y630_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y630_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp650;
  unsigned int llvm_cbe_tmp7_i254;
  unsigned int llvm_cbe_y3rnd_tmp_0;
  unsigned int llvm_cbe_y3rnd_tmp_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_y2rnd_tmp_0;
  unsigned int llvm_cbe_y2rnd_tmp_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_y1rnd_tmp_0;
  unsigned int llvm_cbe_y1rnd_tmp_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_x629_0_reg2mem_0;
  unsigned int llvm_cbe_tmp8_i264;
  unsigned int llvm_cbe_tmp11_i267;
  unsigned int llvm_cbe_tmp14_i270;
  float llvm_cbe_tmp34_i272;
  unsigned char *llvm_cbe_tmp655;
  unsigned int llvm_cbe_tmp668;
  unsigned int llvm_cbe_indvar_next973;
  unsigned short *llvm_cbe_tmp11_i256;
  unsigned short llvm_cbe_tmp12_i257;
  unsigned int llvm_cbe_y3rnd_tmp_0599;
  unsigned int llvm_cbe_y3rnd_tmp_0599__PHI_TEMPORARY;
  unsigned int llvm_cbe_y2rnd_tmp_0598;
  unsigned int llvm_cbe_y2rnd_tmp_0598__PHI_TEMPORARY;
  unsigned int llvm_cbe_y1rnd_tmp_0597;
  unsigned int llvm_cbe_y1rnd_tmp_0597__PHI_TEMPORARY;
  unsigned int llvm_cbe_x629_0;
  unsigned int llvm_cbe_x629_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val317;
  unsigned int llvm_cbe_val418;
  unsigned int llvm_cbe_y3rnd_tmp_0602;
  unsigned int llvm_cbe_y3rnd_tmp_0602__PHI_TEMPORARY;
  unsigned int llvm_cbe_y2rnd_tmp_0601;
  unsigned int llvm_cbe_y2rnd_tmp_0601__PHI_TEMPORARY;
  unsigned int llvm_cbe_y1rnd_tmp_0600;
  unsigned int llvm_cbe_y1rnd_tmp_0600__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar_next975;
  unsigned int llvm_cbe_tmp699;
  unsigned long long llvm_cbe_tmp701;
  unsigned int llvm_cbe_tmp767951;
  unsigned int llvm_cbe_i_4_reg2mem_0;
  unsigned int llvm_cbe_i_4_reg2mem_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_8_1;
  unsigned long long llvm_cbe_stat_8_1__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_5_1;
  unsigned long long llvm_cbe_stat_5_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_val321;
  unsigned int llvm_cbe_val422;
  unsigned int llvm_cbe_tmp711;
  unsigned int llvm_cbe_tmp8_i205;
  unsigned int llvm_cbe_tmp10_i207;
  unsigned int llvm_cbe_tmp11_i208;
  unsigned int llvm_cbe_tmp13_i210;
  unsigned int llvm_cbe_tmp14_i211;
  unsigned int llvm_cbe_tmp16_i213;
  float llvm_cbe_tmp36_i221;
  unsigned int llvm_cbe_tmp50_i227;
  unsigned int llvm_cbe_tmp714;
  unsigned int llvm_cbe_tmp10_i183;
  unsigned int llvm_cbe_tmp13_i186;
  unsigned int llvm_cbe_tmp16_i189;
  float llvm_cbe_tmp36_i197;
  unsigned int llvm_cbe_tmp50_i203;
  unsigned char llvm_cbe_tmp718;
  unsigned int llvm_cbe_tmp723;
  unsigned int llvm_cbe_tmp8_i133;
  unsigned int llvm_cbe_tmp10_i135;
  unsigned int llvm_cbe_tmp11_i136;
  unsigned int llvm_cbe_tmp13_i138;
  unsigned int llvm_cbe_tmp14_i139;
  unsigned int llvm_cbe_tmp16_i141;
  float llvm_cbe_tmp36_i149;
  unsigned int llvm_cbe_tmp50_i155;
  unsigned int llvm_cbe_tmp726;
  unsigned int llvm_cbe_tmp10_i111;
  unsigned int llvm_cbe_tmp13_i114;
  unsigned int llvm_cbe_tmp16_i117;
  float llvm_cbe_tmp36_i125;
  unsigned int llvm_cbe_tmp50_i131;
  unsigned char llvm_cbe_tmp730;
  unsigned int llvm_cbe_tmp734;
  unsigned int llvm_cbe_tmp735;
  unsigned int llvm_cbe_tmp736;
  unsigned int llvm_cbe_tmp737;
  unsigned char llvm_cbe_tmp738;
  unsigned char llvm_cbe_flcreate709_0;
  unsigned char llvm_cbe_flcreate709_0__PHI_TEMPORARY;
  struct l_struct_2E_point16t *llvm_cbe_tmp740;
  unsigned char llvm_cbe_flcreate709_1;
  unsigned char llvm_cbe_flcreate709_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp754;
  unsigned long long llvm_cbe_tmp756;
  unsigned long long llvm_cbe_tmp760;
  unsigned long long llvm_cbe_stat_8_0;
  unsigned long long llvm_cbe_stat_8_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_5_0;
  unsigned long long llvm_cbe_stat_5_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp764;
  unsigned int llvm_cbe_tmp767;
  unsigned long long llvm_cbe_stat_8_2;
  unsigned long long llvm_cbe_stat_8_2__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_5_2;
  unsigned long long llvm_cbe_stat_5_2__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp866956;
  unsigned int llvm_cbe_i_5_reg2mem_0;
  unsigned int llvm_cbe_i_5_reg2mem_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_12_1;
  unsigned long long llvm_cbe_stat_12_1__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_11_1;
  unsigned long long llvm_cbe_stat_11_1__PHI_TEMPORARY;
  unsigned int llvm_cbe_val323;
  unsigned int llvm_cbe_val424;
  unsigned int llvm_cbe_tmp784;
  unsigned int llvm_cbe_tmp3_i43;
  unsigned int llvm_cbe_tmp5_i45;
  unsigned int llvm_cbe_tmp6_i46;
  unsigned int llvm_cbe_tmp8_i48;
  unsigned int llvm_cbe_tmp9_i49;
  unsigned int llvm_cbe_tmp11_i51;
  float llvm_cbe_tmp31_i59;
  float llvm_cbe_tmp4142_i63;
  unsigned int llvm_cbe_tmp5_i33;
  unsigned int llvm_cbe_tmp8_i34;
  unsigned int llvm_cbe_tmp11_i37;
  float llvm_cbe_tmp31_i41;
  struct l_struct_2E_regobj **llvm_cbe_tmp797;
  struct l_struct_2E_regobj *llvm_cbe_tmp804;
  unsigned int llvm_cbe_tmp808;
  struct l_struct_2E_regobj *llvm_cbe_tmp826;
  unsigned int llvm_cbe_tmp830;
  unsigned char llvm_cbe_tmp838;
  struct l_struct_2E_regobj **llvm_cbe_tmp839;
  unsigned int llvm_cbe_tmp852;
  unsigned long long llvm_cbe_tmp854;
  unsigned long long llvm_cbe_tmp858;
  unsigned long long llvm_cbe_stat_12_0;
  unsigned long long llvm_cbe_stat_12_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_11_0;
  unsigned long long llvm_cbe_stat_11_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp863;
  unsigned int llvm_cbe_tmp866;
  unsigned long long llvm_cbe_stat_12_2;
  unsigned long long llvm_cbe_stat_12_2__PHI_TEMPORARY;
  unsigned long long llvm_cbe_stat_11_2;
  unsigned long long llvm_cbe_stat_11_2__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_tmp5_i13;
  struct l_struct_2E_regobj **llvm_cbe_tmp13_i;
  unsigned int llvm_cbe_tmp4_i879;
  unsigned int llvm_cbe_tmp5_i880;
  unsigned int llvm_cbe_tmp10_i883;
  unsigned int llvm_cbe_tmp15_i886;
  unsigned int llvm_cbe_tmp20_i889;
  unsigned int llvm_cbe_tmp21_i890;
  unsigned int llvm_cbe_tmp26_i893;
  unsigned int llvm_cbe_tmp31_i896;
  unsigned int llvm_cbe_tmp36_i899;
  unsigned int llvm_cbe_tmp37_i900;
  unsigned int llvm_cbe_tmp42_i903;
  unsigned int llvm_cbe_tmp47_i906;
  unsigned int llvm_cbe_tmp52_i909;
  unsigned int llvm_cbe_tmp57_i912;
  unsigned int llvm_cbe_tmp62_i915;
  unsigned int llvm_cbe_tmp67_i918;
  unsigned int llvm_cbe_tmp873;

  CODE_FOR_MAIN();
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp19 = puts((&(_2E_str13[((signed long long )((unsigned long long )0ll))])));
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp21 = puts((&(_2E_str14[((signed long long )((unsigned long long )0ll))])));
  if ((llvm_cbe_argc == ((unsigned int )2))) {
    goto llvm_cbe_cond_next;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_cond_true:
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp26 = puts((&(_2E_str15[((signed long long )((unsigned long long )0ll))])));
  CallProfPrinter();
  return ((unsigned int )1);
llvm_cbe_cond_next:
  llvm_cbe_tmp30 = *(&llvm_cbe_argv[((signed long long )((unsigned long long )1ll))]);
  *(&cg_caller_call_site_var) = ((unsigned int )3);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp32 = fopen(llvm_cbe_tmp30, (&(_2E_str16[((signed long long )((unsigned long long )0ll))])));
  if ((llvm_cbe_tmp32 == ((struct l_struct_2E_FILE *)/*NULL*/0))) {
    goto llvm_cbe_cond_true37;
  } else {
    goto llvm_cbe_cond_next41;
  }

llvm_cbe_cond_true37:
  *(&cg_caller_call_site_var) = ((unsigned int )4);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp39 = puts((&(_2E_str1713[((signed long long )((unsigned long long )0ll))])));
  CallProfPrinter();
  return ((unsigned int )1);
llvm_cbe_cond_next41:
  llvm_cbe_tmp45 = &llvm_cbe_info.field0[((signed long long )((unsigned long long )0ll))];
  *(&cg_caller_call_site_var) = ((unsigned int )5);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp46 = fscanf(llvm_cbe_tmp32, (&(_2E_str18[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp45);
  llvm_cbe_tmp49 = &llvm_cbe_info.field1;
  *(&cg_caller_call_site_var) = ((unsigned int )6);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp50 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp49);
  llvm_cbe_tmp53 = &llvm_cbe_info.field2;
  *(&cg_caller_call_site_var) = ((unsigned int )7);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp54 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp53);
  llvm_cbe_tmp57 = &llvm_cbe_info.field3;
  *(&cg_caller_call_site_var) = ((unsigned int )8);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp58 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp57);
  llvm_cbe_tmp61 = &llvm_cbe_info.field4;
  *(&cg_caller_call_site_var) = ((unsigned int )9);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp62 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp61);
  llvm_cbe_tmp65 = &llvm_cbe_info.field5;
  *(&cg_caller_call_site_var) = ((unsigned int )10);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp66 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp65);
  llvm_cbe_tmp69 = &llvm_cbe_info.field6;
  *(&cg_caller_call_site_var) = ((unsigned int )11);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp70 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp69);
  llvm_cbe_tmp73 = &llvm_cbe_info.field7;
  *(&cg_caller_call_site_var) = ((unsigned int )12);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp74 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp73);
  llvm_cbe_tmp77 = &llvm_cbe_info.field8;
  *(&cg_caller_call_site_var) = ((unsigned int )13);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp78 = fscanf(llvm_cbe_tmp32, (&(_2E_str20[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp77);
  llvm_cbe_tmp81 = &llvm_cbe_info.field9;
  *(&cg_caller_call_site_var) = ((unsigned int )14);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp82 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp81);
  llvm_cbe_tmp85 = &llvm_cbe_info.field10;
  *(&cg_caller_call_site_var) = ((unsigned int )15);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp86 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp85);
  llvm_cbe_tmp89 = &llvm_cbe_info.field11;
  *(&cg_caller_call_site_var) = ((unsigned int )16);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp90 = fscanf(llvm_cbe_tmp32, (&(_2E_str19[((signed long long )((unsigned long long )0ll))])), llvm_cbe_tmp89);
  *(&cg_caller_call_site_var) = ((unsigned int )17);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp92 = fclose(llvm_cbe_tmp32);
  *(&cg_caller_call_site_var) = ((unsigned int )18);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp94 = puts((&(_2E_str21[((signed long long )((unsigned long long )0ll))])));
  *(&cg_caller_call_site_var) = ((unsigned int )19);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp97 = puts(llvm_cbe_tmp45);
  *(&cg_caller_call_site_var) = ((unsigned int )20);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN9regmngobj6createEv();
  *(&(regway.field5)) = (&regmng);
  llvm_cbe_tmp8_i = *(&(regmng.field18.field4));
  llvm_cbe_tmp9_i = llvm_cbe_tmp8_i + ((unsigned int )1);
  *(&(regway.field1.field2)) = llvm_cbe_tmp9_i;
  *(&(regway.field1.field1)) = ((unsigned int )0);
  ltmp_99_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp9_i)) * ((unsigned long long )8ll)));
  *(&(regway.field1.field0)) = (((struct l_struct_2E_regobj **)ltmp_99_2));
  *(&(regway.field2.field2)) = llvm_cbe_tmp9_i;
  *(&(regway.field2.field1)) = ((unsigned int )0);
  ltmp_100_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp9_i)) * ((unsigned long long )8ll)));
  *(&(regway.field2.field0)) = (((struct l_struct_2E_regobj **)ltmp_100_2));
  *(&cg_caller_call_site_var) = ((unsigned int )21);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp2_i = open(llvm_cbe_tmp45, ((unsigned int )0));
  if ((llvm_cbe_tmp2_i == ((unsigned int )-1))) {
    goto llvm_cbe__ZN6wayobj7loadmapEPKc_exit;
  } else {
    goto llvm_cbe_cond_next_i;
  }

llvm_cbe_cond_next_i:
  *(&cg_caller_call_site_var) = ((unsigned int )22);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp11_i = read(llvm_cbe_tmp2_i, (((unsigned char *)(&llvm_cbe_xRunion_i))), ((unsigned long long )1ll));
  llvm_cbe_tmp1314_i = ((struct l_struct_2E__2E_0_2E__27 *)(&llvm_cbe_xRunion_i));
  *(&cg_caller_call_site_var) = ((unsigned int )23);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp16_i = read(llvm_cbe_tmp2_i, (&llvm_cbe_tmp1314_i->field1), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )24);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp21_i6 = read(llvm_cbe_tmp2_i, (&llvm_cbe_tmp1314_i->field2), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )25);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp26_i7 = read(llvm_cbe_tmp2_i, (&llvm_cbe_tmp1314_i->field3), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )26);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp31_i8 = read(llvm_cbe_tmp2_i, (((unsigned char *)(&llvm_cbe_yRunion_i))), ((unsigned long long )1ll));
  llvm_cbe_tmp3334_i = ((struct l_struct_2E__2E_0_2E__27 *)(&llvm_cbe_yRunion_i));
  *(&cg_caller_call_site_var) = ((unsigned int )27);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp36_i9 = read(llvm_cbe_tmp2_i, (&llvm_cbe_tmp3334_i->field1), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )28);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp41_i = read(llvm_cbe_tmp2_i, (&llvm_cbe_tmp3334_i->field2), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )29);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp47_i11 = read(llvm_cbe_tmp2_i, (&llvm_cbe_tmp3334_i->field3), ((unsigned long long )1ll));
  llvm_cbe_tmp49_i = *(&llvm_cbe_xRunion_i.field0);
  llvm_cbe_tmp51_i = *(&llvm_cbe_yRunion_i.field0);
  *(&llvm_cbe_info_i.field0) = -0x1.f4p+9;
  *(&llvm_cbe_info_i.field2) = -0x1.f4p+9;
  *(&llvm_cbe_info_i.field1) = 0x1.f4p+9;
  *(&llvm_cbe_info_i.field3) = 0x1.f4p+9;
  *(&cg_caller_call_site_var) = ((unsigned int )30);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp58_i = log((((double )(signed int )llvm_cbe_tmp49_i)));
  *(&llvm_cbe_info_i.field4) = (((signed int )((llvm_cbe_tmp58_i / 0x1.62e42fefa39efp-1) + 0x1p-1)));
  *(&cg_caller_call_site_var) = ((unsigned int )31);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp66_i = log((((double )(signed int )llvm_cbe_tmp51_i)));
  *(&llvm_cbe_info_i.field5) = (((signed int )((llvm_cbe_tmp66_i / 0x1.62e42fefa39efp-1) + 0x1p-1)));
  *(&llvm_cbe_info_i.field6) = 0x0p+0;
  *(&llvm_cbe_info_i.field7) = 0x1.86ap+16;
  llvm_cbe_tmp75_i = ((struct l_unnamed1 *)(&llvm_cbe_info_i));
  llvm_cbe_tmp78_i = *(((unsigned int *)(&llvm_cbe_info_i)));
  llvm_cbe_tmp80_i = *(&llvm_cbe_tmp75_i->field0[((signed int )((unsigned int )1))]);
  llvm_cbe_tmp82_i = *(&llvm_cbe_tmp75_i->field0[((signed int )((unsigned int )2))]);
  llvm_cbe_tmp84_i = *(&llvm_cbe_tmp75_i->field0[((signed int )((unsigned int )3))]);
  llvm_cbe_tmp86_i = *(&llvm_cbe_tmp75_i->field0[((signed int )((unsigned int )4))]);
  llvm_cbe_tmp88_i = *(&llvm_cbe_tmp75_i->field0[((signed int )((unsigned int )5))]);
  llvm_cbe_tmp91_i = *(&llvm_cbe_tmp75_i->field0[((signed int )((unsigned int )6))]);
  llvm_cbe_tmp93_i = *(&llvm_cbe_tmp75_i->field0[((signed int )((unsigned int )7))]);
  *(&cg_caller_call_site_var) = ((unsigned int )32);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN6wayobj6createE17createwaymnginfot(llvm_cbe_tmp78_i, llvm_cbe_tmp80_i, llvm_cbe_tmp82_i, llvm_cbe_tmp84_i, llvm_cbe_tmp86_i, llvm_cbe_tmp88_i, llvm_cbe_tmp91_i, llvm_cbe_tmp93_i);
  llvm_cbe_tmp96_i = llvm_cbe_tmp51_i * llvm_cbe_tmp49_i;
  ltmp_101_2 =  /*tail*/ malloc(llvm_cbe_tmp96_i);
  ltmp_102_2 = ((unsigned char *)ltmp_101_2);
  *(&cg_caller_call_site_var) = ((unsigned int )33);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp105_i = read(llvm_cbe_tmp2_i, ltmp_102_2, (((signed long long )(signed int )llvm_cbe_tmp96_i)));
  llvm_cbe_tmp147163_i = *(&way_2E_4);
  if ((((signed int )llvm_cbe_tmp147163_i) > ((signed int )((unsigned int )1)))) {
    goto llvm_cbe_bb133_preheader_i;
  } else {
    goto llvm_cbe_bb152_i;
  }

llvm_cbe_bb133_preheader_i:
  llvm_cbe_tmp136168_i = *(&way_2E_3);
  llvm_cbe_tmp109_i = *(&way_2E_16);
  llvm_cbe_tmp112_i = *(&way_2E_2);
  llvm_cbe_indvar170_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb133_outer_i;

  do {     /* Syntactic loop 'bb133.outer.i' to make GCC happy */
llvm_cbe_bb133_outer_i:
  llvm_cbe_indvar170_i = llvm_cbe_indvar170_i__PHI_TEMPORARY;
  llvm_cbe_val329 = *(&cg_caller_id_var);
  llvm_cbe_val430 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )121);
  CallEdgeProfiler(llvm_cbe_val329, llvm_cbe_val430, ((unsigned int )121));
  llvm_cbe_y_0_reg2mem_0_ph_i = llvm_cbe_indvar170_i + ((unsigned int )1);
  if ((((signed int )llvm_cbe_tmp136168_i) > ((signed int )((unsigned int )1)))) {
    goto llvm_cbe_bb106_i_preheader;
  } else {
    goto llvm_cbe_bb144_i;
  }

llvm_cbe_bb144_i:
  *(&cg_caller_call_site_var) = llvm_cbe_val430;
  *(&cg_caller_id_var) = llvm_cbe_val329;
  if ((((signed int )llvm_cbe_tmp147163_i) > ((signed int )(llvm_cbe_indvar170_i + ((unsigned int )2))))) {
    llvm_cbe_indvar170_i__PHI_TEMPORARY = llvm_cbe_y_0_reg2mem_0_ph_i;   /* for PHI node */
    goto llvm_cbe_bb133_outer_i;
  } else {
    goto llvm_cbe_bb152_i;
  }

  do {     /* Syntactic loop 'bb106.i' to make GCC happy */
llvm_cbe_bb106_i:
  llvm_cbe_indvar_i = llvm_cbe_indvar_i__PHI_TEMPORARY;
  llvm_cbe_val331 = *(&cg_caller_id_var);
  llvm_cbe_val432 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )122);
  CallEdgeProfiler(llvm_cbe_val331, llvm_cbe_val432, ((unsigned int )122));
  llvm_cbe_x_0166_i = llvm_cbe_indvar_i + ((unsigned int )1);
  llvm_cbe_tmp123125_i = ((signed long long )(signed int )(llvm_cbe_tmp114_i | llvm_cbe_x_0166_i));
  llvm_cbe_tmp127_i = *(&ltmp_102_2[((signed long long )llvm_cbe_tmp123125_i)]);
  *(&llvm_cbe_tmp109_i[((signed long long )llvm_cbe_tmp123125_i)]) = (((unsigned short )(unsigned char )llvm_cbe_tmp127_i));
  *(&cg_caller_call_site_var) = llvm_cbe_val432;
  *(&cg_caller_id_var) = llvm_cbe_val331;
  if ((((signed int )llvm_cbe_tmp136168_i) > ((signed int )(llvm_cbe_indvar_i + ((unsigned int )2))))) {
    llvm_cbe_indvar_i__PHI_TEMPORARY = llvm_cbe_x_0166_i;   /* for PHI node */
    goto llvm_cbe_bb106_i;
  } else {
    goto llvm_cbe_bb144_i;
  }

  } while (1); /* end of syntactic loop 'bb106.i' */
llvm_cbe_bb106_i_preheader:
  llvm_cbe_tmp114_i = llvm_cbe_y_0_reg2mem_0_ph_i << llvm_cbe_tmp112_i;
  llvm_cbe_indvar_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb106_i;

  } while (1); /* end of syntactic loop 'bb133.outer.i' */
llvm_cbe_bb152_i:
   /*tail*/ free((((unsigned char *)ltmp_102_2)));
  *(&cg_caller_call_site_var) = ((unsigned int )34);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp155_i = close(llvm_cbe_tmp2_i);
  goto llvm_cbe__ZN6wayobj7loadmapEPKc_exit;

llvm_cbe__ZN6wayobj7loadmapEPKc_exit:
  *(&cg_caller_call_site_var) = ((unsigned int )35);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp2_i14 = open(llvm_cbe_tmp45, ((unsigned int )0));
  if ((llvm_cbe_tmp2_i14 == ((unsigned int )-1))) {
    goto llvm_cbe__ZN9regmngobj7loadmapEPKc_exit;
  } else {
    goto llvm_cbe_cond_next_i30;
  }

llvm_cbe_cond_next_i30:
  *(&cg_caller_call_site_var) = ((unsigned int )36);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp13_i16 = read(llvm_cbe_tmp2_i14, ((unsigned char *)(&(regmng.field14))), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )37);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp20_i17 = read(llvm_cbe_tmp2_i14, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(regmng.field14)))->field1)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )38);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp27_i = read(llvm_cbe_tmp2_i14, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(regmng.field14)))->field2)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )39);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp34_i = read(llvm_cbe_tmp2_i14, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(regmng.field14)))->field3)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )40);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp41_i18 = read(llvm_cbe_tmp2_i14, ((unsigned char *)(&(regmng.field15))), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )41);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp48_i19 = read(llvm_cbe_tmp2_i14, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(regmng.field15)))->field1)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )42);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp55_i20 = read(llvm_cbe_tmp2_i14, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(regmng.field15)))->field2)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )43);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp62_i21 = read(llvm_cbe_tmp2_i14, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(regmng.field15)))->field3)), ((unsigned long long )1ll));
  llvm_cbe_tmp66_i22 = *(&(regmng.field14.field0));
  *(&(regmng.field16)) = llvm_cbe_tmp66_i22;
  llvm_cbe_tmp72_i23 = *(&(regmng.field15.field0));
  *(&(regmng.field17)) = llvm_cbe_tmp72_i23;
  *(&(regmng.field12)) = (llvm_cbe_tmp66_i22 + ((unsigned int )-1));
  *(&(regmng.field13)) = (llvm_cbe_tmp72_i23 + ((unsigned int )-1));
  llvm_cbe_tmp93_i26 = llvm_cbe_tmp72_i23 * llvm_cbe_tmp66_i22;
  ltmp_103_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp93_i26)) * ((unsigned long long )8ll)));
  *(&(regmng.field6)) = (((struct l_struct_2E_regobj **)ltmp_103_2));
  ltmp_104_2 =  /*tail*/ malloc(llvm_cbe_tmp93_i26);
  *(&(regmng.field7)) = (((unsigned char *)ltmp_104_2));
  ltmp_105_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp93_i26)) * ((unsigned long long )2ll)));
  ltmp_106_10 = ((unsigned short *)ltmp_105_2);
  *(&(regmng.field0)) = ltmp_106_10;
  *(&cg_caller_call_site_var) = ((unsigned int )44);
  *(&cg_caller_id_var) = ((unsigned int )22);
  ltmp_107_2 = memset((((unsigned char *)ltmp_106_10)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )llvm_cbe_tmp93_i26)) << ((unsigned long long )1ll)));
  *(&(regmng.field1)) = ((unsigned short )0);
  llvm_cbe_tmp141_i = *(&(regmng.field16));
  llvm_cbe_tmp144_i = *(&(regmng.field17));
  llvm_cbe_tmp149_i29 = *(&(regmng.field7));
  *(&cg_caller_call_site_var) = ((unsigned int )45);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp151_i = read(llvm_cbe_tmp2_i14, llvm_cbe_tmp149_i29, (((signed long long )(signed int )(llvm_cbe_tmp144_i * llvm_cbe_tmp141_i))));
  llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb_i;

  do {     /* Syntactic loop 'bb.i' to make GCC happy */
llvm_cbe_bb_i:
  llvm_cbe_i_0_reg2mem_0_i = llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_val327 = *(&cg_caller_id_var);
  llvm_cbe_val428 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )120);
  CallEdgeProfiler(llvm_cbe_val327, llvm_cbe_val428, ((unsigned int )120));
  *(&regmng.field8[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i)))]) = ((unsigned char )0);
  llvm_cbe_indvar_next_i = llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val428;
  *(&cg_caller_id_var) = llvm_cbe_val327;
  if ((llvm_cbe_indvar_next_i == ((unsigned int )256))) {
    goto llvm_cbe_bb164_i;
  } else {
    llvm_cbe_i_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_indvar_next_i;   /* for PHI node */
    goto llvm_cbe_bb_i;
  }

  } while (1); /* end of syntactic loop 'bb.i' */
llvm_cbe_bb164_i:
  *(&(regmng.field8[((signed long long )((unsigned long long )0ll))])) = ((unsigned char )1);
  *(&cg_caller_call_site_var) = ((unsigned int )46);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp169_i = close(llvm_cbe_tmp2_i14);
  goto llvm_cbe__ZN9regmngobj7loadmapEPKc_exit;

llvm_cbe__ZN9regmngobj7loadmapEPKc_exit:
  llvm_cbe_tmp118 = *llvm_cbe_tmp49;
  *(&cg_caller_call_site_var) = ((unsigned int )47);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN9regmngobj13createregionsEi(llvm_cbe_tmp118);
  *(&cg_caller_call_site_var) = ((unsigned int )48);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp120 = time(((unsigned long long *)/*NULL*/0));
  llvm_cbe_tmp178921 = *llvm_cbe_tmp53;
  if ((((signed int )llvm_cbe_tmp178921) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_stat_8_4__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_5_4__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_stat_8_5__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_5_5__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb183;
  }

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_stat_8_4 = llvm_cbe_stat_8_4__PHI_TEMPORARY;
  llvm_cbe_stat_5_4 = llvm_cbe_stat_5_4__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )106);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )106));
  *(&llvm_cbe_waylength) = ((unsigned int )0);
  *(&llvm_cbe_wayar) = ((struct l_struct_2E_point16t *)/*NULL*/0);
  llvm_cbe_tmp122 = *(&(regmng.field12));
  llvm_cbe_tmp8_i66 = *(&y1rnd);
  llvm_cbe_tmp10_i68 = ((signed int )(((signed int )(llvm_cbe_tmp8_i66 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp11_i69 = *(&y2rnd);
  llvm_cbe_tmp13_i70 = ((signed int )(((signed int )(llvm_cbe_tmp11_i69 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp14_i = *(&y3rnd);
  llvm_cbe_tmp16_i72 = ((signed int )(((signed int )(llvm_cbe_tmp14_i * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp36_i79 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i68)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i70)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i72)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i83 = (((signed int )(((float )((((float )(signed int )llvm_cbe_tmp122)) * (((float )(llvm_cbe_tmp36_i79 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i79)))))))))))) + ((unsigned int )1);
  *(&llvm_cbe_startx) = llvm_cbe_tmp50_i83;
  llvm_cbe_tmp125 = *(&(regmng.field13));
  llvm_cbe_tmp10_i87 = ((signed int )(((signed int )(llvm_cbe_tmp10_i68 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp10_i87;
  llvm_cbe_tmp13_i90 = ((signed int )(((signed int )(llvm_cbe_tmp13_i70 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp13_i90;
  llvm_cbe_tmp16_i93 = ((signed int )(((signed int )(llvm_cbe_tmp16_i72 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp16_i93;
  llvm_cbe_tmp36_i101 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i87)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i90)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i93)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i107 = (((signed int )(((float )((((float )(signed int )llvm_cbe_tmp125)) * (((float )(llvm_cbe_tmp36_i101 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i101)))))))))))) + ((unsigned int )1);
  *(&llvm_cbe_starty) = llvm_cbe_tmp50_i107;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )106);
  llvm_cbe_tmp129 = _ZN6wayobj13findfreepointEiiRiS0_(llvm_cbe_tmp50_i83, llvm_cbe_tmp50_i107, (&llvm_cbe_startx), (&llvm_cbe_starty));
  if ((llvm_cbe_tmp129 == ((unsigned char )0))) {
    llvm_cbe_flcreate_1__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_cond_next159;
  } else {
    goto llvm_cbe_cond_true132;
  }

llvm_cbe_bb176:
  llvm_cbe_stat_8_3 = llvm_cbe_stat_8_3__PHI_TEMPORARY;
  llvm_cbe_stat_5_3 = llvm_cbe_stat_5_3__PHI_TEMPORARY;
  llvm_cbe_tmp175 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp178 = *llvm_cbe_tmp53;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp178) > ((signed int )llvm_cbe_tmp175))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp175;   /* for PHI node */
    llvm_cbe_stat_8_4__PHI_TEMPORARY = llvm_cbe_stat_8_3;   /* for PHI node */
    llvm_cbe_stat_5_4__PHI_TEMPORARY = llvm_cbe_stat_5_3;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_stat_8_5__PHI_TEMPORARY = llvm_cbe_stat_8_3;   /* for PHI node */
    llvm_cbe_stat_5_5__PHI_TEMPORARY = llvm_cbe_stat_5_3;   /* for PHI node */
    goto llvm_cbe_bb183;
  }

llvm_cbe_cond_next159:
  llvm_cbe_flcreate_1 = llvm_cbe_flcreate_1__PHI_TEMPORARY;
  if ((llvm_cbe_flcreate_1 == ((unsigned char )0))) {
    llvm_cbe_stat_8_3__PHI_TEMPORARY = llvm_cbe_stat_8_4;   /* for PHI node */
    llvm_cbe_stat_5_3__PHI_TEMPORARY = llvm_cbe_stat_5_4;   /* for PHI node */
    goto llvm_cbe_bb176;
  } else {
    goto llvm_cbe_cond_true162;
  }

llvm_cbe_cond_next150:
  llvm_cbe_flcreate_0 = llvm_cbe_flcreate_0__PHI_TEMPORARY;
  llvm_cbe_tmp151 = *(&llvm_cbe_wayar);
  if ((llvm_cbe_tmp151 == ((struct l_struct_2E_point16t *)/*NULL*/0))) {
    llvm_cbe_flcreate_1__PHI_TEMPORARY = llvm_cbe_flcreate_0;   /* for PHI node */
    goto llvm_cbe_cond_next159;
  } else {
    goto llvm_cbe_cond_true155;
  }

llvm_cbe_cond_true132:
  llvm_cbe_tmp134 = *(&(regmng.field12));
  llvm_cbe_tmp8_i157 = *(&y1rnd);
  llvm_cbe_tmp10_i159 = ((signed int )(((signed int )(llvm_cbe_tmp8_i157 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp11_i160 = *(&y2rnd);
  llvm_cbe_tmp13_i162 = ((signed int )(((signed int )(llvm_cbe_tmp11_i160 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp14_i163 = *(&y3rnd);
  llvm_cbe_tmp16_i165 = ((signed int )(((signed int )(llvm_cbe_tmp14_i163 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp36_i173 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i159)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i162)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i165)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i179 = (((signed int )(((float )((((float )(signed int )llvm_cbe_tmp134)) * (((float )(llvm_cbe_tmp36_i173 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i173)))))))))))) + ((unsigned int )1);
  *(&llvm_cbe_endx) = llvm_cbe_tmp50_i179;
  llvm_cbe_tmp137 = *(&(regmng.field13));
  llvm_cbe_tmp10_i231 = ((signed int )(((signed int )(llvm_cbe_tmp10_i159 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp10_i231;
  llvm_cbe_tmp13_i234 = ((signed int )(((signed int )(llvm_cbe_tmp13_i162 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp13_i234;
  llvm_cbe_tmp16_i237 = ((signed int )(((signed int )(llvm_cbe_tmp16_i165 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp16_i237;
  llvm_cbe_tmp36_i245 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i231)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i234)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i237)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i251 = (((signed int )(((float )((((float )(signed int )llvm_cbe_tmp137)) * (((float )(llvm_cbe_tmp36_i245 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i245)))))))))))) + ((unsigned int )1);
  *(&llvm_cbe_endy) = llvm_cbe_tmp50_i251;
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )106);
  llvm_cbe_tmp141 = _ZN6wayobj13findfreepointEiiRiS0_(llvm_cbe_tmp50_i179, llvm_cbe_tmp50_i251, (&llvm_cbe_endx), (&llvm_cbe_endy));
  if ((llvm_cbe_tmp141 == ((unsigned char )0))) {
    llvm_cbe_flcreate_0__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_cond_next150;
  } else {
    goto llvm_cbe_cond_true144;
  }

llvm_cbe_cond_true144:
  llvm_cbe_tmp145 = *(&llvm_cbe_endy);
  llvm_cbe_tmp146 = *(&llvm_cbe_endx);
  llvm_cbe_tmp147 = *(&llvm_cbe_starty);
  llvm_cbe_tmp148 = *(&llvm_cbe_startx);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )106);
  llvm_cbe_tmp149 = _ZN6wayobj9createwayEiiiiRP8point16tRi(llvm_cbe_tmp148, llvm_cbe_tmp147, llvm_cbe_tmp146, llvm_cbe_tmp145, (&llvm_cbe_wayar), (&llvm_cbe_waylength));
  llvm_cbe_flcreate_0__PHI_TEMPORARY = llvm_cbe_tmp149;   /* for PHI node */
  goto llvm_cbe_cond_next150;

llvm_cbe_cond_true155:
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp151)));
  llvm_cbe_flcreate_1__PHI_TEMPORARY = llvm_cbe_flcreate_0;   /* for PHI node */
  goto llvm_cbe_cond_next159;

llvm_cbe_cond_true162:
  llvm_cbe_tmp165 = *(&llvm_cbe_waylength);
  llvm_cbe_tmp167 = (((signed long long )(signed int )llvm_cbe_tmp165)) + llvm_cbe_stat_5_4;
  llvm_cbe_tmp171 = llvm_cbe_stat_8_4 + ((unsigned long long )1ll);
  llvm_cbe_stat_8_3__PHI_TEMPORARY = llvm_cbe_tmp171;   /* for PHI node */
  llvm_cbe_stat_5_3__PHI_TEMPORARY = llvm_cbe_tmp167;   /* for PHI node */
  goto llvm_cbe_bb176;

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_bb183:
  llvm_cbe_stat_8_5 = llvm_cbe_stat_8_5__PHI_TEMPORARY;
  llvm_cbe_stat_5_5 = llvm_cbe_stat_5_5__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = ((unsigned int )52);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp185 = time(((unsigned long long *)/*NULL*/0));
  llvm_cbe_tmp273926 = *llvm_cbe_tmp65;
  if ((((signed int )llvm_cbe_tmp273926) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_stat_12_4__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_11_4__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb186;
  } else {
    llvm_cbe_stat_12_5__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_11_5__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb278;
  }

  do {     /* Syntactic loop 'bb186' to make GCC happy */
llvm_cbe_bb186:
  llvm_cbe_i_1_reg2mem_0 = llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_stat_12_4 = llvm_cbe_stat_12_4__PHI_TEMPORARY;
  llvm_cbe_stat_11_4 = llvm_cbe_stat_11_4__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )107);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )107));
  llvm_cbe_tmp192 = *(&(regmng.field18.field4));
  llvm_cbe_tmp3_i320 = *(&y1rnd);
  llvm_cbe_tmp5_i322 = ((signed int )(((signed int )(llvm_cbe_tmp3_i320 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp6_i323 = *(&y2rnd);
  llvm_cbe_tmp8_i325 = ((signed int )(((signed int )(llvm_cbe_tmp6_i323 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp9_i326 = *(&y3rnd);
  llvm_cbe_tmp11_i328 = ((signed int )(((signed int )(llvm_cbe_tmp9_i326 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp31_i336 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp5_i322)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp8_i325)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp11_i328)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp4142_i340 = ((float )(signed int )(llvm_cbe_tmp192 + ((unsigned int )-1)));
  llvm_cbe_tmp5_i353 = ((signed int )(((signed int )(llvm_cbe_tmp5_i322 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp5_i353;
  llvm_cbe_tmp8_i356 = ((signed int )(((signed int )(llvm_cbe_tmp8_i325 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp8_i356;
  llvm_cbe_tmp11_i359 = ((signed int )(((signed int )(llvm_cbe_tmp11_i328 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp11_i359;
  llvm_cbe_tmp31_i367 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp5_i353)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp8_i356)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp11_i359)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp204 = *(&(regmng.field18.field0));
  llvm_cbe_tmp211 = *(&llvm_cbe_tmp204[((signed long long )(((signed long long )(signed int )(((signed int )(((float )((((float )(llvm_cbe_tmp31_i336 - (((float )(signed int )(((signed int )llvm_cbe_tmp31_i336))))))) * llvm_cbe_tmp4142_i340))))))))]);
  llvm_cbe_tmp215 = *(&llvm_cbe_tmp211->field9.field1);
  if ((llvm_cbe_tmp215 == ((unsigned int )0))) {
    llvm_cbe_stat_12_3__PHI_TEMPORARY = llvm_cbe_stat_12_4;   /* for PHI node */
    llvm_cbe_stat_11_3__PHI_TEMPORARY = llvm_cbe_stat_11_4;   /* for PHI node */
    goto llvm_cbe_bb271;
  } else {
    goto llvm_cbe_cond_next220;
  }

llvm_cbe_bb271:
  llvm_cbe_stat_12_3 = llvm_cbe_stat_12_3__PHI_TEMPORARY;
  llvm_cbe_stat_11_3 = llvm_cbe_stat_11_3__PHI_TEMPORARY;
  llvm_cbe_tmp270 = llvm_cbe_i_1_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp273 = *llvm_cbe_tmp65;
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_tmp273) > ((signed int )llvm_cbe_tmp270))) {
    llvm_cbe_i_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp270;   /* for PHI node */
    llvm_cbe_stat_12_4__PHI_TEMPORARY = llvm_cbe_stat_12_3;   /* for PHI node */
    llvm_cbe_stat_11_4__PHI_TEMPORARY = llvm_cbe_stat_11_3;   /* for PHI node */
    goto llvm_cbe_bb186;
  } else {
    llvm_cbe_stat_12_5__PHI_TEMPORARY = llvm_cbe_stat_12_3;   /* for PHI node */
    llvm_cbe_stat_11_5__PHI_TEMPORARY = llvm_cbe_stat_11_3;   /* for PHI node */
    goto llvm_cbe_bb278;
  }

llvm_cbe_cond_next220:
  llvm_cbe_tmp233 = *(&llvm_cbe_tmp204[((signed long long )(((signed long long )(signed int )(((signed int )(((float )((((float )(llvm_cbe_tmp31_i367 - (((float )(signed int )(((signed int )llvm_cbe_tmp31_i367))))))) * llvm_cbe_tmp4142_i340))))))))]);
  llvm_cbe_tmp237 = *(&llvm_cbe_tmp233->field9.field1);
  if ((llvm_cbe_tmp237 == ((unsigned int )0))) {
    llvm_cbe_stat_12_3__PHI_TEMPORARY = llvm_cbe_stat_12_4;   /* for PHI node */
    llvm_cbe_stat_11_3__PHI_TEMPORARY = llvm_cbe_stat_11_4;   /* for PHI node */
    goto llvm_cbe_bb271;
  } else {
    goto llvm_cbe_cond_next242;
  }

llvm_cbe_cond_next253:
  if ((llvm_cbe_tmp245 == ((unsigned char )0))) {
    llvm_cbe_stat_12_3__PHI_TEMPORARY = llvm_cbe_stat_12_4;   /* for PHI node */
    llvm_cbe_stat_11_3__PHI_TEMPORARY = llvm_cbe_stat_11_4;   /* for PHI node */
    goto llvm_cbe_bb271;
  } else {
    goto llvm_cbe_cond_true256;
  }

llvm_cbe_cond_next242:
  *(&llvm_cbe_wayar187) = ((struct l_struct_2E_regobj **)/*NULL*/0);
  *(&llvm_cbe_waylength188) = ((unsigned int )0);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )107);
  llvm_cbe_tmp245 = _ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri(llvm_cbe_tmp211, llvm_cbe_tmp233, (&llvm_cbe_wayar187), (&llvm_cbe_waylength188));
  llvm_cbe_tmp246 = *(&llvm_cbe_wayar187);
  if ((llvm_cbe_tmp246 == ((struct l_struct_2E_regobj **)/*NULL*/0))) {
    goto llvm_cbe_cond_next253;
  } else {
    goto llvm_cbe_cond_true250;
  }

llvm_cbe_cond_true250:
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp246)));
  goto llvm_cbe_cond_next253;

llvm_cbe_cond_true256:
  llvm_cbe_tmp259 = *(&llvm_cbe_waylength188);
  llvm_cbe_tmp261 = (((signed long long )(signed int )llvm_cbe_tmp259)) + llvm_cbe_stat_11_4;
  llvm_cbe_tmp265 = llvm_cbe_stat_12_4 + ((unsigned long long )1ll);
  llvm_cbe_stat_12_3__PHI_TEMPORARY = llvm_cbe_tmp265;   /* for PHI node */
  llvm_cbe_stat_11_3__PHI_TEMPORARY = llvm_cbe_tmp261;   /* for PHI node */
  goto llvm_cbe_bb271;

  } while (1); /* end of syntactic loop 'bb186' */
llvm_cbe_bb278:
  llvm_cbe_stat_12_5 = llvm_cbe_stat_12_5__PHI_TEMPORARY;
  llvm_cbe_stat_11_5 = llvm_cbe_stat_11_5__PHI_TEMPORARY;
  llvm_cbe_tmp5_i470 = *(&(regway.field1.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp5_i470)));
  llvm_cbe_tmp13_i471 = *(&(regway.field2.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp13_i471)));
  *(&cg_caller_call_site_var) = ((unsigned int )54);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN9regmngobj7destroyEv();
  *(&cg_caller_call_site_var) = ((unsigned int )55);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN6wayobj7destroyEv();
  *(&(way2.field1)) = ((struct l_struct_2E_point16t *)/*NULL*/0);
  *(&(way2.field0)) = ((unsigned char *)/*NULL*/0);
  *(&cg_caller_call_site_var) = ((unsigned int )56);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp2_i568 = open(llvm_cbe_tmp45, ((unsigned int )0));
  if ((llvm_cbe_tmp2_i568 == ((unsigned int )-1))) {
    goto llvm_cbe__ZN7way2obj7loadmapEPKc_exit;
  } else {
    goto llvm_cbe_cond_next_i580;
  }

llvm_cbe_cond_next_i580:
  *(&cg_caller_call_site_var) = ((unsigned int )57);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp13_i570 = read(llvm_cbe_tmp2_i568, ((unsigned char *)(&(way2.field15))), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )58);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp20_i571 = read(llvm_cbe_tmp2_i568, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(way2.field15)))->field1)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )59);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp27_i572 = read(llvm_cbe_tmp2_i568, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(way2.field15)))->field2)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )60);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp34_i573 = read(llvm_cbe_tmp2_i568, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(way2.field15)))->field3)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )61);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp41_i574 = read(llvm_cbe_tmp2_i568, ((unsigned char *)(&(way2.field16))), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )62);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp48_i575 = read(llvm_cbe_tmp2_i568, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(way2.field16)))->field1)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )63);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp55_i576 = read(llvm_cbe_tmp2_i568, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(way2.field16)))->field2)), ((unsigned long long )1ll));
  *(&cg_caller_call_site_var) = ((unsigned int )64);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp62_i577 = read(llvm_cbe_tmp2_i568, (&(((struct l_struct_2E__2E_0_2E__27 *)(&(way2.field16)))->field3)), ((unsigned long long )1ll));
  llvm_cbe_tmp66_i578 = *(&(way2.field15.field0));
  *(&(way2.field17)) = llvm_cbe_tmp66_i578;
  llvm_cbe_tmp72_i579 = *(&(way2.field16.field0));
  *(&(way2.field18)) = llvm_cbe_tmp72_i579;
  llvm_cbe_i_0_reg2mem_0_i581__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb_i586;

  do {     /* Syntactic loop 'bb.i586' to make GCC happy */
llvm_cbe_bb_i586:
  llvm_cbe_i_0_reg2mem_0_i581 = llvm_cbe_i_0_reg2mem_0_i581__PHI_TEMPORARY;
  llvm_cbe_val325 = *(&cg_caller_id_var);
  llvm_cbe_val426 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )119);
  CallEdgeProfiler(llvm_cbe_val325, llvm_cbe_val426, ((unsigned int )119));
  llvm_cbe_tmp7578_i = ((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i581);
  *(&way2.field4[((signed long long )llvm_cbe_tmp7578_i)].field2) = ((unsigned int )128);
  *(&way2.field4[((signed long long )llvm_cbe_tmp7578_i)].field1) = ((unsigned int )0);
  ltmp_108_2 =  /*tail*/ malloc(((unsigned long long )1024ll));
  *(&way2.field4[((signed long long )llvm_cbe_tmp7578_i)].field0) = (&(((struct l_struct_2E_pointt (*)[128])ltmp_108_2))[((signed int )((unsigned int )0))][((signed int )((unsigned int )0))]);
  llvm_cbe_indvar_next_i584 = llvm_cbe_i_0_reg2mem_0_i581 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val426;
  *(&cg_caller_id_var) = llvm_cbe_val325;
  if ((llvm_cbe_indvar_next_i584 == ((unsigned int )256))) {
    goto llvm_cbe_bb110_i;
  } else {
    llvm_cbe_i_0_reg2mem_0_i581__PHI_TEMPORARY = llvm_cbe_indvar_next_i584;   /* for PHI node */
    goto llvm_cbe_bb_i586;
  }

  } while (1); /* end of syntactic loop 'bb.i586' */
llvm_cbe_bb110_i:
  *(&(way2.field13)) = (llvm_cbe_tmp66_i578 + ((unsigned int )-1));
  *(&(way2.field14)) = (llvm_cbe_tmp72_i579 + ((unsigned int )-1));
  llvm_cbe_tmp129_i = llvm_cbe_tmp72_i579 * llvm_cbe_tmp66_i578;
  ltmp_109_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp129_i)) * ((unsigned long long )4ll)));
  ltmp_110_11 = ((struct l_struct_2E_point16t *)ltmp_109_2);
  *(&(way2.field1)) = ltmp_110_11;
  *(&cg_caller_call_site_var) = ((unsigned int )65);
  *(&cg_caller_id_var) = ((unsigned int )22);
  ltmp_111_2 = memset((((unsigned char *)ltmp_110_11)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )llvm_cbe_tmp129_i)) << ((unsigned long long )2ll)));
  *(&(way2.field2)) = ((unsigned short )0);
  llvm_cbe_tmp153_i = *(&(way2.field17));
  llvm_cbe_tmp156_i591 = *(&(way2.field18));
  llvm_cbe_tmp157_i = llvm_cbe_tmp156_i591 * llvm_cbe_tmp153_i;
  ltmp_112_2 =  /*tail*/ malloc(llvm_cbe_tmp157_i);
  ltmp_113_2 = ((unsigned char *)ltmp_112_2);
  *(&(way2.field0)) = ltmp_113_2;
  *(&cg_caller_call_site_var) = ((unsigned int )66);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp174_i = read(llvm_cbe_tmp2_i568, ltmp_113_2, (((signed long long )(signed int )llvm_cbe_tmp157_i)));
  *(&cg_caller_call_site_var) = ((unsigned int )67);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp176_i = close(llvm_cbe_tmp2_i568);
  goto llvm_cbe__ZN7way2obj7loadmapEPKc_exit;

llvm_cbe__ZN7way2obj7loadmapEPKc_exit:
  llvm_cbe_tmp440931 = *llvm_cbe_tmp57;
  if ((((signed int )llvm_cbe_tmp440931) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb299_preheader;
  } else {
    llvm_cbe_stat_9_2__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_6_2__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb445;
  }

llvm_cbe_bb299_preheader:
  llvm_cbe_tmp305 = &llvm_cbe_movetimear[((signed long long )((unsigned long long )0ll))];
  llvm_cbe_tmp306 = &llvm_cbe_movetimear[((signed long long )((unsigned long long )1ll))];
  llvm_cbe_tmp307 = &llvm_cbe_movetimear[((signed long long )((unsigned long long )2ll))];
  llvm_cbe_i_2_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_stat_9_1_ph__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
  llvm_cbe_stat_6_1_ph__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
  goto llvm_cbe_bb299_outer;

  do {     /* Syntactic loop 'bb299.outer' to make GCC happy */
llvm_cbe_bb299_outer:
  llvm_cbe_i_2_reg2mem_0_ph = llvm_cbe_i_2_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_stat_9_1_ph = llvm_cbe_stat_9_1_ph__PHI_TEMPORARY;
  llvm_cbe_stat_6_1_ph = llvm_cbe_stat_6_1_ph__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )108);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )108));
  llvm_cbe_j_0965__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb291;

llvm_cbe_bb438:
  llvm_cbe_stat_9_0 = llvm_cbe_stat_9_0__PHI_TEMPORARY;
  llvm_cbe_stat_6_0 = llvm_cbe_stat_6_0__PHI_TEMPORARY;
  llvm_cbe_tmp437 = llvm_cbe_i_2_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_tmp440 = *llvm_cbe_tmp57;
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )llvm_cbe_tmp440) > ((signed int )llvm_cbe_tmp437))) {
    llvm_cbe_i_2_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp437;   /* for PHI node */
    llvm_cbe_stat_9_1_ph__PHI_TEMPORARY = llvm_cbe_stat_9_0;   /* for PHI node */
    llvm_cbe_stat_6_1_ph__PHI_TEMPORARY = llvm_cbe_stat_6_0;   /* for PHI node */
    goto llvm_cbe_bb299_outer;
  } else {
    llvm_cbe_stat_9_2__PHI_TEMPORARY = llvm_cbe_stat_9_0;   /* for PHI node */
    llvm_cbe_stat_6_2__PHI_TEMPORARY = llvm_cbe_stat_6_0;   /* for PHI node */
    goto llvm_cbe_bb445;
  }

llvm_cbe_bb304:
  *llvm_cbe_tmp305 = ((unsigned char )-1);
  *llvm_cbe_tmp306 = ((unsigned char )1);
  *llvm_cbe_tmp307 = ((unsigned char )-1);
  *(&llvm_cbe_waylength289) = ((unsigned int )0);
  *(&llvm_cbe_wayar288) = ((struct l_struct_2E_pointt *)/*NULL*/0);
  llvm_cbe_tmp309 = *(&(way2.field17));
  llvm_cbe_tmp56_i544 = ((float )(signed int )(llvm_cbe_tmp309 + ((unsigned int )-1)));
  llvm_cbe_tmp8_i545 = *(&y1rnd);
  llvm_cbe_tmp10_i547 = ((signed int )(((signed int )(llvm_cbe_tmp8_i545 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp11_i548 = *(&y2rnd);
  llvm_cbe_tmp13_i550 = ((signed int )(((signed int )(llvm_cbe_tmp11_i548 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp14_i551 = *(&y3rnd);
  llvm_cbe_tmp16_i553 = ((signed int )(((signed int )(llvm_cbe_tmp14_i551 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp36_i561 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i547)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i550)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i553)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i567 = (((signed int )(((float )(llvm_cbe_tmp56_i544 * (((float )(llvm_cbe_tmp36_i561 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i561)))))))))))) + ((unsigned int )1);
  llvm_cbe_tmp319 = *(&(way2.field18));
  llvm_cbe_tmp56_i520 = ((float )(signed int )(llvm_cbe_tmp319 + ((unsigned int )-1)));
  llvm_cbe_tmp10_i523 = ((signed int )(((signed int )(llvm_cbe_tmp10_i547 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp10_i523;
  llvm_cbe_tmp13_i526 = ((signed int )(((signed int )(llvm_cbe_tmp13_i550 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp13_i526;
  llvm_cbe_tmp16_i529 = ((signed int )(((signed int )(llvm_cbe_tmp16_i553 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp16_i529;
  llvm_cbe_tmp36_i537 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i523)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i526)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i529)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i543 = (((signed int )(((float )(llvm_cbe_tmp56_i520 * (((float )(llvm_cbe_tmp36_i537 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i537)))))))))))) + ((unsigned int )1);
  llvm_cbe_tmp334 = *(&(way2.field0));
  llvm_cbe_tmp343 = *(&llvm_cbe_tmp334[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp309 * llvm_cbe_tmp50_i543) + llvm_cbe_tmp50_i567))))]);
  llvm_cbe_tmp352 = *(&llvm_cbe_movetimear[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp343)))]);
  if ((llvm_cbe_tmp352 == ((unsigned char )0))) {
    llvm_cbe_stat_9_0__PHI_TEMPORARY = llvm_cbe_stat_9_1_ph;   /* for PHI node */
    llvm_cbe_stat_6_0__PHI_TEMPORARY = llvm_cbe_stat_6_1_ph;   /* for PHI node */
    goto llvm_cbe_bb438;
  } else {
    goto llvm_cbe_cond_true357;
  }

  do {     /* Syntactic loop 'bb291' to make GCC happy */
llvm_cbe_bb291:
  llvm_cbe_j_0965 = llvm_cbe_j_0965__PHI_TEMPORARY;
  llvm_cbe_val35 = *(&cg_caller_id_var);
  llvm_cbe_val46 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )109);
  CallEdgeProfiler(llvm_cbe_val35, llvm_cbe_val46, ((unsigned int )109));
  *(&llvm_cbe_movetimear[((signed long long )(((signed long long )(signed int )llvm_cbe_j_0965)))]) = (((unsigned char )llvm_cbe_j_0965));
  llvm_cbe_indvar_next984 = llvm_cbe_j_0965 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val46;
  *(&cg_caller_id_var) = llvm_cbe_val35;
  if ((llvm_cbe_indvar_next984 == ((unsigned int )256))) {
    goto llvm_cbe_bb304;
  } else {
    llvm_cbe_j_0965__PHI_TEMPORARY = llvm_cbe_indvar_next984;   /* for PHI node */
    goto llvm_cbe_bb291;
  }

  } while (1); /* end of syntactic loop 'bb291' */
llvm_cbe_cond_true357:
  llvm_cbe_tmp10_i499 = ((signed int )(((signed int )(llvm_cbe_tmp10_i523 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp13_i502 = ((signed int )(((signed int )(llvm_cbe_tmp13_i526 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp16_i505 = ((signed int )(((signed int )(llvm_cbe_tmp16_i529 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp36_i513 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i499)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i502)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i505)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp10_i475 = ((signed int )(((signed int )(llvm_cbe_tmp10_i499 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp10_i475;
  llvm_cbe_tmp13_i478 = ((signed int )(((signed int )(llvm_cbe_tmp13_i502 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp13_i478;
  llvm_cbe_tmp16_i481 = ((signed int )(((signed int )(llvm_cbe_tmp16_i505 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp16_i481;
  llvm_cbe_tmp36_i489 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i475)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i478)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i481)) * 0x1.14a44ap-15)))));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )108);
  llvm_cbe_tmp417 = _ZN7way2obj9createwayEiiiiPhRP6pointtRi(llvm_cbe_tmp50_i567, llvm_cbe_tmp50_i543, ((((signed int )(((float )(llvm_cbe_tmp56_i544 * (((float )(llvm_cbe_tmp36_i513 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i513)))))))))))) + ((unsigned int )1)), ((((signed int )(((float )(llvm_cbe_tmp56_i520 * (((float )(llvm_cbe_tmp36_i489 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i489)))))))))))) + ((unsigned int )1)), llvm_cbe_tmp305, (&llvm_cbe_wayar288), (&llvm_cbe_waylength289));
  llvm_cbe_tmp419 = *(&llvm_cbe_wayar288);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp419)));
  if ((llvm_cbe_tmp417 == ((unsigned char )0))) {
    llvm_cbe_stat_9_0__PHI_TEMPORARY = llvm_cbe_stat_9_1_ph;   /* for PHI node */
    llvm_cbe_stat_6_0__PHI_TEMPORARY = llvm_cbe_stat_6_1_ph;   /* for PHI node */
    goto llvm_cbe_bb438;
  } else {
    goto llvm_cbe_cond_true424;
  }

llvm_cbe_cond_true424:
  llvm_cbe_tmp427 = *(&llvm_cbe_waylength289);
  llvm_cbe_tmp429 = (((signed long long )(signed int )llvm_cbe_tmp427)) + llvm_cbe_stat_6_1_ph;
  llvm_cbe_tmp433 = llvm_cbe_stat_9_1_ph + ((unsigned long long )1ll);
  llvm_cbe_stat_9_0__PHI_TEMPORARY = llvm_cbe_tmp433;   /* for PHI node */
  llvm_cbe_stat_6_0__PHI_TEMPORARY = llvm_cbe_tmp429;   /* for PHI node */
  goto llvm_cbe_bb438;

  } while (1); /* end of syntactic loop 'bb299.outer' */
llvm_cbe_bb445:
  llvm_cbe_stat_9_2 = llvm_cbe_stat_9_2__PHI_TEMPORARY;
  llvm_cbe_stat_6_2 = llvm_cbe_stat_6_2__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = ((unsigned int )69);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp447 = time(((unsigned long long *)/*NULL*/0));
  llvm_cbe_tmp611936 = *llvm_cbe_tmp61;
  if ((((signed int )llvm_cbe_tmp611936) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb466_preheader;
  } else {
    llvm_cbe_stat_10_2__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_7_2__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb616;
  }

llvm_cbe_bb466_preheader:
  llvm_cbe_tmp472 = &llvm_cbe_movetimear456[((signed long long )((unsigned long long )0ll))];
  llvm_cbe_tmp473 = &llvm_cbe_movetimear456[((signed long long )((unsigned long long )1ll))];
  llvm_cbe_tmp474 = &llvm_cbe_movetimear456[((signed long long )((unsigned long long )2ll))];
  llvm_cbe_i_3_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_stat_10_1_ph__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
  llvm_cbe_stat_7_1_ph__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
  goto llvm_cbe_bb466_outer;

  do {     /* Syntactic loop 'bb466.outer' to make GCC happy */
llvm_cbe_bb466_outer:
  llvm_cbe_i_3_reg2mem_0_ph = llvm_cbe_i_3_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_stat_10_1_ph = llvm_cbe_stat_10_1_ph__PHI_TEMPORARY;
  llvm_cbe_stat_7_1_ph = llvm_cbe_stat_7_1_ph__PHI_TEMPORARY;
  llvm_cbe_val37 = *(&cg_caller_id_var);
  llvm_cbe_val48 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )110);
  CallEdgeProfiler(llvm_cbe_val37, llvm_cbe_val48, ((unsigned int )110));
  llvm_cbe_j457_0963__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb458;

llvm_cbe_bb609:
  llvm_cbe_stat_10_0 = llvm_cbe_stat_10_0__PHI_TEMPORARY;
  llvm_cbe_stat_7_0 = llvm_cbe_stat_7_0__PHI_TEMPORARY;
  llvm_cbe_tmp608 = llvm_cbe_i_3_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_tmp611 = *llvm_cbe_tmp61;
  *(&cg_caller_call_site_var) = llvm_cbe_val48;
  *(&cg_caller_id_var) = llvm_cbe_val37;
  if ((((signed int )llvm_cbe_tmp611) > ((signed int )llvm_cbe_tmp608))) {
    llvm_cbe_i_3_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp608;   /* for PHI node */
    llvm_cbe_stat_10_1_ph__PHI_TEMPORARY = llvm_cbe_stat_10_0;   /* for PHI node */
    llvm_cbe_stat_7_1_ph__PHI_TEMPORARY = llvm_cbe_stat_7_0;   /* for PHI node */
    goto llvm_cbe_bb466_outer;
  } else {
    llvm_cbe_stat_10_2__PHI_TEMPORARY = llvm_cbe_stat_10_0;   /* for PHI node */
    llvm_cbe_stat_7_2__PHI_TEMPORARY = llvm_cbe_stat_7_0;   /* for PHI node */
    goto llvm_cbe_bb616;
  }

llvm_cbe_bb471:
  *llvm_cbe_tmp472 = ((unsigned char )1);
  *llvm_cbe_tmp473 = ((unsigned char )-1);
  *llvm_cbe_tmp474 = ((unsigned char )-1);
  *(&llvm_cbe_waylength454) = ((unsigned int )0);
  *(&llvm_cbe_wayar453) = ((struct l_struct_2E_pointt *)/*NULL*/0);
  llvm_cbe_tmp476 = *(&(way2.field17));
  llvm_cbe_tmp56_i446 = ((float )(signed int )(llvm_cbe_tmp476 + ((unsigned int )-2)));
  llvm_cbe_tmp8_i447 = *(&y1rnd);
  llvm_cbe_tmp10_i449 = ((signed int )(((signed int )(llvm_cbe_tmp8_i447 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp11_i450 = *(&y2rnd);
  llvm_cbe_tmp13_i452 = ((signed int )(((signed int )(llvm_cbe_tmp11_i450 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp14_i453 = *(&y3rnd);
  llvm_cbe_tmp16_i455 = ((signed int )(((signed int )(llvm_cbe_tmp14_i453 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp36_i463 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i449)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i452)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i455)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i469 = (((signed int )(((float )(llvm_cbe_tmp56_i446 * (((float )(llvm_cbe_tmp36_i463 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i463)))))))))))) + ((unsigned int )1);
  llvm_cbe_tmp488 = *(&(way2.field18));
  llvm_cbe_tmp56_i422 = ((float )(signed int )(llvm_cbe_tmp488 + ((unsigned int )-2)));
  llvm_cbe_tmp10_i425 = ((signed int )(((signed int )(llvm_cbe_tmp10_i449 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp10_i425;
  llvm_cbe_tmp13_i428 = ((signed int )(((signed int )(llvm_cbe_tmp13_i452 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp13_i428;
  llvm_cbe_tmp16_i431 = ((signed int )(((signed int )(llvm_cbe_tmp16_i455 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp16_i431;
  llvm_cbe_tmp36_i439 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i425)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i428)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i431)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i445 = (((signed int )(((float )(llvm_cbe_tmp56_i422 * (((float )(llvm_cbe_tmp36_i439 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i439)))))))))))) + ((unsigned int )1);
  llvm_cbe_tmp505 = *(&(way2.field0));
  llvm_cbe_tmp514 = *(&llvm_cbe_tmp505[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp476 * llvm_cbe_tmp50_i445) + llvm_cbe_tmp50_i469))))]);
  llvm_cbe_tmp523 = *(&llvm_cbe_movetimear456[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp514)))]);
  if ((llvm_cbe_tmp523 == ((unsigned char )0))) {
    llvm_cbe_stat_10_0__PHI_TEMPORARY = llvm_cbe_stat_10_1_ph;   /* for PHI node */
    llvm_cbe_stat_7_0__PHI_TEMPORARY = llvm_cbe_stat_7_1_ph;   /* for PHI node */
    goto llvm_cbe_bb609;
  } else {
    goto llvm_cbe_cond_true528;
  }

  do {     /* Syntactic loop 'bb458' to make GCC happy */
llvm_cbe_bb458:
  llvm_cbe_j457_0963 = llvm_cbe_j457_0963__PHI_TEMPORARY;
  llvm_cbe_val39 = *(&cg_caller_id_var);
  llvm_cbe_val410 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )111);
  CallEdgeProfiler(llvm_cbe_val39, llvm_cbe_val410, ((unsigned int )111));
  *(&llvm_cbe_movetimear456[((signed long long )(((signed long long )(signed int )llvm_cbe_j457_0963)))]) = (((unsigned char )llvm_cbe_j457_0963));
  llvm_cbe_indvar_next979 = llvm_cbe_j457_0963 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val410;
  *(&cg_caller_id_var) = llvm_cbe_val39;
  if ((llvm_cbe_indvar_next979 == ((unsigned int )256))) {
    goto llvm_cbe_bb471;
  } else {
    llvm_cbe_j457_0963__PHI_TEMPORARY = llvm_cbe_indvar_next979;   /* for PHI node */
    goto llvm_cbe_bb458;
  }

  } while (1); /* end of syntactic loop 'bb458' */
llvm_cbe_cond_true528:
  llvm_cbe_tmp10_i401 = ((signed int )(((signed int )(llvm_cbe_tmp10_i425 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp13_i404 = ((signed int )(((signed int )(llvm_cbe_tmp13_i428 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp16_i407 = ((signed int )(((signed int )(llvm_cbe_tmp16_i431 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp36_i415 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i401)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i404)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i407)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp10_i377 = ((signed int )(((signed int )(llvm_cbe_tmp10_i401 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp10_i377;
  llvm_cbe_tmp13_i380 = ((signed int )(((signed int )(llvm_cbe_tmp13_i404 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp13_i380;
  llvm_cbe_tmp16_i383 = ((signed int )(((signed int )(llvm_cbe_tmp16_i407 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp16_i383;
  llvm_cbe_tmp36_i391 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i377)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i380)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i383)) * 0x1.14a44ap-15)))));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )110);
  llvm_cbe_tmp588 = _ZN7way2obj9createwayEiiiiPhRP6pointtRi(llvm_cbe_tmp50_i469, llvm_cbe_tmp50_i445, ((((signed int )(((float )(llvm_cbe_tmp56_i446 * (((float )(llvm_cbe_tmp36_i415 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i415)))))))))))) + ((unsigned int )1)), ((((signed int )(((float )(llvm_cbe_tmp56_i422 * (((float )(llvm_cbe_tmp36_i391 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i391)))))))))))) + ((unsigned int )1)), llvm_cbe_tmp472, (&llvm_cbe_wayar453), (&llvm_cbe_waylength454));
  llvm_cbe_tmp590 = *(&llvm_cbe_wayar453);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp590)));
  if ((llvm_cbe_tmp588 == ((unsigned char )0))) {
    llvm_cbe_stat_10_0__PHI_TEMPORARY = llvm_cbe_stat_10_1_ph;   /* for PHI node */
    llvm_cbe_stat_7_0__PHI_TEMPORARY = llvm_cbe_stat_7_1_ph;   /* for PHI node */
    goto llvm_cbe_bb609;
  } else {
    goto llvm_cbe_cond_true595;
  }

llvm_cbe_cond_true595:
  llvm_cbe_tmp598 = *(&llvm_cbe_waylength454);
  llvm_cbe_tmp600 = (((signed long long )(signed int )llvm_cbe_tmp598)) + llvm_cbe_stat_7_1_ph;
  llvm_cbe_tmp604 = llvm_cbe_stat_10_1_ph + ((unsigned long long )1ll);
  llvm_cbe_stat_10_0__PHI_TEMPORARY = llvm_cbe_tmp604;   /* for PHI node */
  llvm_cbe_stat_7_0__PHI_TEMPORARY = llvm_cbe_tmp600;   /* for PHI node */
  goto llvm_cbe_bb609;

  } while (1); /* end of syntactic loop 'bb466.outer' */
llvm_cbe_bb616:
  llvm_cbe_stat_10_2 = llvm_cbe_stat_10_2__PHI_TEMPORARY;
  llvm_cbe_stat_7_2 = llvm_cbe_stat_7_2__PHI_TEMPORARY;
  llvm_cbe_i_0_reg2mem_0_i343__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb_i349;

  do {     /* Syntactic loop 'bb.i349' to make GCC happy */
llvm_cbe_bb_i349:
  llvm_cbe_i_0_reg2mem_0_i343 = llvm_cbe_i_0_reg2mem_0_i343__PHI_TEMPORARY;
  llvm_cbe_val311 = *(&cg_caller_id_var);
  llvm_cbe_val412 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )112);
  CallEdgeProfiler(llvm_cbe_val311, llvm_cbe_val412, ((unsigned int )112));
  llvm_cbe_tmp8_i346 = *(&way2.field4[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i343)))].field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp8_i346)));
  llvm_cbe_indvar_next_i347 = llvm_cbe_i_0_reg2mem_0_i343 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val412;
  *(&cg_caller_id_var) = llvm_cbe_val311;
  if ((llvm_cbe_indvar_next_i347 == ((unsigned int )256))) {
    goto llvm_cbe__ZN7way2obj7destroyEv_exit;
  } else {
    llvm_cbe_i_0_reg2mem_0_i343__PHI_TEMPORARY = llvm_cbe_indvar_next_i347;   /* for PHI node */
    goto llvm_cbe_bb_i349;
  }

  } while (1); /* end of syntactic loop 'bb.i349' */
llvm_cbe__ZN7way2obj7destroyEv_exit:
  llvm_cbe_tmp20_i350 = *(&(way2.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp20_i350)));
  llvm_cbe_tmp23_i = *(&(way2.field1));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp23_i)));
  *(&cg_caller_call_site_var) = ((unsigned int )71);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp4_i = printf((&(_2E_str17[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )72);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp5_i = putchar(((unsigned int )10));
  *(&cg_caller_call_site_var) = ((unsigned int )73);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp10_i = printf((&(_2E_str12[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )74);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp15_i = printf((&(_2E_str28[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_8_5);
  *(&cg_caller_call_site_var) = ((unsigned int )75);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp20_i = printf((&(_2E_str39[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_5_5);
  *(&cg_caller_call_site_var) = ((unsigned int )76);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp21_i = putchar(((unsigned int )10));
  *(&cg_caller_call_site_var) = ((unsigned int )77);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp26_i = printf((&(_2E_str410[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )78);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp31_i = printf((&(_2E_str511[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_12_5);
  *(&cg_caller_call_site_var) = ((unsigned int )79);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp36_i = printf((&(_2E_str612[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_11_5);
  *(&cg_caller_call_site_var) = ((unsigned int )80);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp37_i = putchar(((unsigned int )10));
  *(&cg_caller_call_site_var) = ((unsigned int )81);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp42_i = printf((&(_2E_str7[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )82);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp47_i = printf((&(_2E_str8[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_9_2);
  *(&cg_caller_call_site_var) = ((unsigned int )83);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp52_i = printf((&(_2E_str9[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_6_2);
  *(&cg_caller_call_site_var) = ((unsigned int )84);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp57_i = printf((&(_2E_str10[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )85);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp62_i = printf((&(_2E_str11[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_10_2);
  *(&cg_caller_call_site_var) = ((unsigned int )86);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp67_i = printf((&(_2E_str123[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_7_2);
  *(&cg_caller_call_site_var) = ((unsigned int )87);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp618 = putchar(((unsigned int )10));
  *(&cg_caller_call_site_var) = ((unsigned int )88);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp620 = puts((&(_2E_str21[((signed long long )((unsigned long long )0ll))])));
  *(&cg_caller_call_site_var) = ((unsigned int )89);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp622 = puts((&(_2E_str22[((signed long long )((unsigned long long )0ll))])));
  *(&cg_caller_call_site_var) = ((unsigned int )90);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN9regmngobj6createEv();
  *(&(regway.field5)) = (&regmng);
  llvm_cbe_tmp8_i314 = *(&(regmng.field18.field4));
  llvm_cbe_tmp9_i315 = llvm_cbe_tmp8_i314 + ((unsigned int )1);
  *(&(regway.field1.field2)) = llvm_cbe_tmp9_i315;
  *(&(regway.field1.field1)) = ((unsigned int )0);
  ltmp_114_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp9_i315)) * ((unsigned long long )8ll)));
  *(&(regway.field1.field0)) = (((struct l_struct_2E_regobj **)ltmp_114_2));
  *(&(regway.field2.field2)) = llvm_cbe_tmp9_i315;
  *(&(regway.field2.field1)) = ((unsigned int )0);
  ltmp_115_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp9_i315)) * ((unsigned long long )8ll)));
  *(&(regway.field2.field0)) = (((struct l_struct_2E_regobj **)ltmp_115_2));
  llvm_cbe_tmp624 = *llvm_cbe_tmp77;
  llvm_cbe_tmp626 = *llvm_cbe_tmp73;
  llvm_cbe_tmp628 = *llvm_cbe_tmp69;
  *(&llvm_cbe_info_i286.field0) = -0x1.f4p+9;
  *(&llvm_cbe_info_i286.field2) = -0x1.f4p+9;
  *(&llvm_cbe_info_i286.field1) = 0x1.f4p+9;
  *(&llvm_cbe_info_i286.field3) = 0x1.f4p+9;
  *(&cg_caller_call_site_var) = ((unsigned int )91);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp7_i291 = log((((double )(signed int )llvm_cbe_tmp628)));
  *(&llvm_cbe_info_i286.field4) = (((signed int )((llvm_cbe_tmp7_i291 / 0x1.62e42fefa39efp-1) + 0x1p-1)));
  *(&cg_caller_call_site_var) = ((unsigned int )92);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp15_i296 = log((((double )(signed int )llvm_cbe_tmp626)));
  *(&llvm_cbe_info_i286.field5) = (((signed int )((llvm_cbe_tmp15_i296 / 0x1.62e42fefa39efp-1) + 0x1p-1)));
  *(&llvm_cbe_info_i286.field6) = 0x0p+0;
  *(&llvm_cbe_info_i286.field7) = 0x1.86ap+16;
  llvm_cbe_tmp24_i299 = ((struct l_unnamed1 *)(&llvm_cbe_info_i286));
  llvm_cbe_tmp27_i301 = *(((unsigned int *)(&llvm_cbe_info_i286)));
  llvm_cbe_tmp29_i303 = *(&llvm_cbe_tmp24_i299->field0[((signed int )((unsigned int )1))]);
  llvm_cbe_tmp31_i305 = *(&llvm_cbe_tmp24_i299->field0[((signed int )((unsigned int )2))]);
  llvm_cbe_tmp33_i = *(&llvm_cbe_tmp24_i299->field0[((signed int )((unsigned int )3))]);
  llvm_cbe_tmp35_i308 = *(&llvm_cbe_tmp24_i299->field0[((signed int )((unsigned int )4))]);
  llvm_cbe_tmp37_i310 = *(&llvm_cbe_tmp24_i299->field0[((signed int )((unsigned int )5))]);
  llvm_cbe_tmp39_i311 = *(&llvm_cbe_tmp24_i299->field0[((signed int )((unsigned int )6))]);
  llvm_cbe_tmp41_i313 = *(&llvm_cbe_tmp24_i299->field0[((signed int )((unsigned int )7))]);
  *(&cg_caller_call_site_var) = ((unsigned int )93);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN6wayobj6createE17createwaymnginfot(llvm_cbe_tmp27_i301, llvm_cbe_tmp29_i303, llvm_cbe_tmp31_i305, llvm_cbe_tmp33_i, llvm_cbe_tmp35_i308, llvm_cbe_tmp37_i310, llvm_cbe_tmp39_i311, llvm_cbe_tmp41_i313);
  *(&(regmng.field16)) = llvm_cbe_tmp628;
  *(&(regmng.field17)) = llvm_cbe_tmp626;
  *(&(regmng.field12)) = (llvm_cbe_tmp628 + ((unsigned int )-1));
  llvm_cbe_tmp16_i276 = llvm_cbe_tmp626 + ((unsigned int )-1);
  *(&(regmng.field13)) = llvm_cbe_tmp16_i276;
  llvm_cbe_tmp25_i277 = llvm_cbe_tmp626 * llvm_cbe_tmp628;
  ltmp_116_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp25_i277)) * ((unsigned long long )8ll)));
  *(&(regmng.field6)) = (((struct l_struct_2E_regobj **)ltmp_116_2));
  ltmp_117_2 =  /*tail*/ malloc(llvm_cbe_tmp25_i277);
  *(&(regmng.field7)) = (((unsigned char *)ltmp_117_2));
  ltmp_118_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp25_i277)) * ((unsigned long long )2ll)));
  ltmp_119_10 = ((unsigned short *)ltmp_118_2);
  *(&(regmng.field0)) = ltmp_119_10;
  *(&cg_caller_call_site_var) = ((unsigned int )94);
  *(&cg_caller_id_var) = ((unsigned int )22);
  ltmp_120_2 = memset((((unsigned char *)ltmp_119_10)), (((unsigned int )(unsigned char )((unsigned char )0))), ((((signed long long )(signed int )llvm_cbe_tmp25_i277)) << ((unsigned long long )1ll)));
  *(&(regmng.field1)) = ((unsigned short )0);
  llvm_cbe_i_0_reg2mem_0_i281__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb_i285;

  do {     /* Syntactic loop 'bb.i285' to make GCC happy */
llvm_cbe_bb_i285:
  llvm_cbe_i_0_reg2mem_0_i281 = llvm_cbe_i_0_reg2mem_0_i281__PHI_TEMPORARY;
  llvm_cbe_val313 = *(&cg_caller_id_var);
  llvm_cbe_val414 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )113);
  CallEdgeProfiler(llvm_cbe_val313, llvm_cbe_val414, ((unsigned int )113));
  *(&regmng.field8[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i281)))]) = ((unsigned char )0);
  llvm_cbe_indvar_next_i283 = llvm_cbe_i_0_reg2mem_0_i281 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val414;
  *(&cg_caller_id_var) = llvm_cbe_val313;
  if ((llvm_cbe_indvar_next_i283 == ((unsigned int )256))) {
    goto llvm_cbe__ZN9regmngobj7initmapEii_exit;
  } else {
    llvm_cbe_i_0_reg2mem_0_i281__PHI_TEMPORARY = llvm_cbe_indvar_next_i283;   /* for PHI node */
    goto llvm_cbe_bb_i285;
  }

  } while (1); /* end of syntactic loop 'bb.i285' */
llvm_cbe__ZN9regmngobj7initmapEii_exit:
  *(&(regmng.field8[((signed long long )((unsigned long long )0ll))])) = ((unsigned char )1);
  llvm_cbe_tmp638 = *(&(regmng.field7));
  if ((((signed int )llvm_cbe_tmp626) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb669_preheader;
  } else {
    goto llvm_cbe_bb684;
  }

llvm_cbe_bb669_preheader:
  llvm_cbe_tmp977 = (((((signed int )llvm_cbe_tmp16_i276) < ((signed int )((unsigned int )0)))) ? (((unsigned int )1)) : (llvm_cbe_tmp626));
  llvm_cbe_tmp4_i261 = ((float )(llvm_cbe_tmp624 - 0x0p+0));
  llvm_cbe_tmp2_i252 = *(&way_2E_16);
  llvm_cbe_tmp5_i253 = *(&way_2E_2);
  llvm_cbe_y1rnd_promoted = *(&y1rnd);
  llvm_cbe_y2rnd_promoted = *(&y2rnd);
  llvm_cbe_y3rnd_promoted = *(&y3rnd);
  llvm_cbe_y3rnd_tmp_1__PHI_TEMPORARY = llvm_cbe_y3rnd_promoted;   /* for PHI node */
  llvm_cbe_y2rnd_tmp_1__PHI_TEMPORARY = llvm_cbe_y2rnd_promoted;   /* for PHI node */
  llvm_cbe_y1rnd_tmp_1__PHI_TEMPORARY = llvm_cbe_y1rnd_promoted;   /* for PHI node */
  llvm_cbe_y630_0_reg2mem_0_ph__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb669_outer;

  do {     /* Syntactic loop 'bb669.outer' to make GCC happy */
llvm_cbe_bb669_outer:
  llvm_cbe_y3rnd_tmp_1 = llvm_cbe_y3rnd_tmp_1__PHI_TEMPORARY;
  llvm_cbe_y2rnd_tmp_1 = llvm_cbe_y2rnd_tmp_1__PHI_TEMPORARY;
  llvm_cbe_y1rnd_tmp_1 = llvm_cbe_y1rnd_tmp_1__PHI_TEMPORARY;
  llvm_cbe_y630_0_reg2mem_0_ph = llvm_cbe_y630_0_reg2mem_0_ph__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )114);
  CallEdgeProfiler(llvm_cbe_val313, llvm_cbe_val414, ((unsigned int )114));
  llvm_cbe_tmp650 = llvm_cbe_y630_0_reg2mem_0_ph * llvm_cbe_tmp628;
  llvm_cbe_tmp7_i254 = llvm_cbe_y630_0_reg2mem_0_ph << llvm_cbe_tmp5_i253;
  llvm_cbe_y3rnd_tmp_0599__PHI_TEMPORARY = llvm_cbe_y3rnd_tmp_1;   /* for PHI node */
  llvm_cbe_y2rnd_tmp_0598__PHI_TEMPORARY = llvm_cbe_y2rnd_tmp_1;   /* for PHI node */
  llvm_cbe_y1rnd_tmp_0597__PHI_TEMPORARY = llvm_cbe_y1rnd_tmp_1;   /* for PHI node */
  llvm_cbe_x629_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb669;

llvm_cbe_bb675:
  llvm_cbe_y3rnd_tmp_0602 = llvm_cbe_y3rnd_tmp_0602__PHI_TEMPORARY;
  llvm_cbe_y2rnd_tmp_0601 = llvm_cbe_y2rnd_tmp_0601__PHI_TEMPORARY;
  llvm_cbe_y1rnd_tmp_0600 = llvm_cbe_y1rnd_tmp_0600__PHI_TEMPORARY;
  llvm_cbe_indvar_next975 = llvm_cbe_y630_0_reg2mem_0_ph + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val414;
  *(&cg_caller_id_var) = llvm_cbe_val313;
  if ((llvm_cbe_indvar_next975 == llvm_cbe_tmp977)) {
    goto llvm_cbe_bb684_loopexit;
  } else {
    llvm_cbe_y3rnd_tmp_1__PHI_TEMPORARY = llvm_cbe_y3rnd_tmp_0602;   /* for PHI node */
    llvm_cbe_y2rnd_tmp_1__PHI_TEMPORARY = llvm_cbe_y2rnd_tmp_0601;   /* for PHI node */
    llvm_cbe_y1rnd_tmp_1__PHI_TEMPORARY = llvm_cbe_y1rnd_tmp_0600;   /* for PHI node */
    llvm_cbe_y630_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_indvar_next975;   /* for PHI node */
    goto llvm_cbe_bb669_outer;
  }

  do {     /* Syntactic loop 'bb669' to make GCC happy */
llvm_cbe_bb669:
  llvm_cbe_y3rnd_tmp_0599 = llvm_cbe_y3rnd_tmp_0599__PHI_TEMPORARY;
  llvm_cbe_y2rnd_tmp_0598 = llvm_cbe_y2rnd_tmp_0598__PHI_TEMPORARY;
  llvm_cbe_y1rnd_tmp_0597 = llvm_cbe_y1rnd_tmp_0597__PHI_TEMPORARY;
  llvm_cbe_x629_0 = llvm_cbe_x629_0__PHI_TEMPORARY;
  llvm_cbe_val317 = *(&cg_caller_id_var);
  llvm_cbe_val418 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )115);
  CallEdgeProfiler(llvm_cbe_val317, llvm_cbe_val418, ((unsigned int )115));
  *(&cg_caller_call_site_var) = llvm_cbe_val418;
  *(&cg_caller_id_var) = llvm_cbe_val317;
  if ((((signed int )llvm_cbe_x629_0) < ((signed int )llvm_cbe_tmp628))) {
    llvm_cbe_y3rnd_tmp_0__PHI_TEMPORARY = llvm_cbe_y3rnd_tmp_0599;   /* for PHI node */
    llvm_cbe_y2rnd_tmp_0__PHI_TEMPORARY = llvm_cbe_y2rnd_tmp_0598;   /* for PHI node */
    llvm_cbe_y1rnd_tmp_0__PHI_TEMPORARY = llvm_cbe_y1rnd_tmp_0597;   /* for PHI node */
    llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb640;
  } else {
    llvm_cbe_y3rnd_tmp_0602__PHI_TEMPORARY = llvm_cbe_y3rnd_tmp_0599;   /* for PHI node */
    llvm_cbe_y2rnd_tmp_0601__PHI_TEMPORARY = llvm_cbe_y2rnd_tmp_0598;   /* for PHI node */
    llvm_cbe_y1rnd_tmp_0600__PHI_TEMPORARY = llvm_cbe_y1rnd_tmp_0597;   /* for PHI node */
    goto llvm_cbe_bb675;
  }

llvm_cbe_cond_false:
  *llvm_cbe_tmp655 = ((unsigned char )1);
  llvm_cbe_tmp11_i256 = &llvm_cbe_tmp2_i252[((signed long long )(((signed long long )(signed int )(llvm_cbe_tmp7_i254 | llvm_cbe_x629_0_reg2mem_0))))];
  llvm_cbe_tmp12_i257 = *llvm_cbe_tmp11_i256;
  if ((((signed short )llvm_cbe_tmp12_i257) > ((signed short )((unsigned short )-1)))) {
    goto llvm_cbe_cond_true_i;
  } else {
    llvm_cbe_y3rnd_tmp_0599__PHI_TEMPORARY = llvm_cbe_tmp14_i270;   /* for PHI node */
    llvm_cbe_y2rnd_tmp_0598__PHI_TEMPORARY = llvm_cbe_tmp11_i267;   /* for PHI node */
    llvm_cbe_y1rnd_tmp_0597__PHI_TEMPORARY = llvm_cbe_tmp8_i264;   /* for PHI node */
    llvm_cbe_x629_0__PHI_TEMPORARY = llvm_cbe_tmp668;   /* for PHI node */
    goto llvm_cbe_bb669;
  }

  do {     /* Syntactic loop 'bb640' to make GCC happy */
llvm_cbe_bb640:
  llvm_cbe_y3rnd_tmp_0 = llvm_cbe_y3rnd_tmp_0__PHI_TEMPORARY;
  llvm_cbe_y2rnd_tmp_0 = llvm_cbe_y2rnd_tmp_0__PHI_TEMPORARY;
  llvm_cbe_y1rnd_tmp_0 = llvm_cbe_y1rnd_tmp_0__PHI_TEMPORARY;
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )116);
  CallEdgeProfiler(llvm_cbe_val317, llvm_cbe_val418, ((unsigned int )116));
  llvm_cbe_x629_0_reg2mem_0 = llvm_cbe_indvar + llvm_cbe_x629_0;
  llvm_cbe_tmp8_i264 = ((signed int )(((signed int )(llvm_cbe_y1rnd_tmp_0 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp11_i267 = ((signed int )(((signed int )(llvm_cbe_y2rnd_tmp_0 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp14_i270 = ((signed int )(((signed int )(llvm_cbe_y3rnd_tmp_0 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp34_i272 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp8_i264)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp11_i267)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp14_i270)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp655 = &llvm_cbe_tmp638[((signed long long )(((signed long long )(signed int )(llvm_cbe_x629_0_reg2mem_0 + llvm_cbe_tmp650))))];
  llvm_cbe_tmp668 = llvm_cbe_x629_0_reg2mem_0 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val418;
  *(&cg_caller_id_var) = llvm_cbe_val317;
  if ((llvm_fcmp_ugt((((float )((((float )(llvm_cbe_tmp4_i261 * (((float )(llvm_cbe_tmp34_i272 - (((float )(signed int )(((signed int )llvm_cbe_tmp34_i272)))))))))) + 0x0p+0))), 0x1p+0))) {
    goto llvm_cbe_cond_false;
  } else {
    goto llvm_cbe_cond_true647;
  }

llvm_cbe_cond_true647:
  *llvm_cbe_tmp655 = ((unsigned char )0);
  llvm_cbe_indvar_next973 = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val418;
  *(&cg_caller_id_var) = llvm_cbe_val317;
  if ((((signed int )llvm_cbe_tmp668) < ((signed int )llvm_cbe_tmp628))) {
    llvm_cbe_y3rnd_tmp_0__PHI_TEMPORARY = llvm_cbe_tmp14_i270;   /* for PHI node */
    llvm_cbe_y2rnd_tmp_0__PHI_TEMPORARY = llvm_cbe_tmp11_i267;   /* for PHI node */
    llvm_cbe_y1rnd_tmp_0__PHI_TEMPORARY = llvm_cbe_tmp8_i264;   /* for PHI node */
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next973;   /* for PHI node */
    goto llvm_cbe_bb640;
  } else {
    llvm_cbe_y3rnd_tmp_0602__PHI_TEMPORARY = llvm_cbe_tmp14_i270;   /* for PHI node */
    llvm_cbe_y2rnd_tmp_0601__PHI_TEMPORARY = llvm_cbe_tmp11_i267;   /* for PHI node */
    llvm_cbe_y1rnd_tmp_0600__PHI_TEMPORARY = llvm_cbe_tmp8_i264;   /* for PHI node */
    goto llvm_cbe_bb675;
  }

  } while (1); /* end of syntactic loop 'bb640' */
llvm_cbe_cond_true_i:
  *llvm_cbe_tmp11_i256 = (((unsigned short )(llvm_cbe_tmp12_i257 + ((unsigned short )1))));
  llvm_cbe_y3rnd_tmp_0599__PHI_TEMPORARY = llvm_cbe_tmp14_i270;   /* for PHI node */
  llvm_cbe_y2rnd_tmp_0598__PHI_TEMPORARY = llvm_cbe_tmp11_i267;   /* for PHI node */
  llvm_cbe_y1rnd_tmp_0597__PHI_TEMPORARY = llvm_cbe_tmp8_i264;   /* for PHI node */
  llvm_cbe_x629_0__PHI_TEMPORARY = llvm_cbe_tmp668;   /* for PHI node */
  goto llvm_cbe_bb669;

  } while (1); /* end of syntactic loop 'bb669' */
  } while (1); /* end of syntactic loop 'bb669.outer' */
llvm_cbe_bb684_loopexit:
  *(&y1rnd) = llvm_cbe_y1rnd_tmp_0600;
  *(&y2rnd) = llvm_cbe_y2rnd_tmp_0601;
  *(&y3rnd) = llvm_cbe_y3rnd_tmp_0602;
  goto llvm_cbe_bb684;

llvm_cbe_bb684:
  llvm_cbe_tmp699 = *llvm_cbe_tmp81;
  *(&cg_caller_call_site_var) = ((unsigned int )95);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN9regmngobj13createregionsEi(llvm_cbe_tmp699);
  *(&cg_caller_call_site_var) = ((unsigned int )96);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp701 = time(((unsigned long long *)/*NULL*/0));
  llvm_cbe_tmp767951 = *llvm_cbe_tmp85;
  if ((((signed int )llvm_cbe_tmp767951) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_4_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_stat_8_1__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_5_1__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb702;
  } else {
    llvm_cbe_stat_8_2__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_5_2__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb772;
  }

  do {     /* Syntactic loop 'bb702' to make GCC happy */
llvm_cbe_bb702:
  llvm_cbe_i_4_reg2mem_0 = llvm_cbe_i_4_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_stat_8_1 = llvm_cbe_stat_8_1__PHI_TEMPORARY;
  llvm_cbe_stat_5_1 = llvm_cbe_stat_5_1__PHI_TEMPORARY;
  llvm_cbe_val321 = *(&cg_caller_id_var);
  llvm_cbe_val422 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )117);
  CallEdgeProfiler(llvm_cbe_val321, llvm_cbe_val422, ((unsigned int )117));
  *(&llvm_cbe_waylength708) = ((unsigned int )0);
  *(&llvm_cbe_wayar707) = ((struct l_struct_2E_point16t *)/*NULL*/0);
  llvm_cbe_tmp711 = *(&(regmng.field12));
  llvm_cbe_tmp8_i205 = *(&y1rnd);
  llvm_cbe_tmp10_i207 = ((signed int )(((signed int )(llvm_cbe_tmp8_i205 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp11_i208 = *(&y2rnd);
  llvm_cbe_tmp13_i210 = ((signed int )(((signed int )(llvm_cbe_tmp11_i208 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp14_i211 = *(&y3rnd);
  llvm_cbe_tmp16_i213 = ((signed int )(((signed int )(llvm_cbe_tmp14_i211 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp36_i221 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i207)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i210)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i213)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i227 = (((signed int )(((float )((((float )(signed int )llvm_cbe_tmp711)) * (((float )(llvm_cbe_tmp36_i221 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i221)))))))))))) + ((unsigned int )1);
  *(&llvm_cbe_startx703) = llvm_cbe_tmp50_i227;
  llvm_cbe_tmp714 = *(&(regmng.field13));
  llvm_cbe_tmp10_i183 = ((signed int )(((signed int )(llvm_cbe_tmp10_i207 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp10_i183;
  llvm_cbe_tmp13_i186 = ((signed int )(((signed int )(llvm_cbe_tmp13_i210 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp13_i186;
  llvm_cbe_tmp16_i189 = ((signed int )(((signed int )(llvm_cbe_tmp16_i213 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp16_i189;
  llvm_cbe_tmp36_i197 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i183)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i186)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i189)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i203 = (((signed int )(((float )((((float )(signed int )llvm_cbe_tmp714)) * (((float )(llvm_cbe_tmp36_i197 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i197)))))))))))) + ((unsigned int )1);
  *(&llvm_cbe_starty704) = llvm_cbe_tmp50_i203;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )117);
  llvm_cbe_tmp718 = _ZN6wayobj13findfreepointEiiRiS0_(llvm_cbe_tmp50_i227, llvm_cbe_tmp50_i203, (&llvm_cbe_startx703), (&llvm_cbe_starty704));
  if ((llvm_cbe_tmp718 == ((unsigned char )0))) {
    llvm_cbe_flcreate709_1__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_cond_next748;
  } else {
    goto llvm_cbe_cond_true721;
  }

llvm_cbe_bb765:
  llvm_cbe_stat_8_0 = llvm_cbe_stat_8_0__PHI_TEMPORARY;
  llvm_cbe_stat_5_0 = llvm_cbe_stat_5_0__PHI_TEMPORARY;
  llvm_cbe_tmp764 = llvm_cbe_i_4_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp767 = *llvm_cbe_tmp85;
  *(&cg_caller_call_site_var) = llvm_cbe_val422;
  *(&cg_caller_id_var) = llvm_cbe_val321;
  if ((((signed int )llvm_cbe_tmp767) > ((signed int )llvm_cbe_tmp764))) {
    llvm_cbe_i_4_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp764;   /* for PHI node */
    llvm_cbe_stat_8_1__PHI_TEMPORARY = llvm_cbe_stat_8_0;   /* for PHI node */
    llvm_cbe_stat_5_1__PHI_TEMPORARY = llvm_cbe_stat_5_0;   /* for PHI node */
    goto llvm_cbe_bb702;
  } else {
    llvm_cbe_stat_8_2__PHI_TEMPORARY = llvm_cbe_stat_8_0;   /* for PHI node */
    llvm_cbe_stat_5_2__PHI_TEMPORARY = llvm_cbe_stat_5_0;   /* for PHI node */
    goto llvm_cbe_bb772;
  }

llvm_cbe_cond_next748:
  llvm_cbe_flcreate709_1 = llvm_cbe_flcreate709_1__PHI_TEMPORARY;
  if ((llvm_cbe_flcreate709_1 == ((unsigned char )0))) {
    llvm_cbe_stat_8_0__PHI_TEMPORARY = llvm_cbe_stat_8_1;   /* for PHI node */
    llvm_cbe_stat_5_0__PHI_TEMPORARY = llvm_cbe_stat_5_1;   /* for PHI node */
    goto llvm_cbe_bb765;
  } else {
    goto llvm_cbe_cond_true751;
  }

llvm_cbe_cond_next739:
  llvm_cbe_flcreate709_0 = llvm_cbe_flcreate709_0__PHI_TEMPORARY;
  llvm_cbe_tmp740 = *(&llvm_cbe_wayar707);
  if ((llvm_cbe_tmp740 == ((struct l_struct_2E_point16t *)/*NULL*/0))) {
    llvm_cbe_flcreate709_1__PHI_TEMPORARY = llvm_cbe_flcreate709_0;   /* for PHI node */
    goto llvm_cbe_cond_next748;
  } else {
    goto llvm_cbe_cond_true744;
  }

llvm_cbe_cond_true721:
  llvm_cbe_tmp723 = *(&(regmng.field12));
  llvm_cbe_tmp8_i133 = *(&y1rnd);
  llvm_cbe_tmp10_i135 = ((signed int )(((signed int )(llvm_cbe_tmp8_i133 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp11_i136 = *(&y2rnd);
  llvm_cbe_tmp13_i138 = ((signed int )(((signed int )(llvm_cbe_tmp11_i136 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp14_i139 = *(&y3rnd);
  llvm_cbe_tmp16_i141 = ((signed int )(((signed int )(llvm_cbe_tmp14_i139 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp36_i149 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i135)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i138)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i141)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i155 = (((signed int )(((float )((((float )(signed int )llvm_cbe_tmp723)) * (((float )(llvm_cbe_tmp36_i149 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i149)))))))))))) + ((unsigned int )1);
  *(&llvm_cbe_endx705) = llvm_cbe_tmp50_i155;
  llvm_cbe_tmp726 = *(&(regmng.field13));
  llvm_cbe_tmp10_i111 = ((signed int )(((signed int )(llvm_cbe_tmp10_i135 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp10_i111;
  llvm_cbe_tmp13_i114 = ((signed int )(((signed int )(llvm_cbe_tmp13_i138 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp13_i114;
  llvm_cbe_tmp16_i117 = ((signed int )(((signed int )(llvm_cbe_tmp16_i141 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp16_i117;
  llvm_cbe_tmp36_i125 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp10_i111)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp13_i114)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp16_i117)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp50_i131 = (((signed int )(((float )((((float )(signed int )llvm_cbe_tmp726)) * (((float )(llvm_cbe_tmp36_i125 - (((float )(signed int )(((signed int )llvm_cbe_tmp36_i125)))))))))))) + ((unsigned int )1);
  *(&llvm_cbe_endy706) = llvm_cbe_tmp50_i131;
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )117);
  llvm_cbe_tmp730 = _ZN6wayobj13findfreepointEiiRiS0_(llvm_cbe_tmp50_i155, llvm_cbe_tmp50_i131, (&llvm_cbe_endx705), (&llvm_cbe_endy706));
  if ((llvm_cbe_tmp730 == ((unsigned char )0))) {
    llvm_cbe_flcreate709_0__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
    goto llvm_cbe_cond_next739;
  } else {
    goto llvm_cbe_cond_true733;
  }

llvm_cbe_cond_true733:
  llvm_cbe_tmp734 = *(&llvm_cbe_endy706);
  llvm_cbe_tmp735 = *(&llvm_cbe_endx705);
  llvm_cbe_tmp736 = *(&llvm_cbe_starty704);
  llvm_cbe_tmp737 = *(&llvm_cbe_startx703);
  *(&cg_caller_call_site_var) = ((unsigned int )2);
  *(&cg_caller_id_var) = ((unsigned int )117);
  llvm_cbe_tmp738 = _ZN6wayobj9createwayEiiiiRP8point16tRi(llvm_cbe_tmp737, llvm_cbe_tmp736, llvm_cbe_tmp735, llvm_cbe_tmp734, (&llvm_cbe_wayar707), (&llvm_cbe_waylength708));
  llvm_cbe_flcreate709_0__PHI_TEMPORARY = llvm_cbe_tmp738;   /* for PHI node */
  goto llvm_cbe_cond_next739;

llvm_cbe_cond_true744:
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp740)));
  llvm_cbe_flcreate709_1__PHI_TEMPORARY = llvm_cbe_flcreate709_0;   /* for PHI node */
  goto llvm_cbe_cond_next748;

llvm_cbe_cond_true751:
  llvm_cbe_tmp754 = *(&llvm_cbe_waylength708);
  llvm_cbe_tmp756 = (((signed long long )(signed int )llvm_cbe_tmp754)) + llvm_cbe_stat_5_1;
  llvm_cbe_tmp760 = llvm_cbe_stat_8_1 + ((unsigned long long )1ll);
  llvm_cbe_stat_8_0__PHI_TEMPORARY = llvm_cbe_tmp760;   /* for PHI node */
  llvm_cbe_stat_5_0__PHI_TEMPORARY = llvm_cbe_tmp756;   /* for PHI node */
  goto llvm_cbe_bb765;

  } while (1); /* end of syntactic loop 'bb702' */
llvm_cbe_bb772:
  llvm_cbe_stat_8_2 = llvm_cbe_stat_8_2__PHI_TEMPORARY;
  llvm_cbe_stat_5_2 = llvm_cbe_stat_5_2__PHI_TEMPORARY;
  llvm_cbe_tmp866956 = *llvm_cbe_tmp89;
  if ((((signed int )llvm_cbe_tmp866956) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_5_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    llvm_cbe_stat_12_1__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_11_1__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb774;
  } else {
    llvm_cbe_stat_12_2__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    llvm_cbe_stat_11_2__PHI_TEMPORARY = ((unsigned long long )0ll);   /* for PHI node */
    goto llvm_cbe_bb871;
  }

  do {     /* Syntactic loop 'bb774' to make GCC happy */
llvm_cbe_bb774:
  llvm_cbe_i_5_reg2mem_0 = llvm_cbe_i_5_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_stat_12_1 = llvm_cbe_stat_12_1__PHI_TEMPORARY;
  llvm_cbe_stat_11_1 = llvm_cbe_stat_11_1__PHI_TEMPORARY;
  llvm_cbe_val323 = *(&cg_caller_id_var);
  llvm_cbe_val424 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )118);
  CallEdgeProfiler(llvm_cbe_val323, llvm_cbe_val424, ((unsigned int )118));
  llvm_cbe_tmp784 = *(&(regmng.field18.field4));
  llvm_cbe_tmp3_i43 = *(&y1rnd);
  llvm_cbe_tmp5_i45 = ((signed int )(((signed int )(llvm_cbe_tmp3_i43 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  llvm_cbe_tmp6_i46 = *(&y2rnd);
  llvm_cbe_tmp8_i48 = ((signed int )(((signed int )(llvm_cbe_tmp6_i46 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  llvm_cbe_tmp9_i49 = *(&y3rnd);
  llvm_cbe_tmp11_i51 = ((signed int )(((signed int )(llvm_cbe_tmp9_i49 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  llvm_cbe_tmp31_i59 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp5_i45)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp8_i48)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp11_i51)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp4142_i63 = ((float )(signed int )(llvm_cbe_tmp784 + ((unsigned int )-1)));
  llvm_cbe_tmp5_i33 = ((signed int )(((signed int )(llvm_cbe_tmp5_i45 * ((unsigned int )171))) % ((signed int )((unsigned int )30269))));
  *(&y1rnd) = llvm_cbe_tmp5_i33;
  llvm_cbe_tmp8_i34 = ((signed int )(((signed int )(llvm_cbe_tmp8_i48 * ((unsigned int )172))) % ((signed int )((unsigned int )30307))));
  *(&y2rnd) = llvm_cbe_tmp8_i34;
  llvm_cbe_tmp11_i37 = ((signed int )(((signed int )(llvm_cbe_tmp11_i51 * ((unsigned int )170))) % ((signed int )((unsigned int )30323))));
  *(&y3rnd) = llvm_cbe_tmp11_i37;
  llvm_cbe_tmp31_i41 = ((float )((((float )((((float )((((float )(signed int )llvm_cbe_tmp5_i33)) * 0x1.1522a2p-15))) + (((float )((((float )(signed int )llvm_cbe_tmp8_i34)) * 0x1.14c9aep-15)))))) + (((float )((((float )(signed int )llvm_cbe_tmp11_i37)) * 0x1.14a44ap-15)))));
  llvm_cbe_tmp797 = *(&(regmng.field18.field0));
  llvm_cbe_tmp804 = *(&llvm_cbe_tmp797[((signed long long )(((signed long long )(signed int )(((signed int )(((float )((((float )(llvm_cbe_tmp31_i59 - (((float )(signed int )(((signed int )llvm_cbe_tmp31_i59))))))) * llvm_cbe_tmp4142_i63))))))))]);
  llvm_cbe_tmp808 = *(&llvm_cbe_tmp804->field9.field1);
  if ((llvm_cbe_tmp808 == ((unsigned int )0))) {
    llvm_cbe_stat_12_0__PHI_TEMPORARY = llvm_cbe_stat_12_1;   /* for PHI node */
    llvm_cbe_stat_11_0__PHI_TEMPORARY = llvm_cbe_stat_11_1;   /* for PHI node */
    goto llvm_cbe_bb864;
  } else {
    goto llvm_cbe_cond_next813;
  }

llvm_cbe_bb864:
  llvm_cbe_stat_12_0 = llvm_cbe_stat_12_0__PHI_TEMPORARY;
  llvm_cbe_stat_11_0 = llvm_cbe_stat_11_0__PHI_TEMPORARY;
  llvm_cbe_tmp863 = llvm_cbe_i_5_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp866 = *llvm_cbe_tmp89;
  *(&cg_caller_call_site_var) = llvm_cbe_val424;
  *(&cg_caller_id_var) = llvm_cbe_val323;
  if ((((signed int )llvm_cbe_tmp866) > ((signed int )llvm_cbe_tmp863))) {
    llvm_cbe_i_5_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp863;   /* for PHI node */
    llvm_cbe_stat_12_1__PHI_TEMPORARY = llvm_cbe_stat_12_0;   /* for PHI node */
    llvm_cbe_stat_11_1__PHI_TEMPORARY = llvm_cbe_stat_11_0;   /* for PHI node */
    goto llvm_cbe_bb774;
  } else {
    llvm_cbe_stat_12_2__PHI_TEMPORARY = llvm_cbe_stat_12_0;   /* for PHI node */
    llvm_cbe_stat_11_2__PHI_TEMPORARY = llvm_cbe_stat_11_0;   /* for PHI node */
    goto llvm_cbe_bb871;
  }

llvm_cbe_cond_next813:
  llvm_cbe_tmp826 = *(&llvm_cbe_tmp797[((signed long long )(((signed long long )(signed int )(((signed int )(((float )((((float )(llvm_cbe_tmp31_i41 - (((float )(signed int )(((signed int )llvm_cbe_tmp31_i41))))))) * llvm_cbe_tmp4142_i63))))))))]);
  llvm_cbe_tmp830 = *(&llvm_cbe_tmp826->field9.field1);
  if ((llvm_cbe_tmp830 == ((unsigned int )0))) {
    llvm_cbe_stat_12_0__PHI_TEMPORARY = llvm_cbe_stat_12_1;   /* for PHI node */
    llvm_cbe_stat_11_0__PHI_TEMPORARY = llvm_cbe_stat_11_1;   /* for PHI node */
    goto llvm_cbe_bb864;
  } else {
    goto llvm_cbe_cond_next835;
  }

llvm_cbe_cond_next846:
  if ((llvm_cbe_tmp838 == ((unsigned char )0))) {
    llvm_cbe_stat_12_0__PHI_TEMPORARY = llvm_cbe_stat_12_1;   /* for PHI node */
    llvm_cbe_stat_11_0__PHI_TEMPORARY = llvm_cbe_stat_11_1;   /* for PHI node */
    goto llvm_cbe_bb864;
  } else {
    goto llvm_cbe_cond_true849;
  }

llvm_cbe_cond_next835:
  *(&llvm_cbe_wayar779) = ((struct l_struct_2E_regobj **)/*NULL*/0);
  *(&llvm_cbe_waylength780) = ((unsigned int )0);
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )118);
  llvm_cbe_tmp838 = _ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri(llvm_cbe_tmp804, llvm_cbe_tmp826, (&llvm_cbe_wayar779), (&llvm_cbe_waylength780));
  llvm_cbe_tmp839 = *(&llvm_cbe_wayar779);
  if ((llvm_cbe_tmp839 == ((struct l_struct_2E_regobj **)/*NULL*/0))) {
    goto llvm_cbe_cond_next846;
  } else {
    goto llvm_cbe_cond_true843;
  }

llvm_cbe_cond_true843:
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp839)));
  goto llvm_cbe_cond_next846;

llvm_cbe_cond_true849:
  llvm_cbe_tmp852 = *(&llvm_cbe_waylength780);
  llvm_cbe_tmp854 = (((signed long long )(signed int )llvm_cbe_tmp852)) + llvm_cbe_stat_11_1;
  llvm_cbe_tmp858 = llvm_cbe_stat_12_1 + ((unsigned long long )1ll);
  llvm_cbe_stat_12_0__PHI_TEMPORARY = llvm_cbe_tmp858;   /* for PHI node */
  llvm_cbe_stat_11_0__PHI_TEMPORARY = llvm_cbe_tmp854;   /* for PHI node */
  goto llvm_cbe_bb864;

  } while (1); /* end of syntactic loop 'bb774' */
llvm_cbe_bb871:
  llvm_cbe_stat_12_2 = llvm_cbe_stat_12_2__PHI_TEMPORARY;
  llvm_cbe_stat_11_2 = llvm_cbe_stat_11_2__PHI_TEMPORARY;
  llvm_cbe_tmp5_i13 = *(&(regway.field1.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp5_i13)));
  llvm_cbe_tmp13_i = *(&(regway.field2.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp13_i)));
  *(&cg_caller_call_site_var) = ((unsigned int )101);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN9regmngobj7destroyEv();
  *(&cg_caller_call_site_var) = ((unsigned int )102);
  *(&cg_caller_id_var) = ((unsigned int )22);
  _ZN6wayobj7destroyEv();
  *(&cg_caller_call_site_var) = ((unsigned int )103);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp4_i879 = printf((&(_2E_str17[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )104);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp5_i880 = putchar(((unsigned int )10));
  *(&cg_caller_call_site_var) = ((unsigned int )105);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp10_i883 = printf((&(_2E_str12[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )106);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp15_i886 = printf((&(_2E_str28[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_8_2);
  *(&cg_caller_call_site_var) = ((unsigned int )107);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp20_i889 = printf((&(_2E_str39[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_5_2);
  *(&cg_caller_call_site_var) = ((unsigned int )108);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp21_i890 = putchar(((unsigned int )10));
  *(&cg_caller_call_site_var) = ((unsigned int )109);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp26_i893 = printf((&(_2E_str410[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )110);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp31_i896 = printf((&(_2E_str511[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_12_2);
  *(&cg_caller_call_site_var) = ((unsigned int )111);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp36_i899 = printf((&(_2E_str612[((signed long long )((unsigned long long )0ll))])), llvm_cbe_stat_11_2);
  *(&cg_caller_call_site_var) = ((unsigned int )112);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp37_i900 = putchar(((unsigned int )10));
  *(&cg_caller_call_site_var) = ((unsigned int )113);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp42_i903 = printf((&(_2E_str7[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )114);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp47_i906 = printf((&(_2E_str8[((signed long long )((unsigned long long )0ll))])), ((unsigned long long )0ll));
  *(&cg_caller_call_site_var) = ((unsigned int )115);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp52_i909 = printf((&(_2E_str9[((signed long long )((unsigned long long )0ll))])), ((unsigned long long )0ll));
  *(&cg_caller_call_site_var) = ((unsigned int )116);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp57_i912 = printf((&(_2E_str10[((signed long long )((unsigned long long )0ll))])), 0x0p+0);
  *(&cg_caller_call_site_var) = ((unsigned int )117);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp62_i915 = printf((&(_2E_str11[((signed long long )((unsigned long long )0ll))])), ((unsigned long long )0ll));
  *(&cg_caller_call_site_var) = ((unsigned int )118);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp67_i918 = printf((&(_2E_str123[((signed long long )((unsigned long long )0ll))])), ((unsigned long long )0ll));
  *(&cg_caller_call_site_var) = ((unsigned int )119);
  *(&cg_caller_id_var) = ((unsigned int )22);
  llvm_cbe_tmp873 = putchar(((unsigned int )10));
  CallProfPrinter();
  return ((unsigned int )0);
}


static void _ZN9regwayobj6createEP9regmngobj(struct l_struct_2E_regwayobj *llvm_cbe_this, struct l_struct_2E_regmngobj *llvm_cbe_regmngpin) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int *llvm_cbe_tmp7;
  unsigned int llvm_cbe_tmp8;
  unsigned int llvm_cbe_tmp9;
  unsigned char *ltmp_121_2;
  unsigned int llvm_cbe_tmp39;
  unsigned int llvm_cbe_tmp40;
  unsigned char *ltmp_122_2;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )23);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )23));
  *(&llvm_cbe_this->field5) = llvm_cbe_regmngpin;
  llvm_cbe_tmp7 = &llvm_cbe_regmngpin->field18.field4;
  llvm_cbe_tmp8 = *llvm_cbe_tmp7;
  llvm_cbe_tmp9 = llvm_cbe_tmp8 + ((unsigned int )1);
  *(&llvm_cbe_this->field1.field2) = llvm_cbe_tmp9;
  *(&llvm_cbe_this->field1.field1) = ((unsigned int )0);
  ltmp_121_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp9)) * ((unsigned long long )8ll)));
  *(&llvm_cbe_this->field1.field0) = (((struct l_struct_2E_regobj **)ltmp_121_2));
  llvm_cbe_tmp39 = *llvm_cbe_tmp7;
  llvm_cbe_tmp40 = llvm_cbe_tmp39 + ((unsigned int )1);
  *(&llvm_cbe_this->field2.field2) = llvm_cbe_tmp40;
  *(&llvm_cbe_this->field2.field1) = ((unsigned int )0);
  ltmp_122_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp40)) * ((unsigned long long )8ll)));
  *(&llvm_cbe_this->field2.field0) = (((struct l_struct_2E_regobj **)ltmp_122_2));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static unsigned char _ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri(struct l_struct_2E_regobj *llvm_cbe_rstart, struct l_struct_2E_regobj *llvm_cbe_rfinish, struct l_struct_2E_regobj ***llvm_cbe_wayar, unsigned int *llvm_cbe_waylength) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned char *ltmp_123_2;
  struct l_struct_2E_regobj **ltmp_124_9;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp11_i;
  unsigned int *llvm_cbe_tmp3_i_i;
  unsigned int llvm_cbe_tmp4_i_i;
  unsigned int llvm_cbe_tmp5_i_i;
  unsigned int llvm_cbe_tmp3751_i_i;
  unsigned int llvm_cbe_i_0_reg2mem_0_i_i;
  unsigned int llvm_cbe_i_0_reg2mem_0_i_i__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_tmp22_i_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp29_i_i;
  unsigned int llvm_cbe_tmp32_i_i;
  unsigned int llvm_cbe_i_0_i_i;
  unsigned int llvm_cbe_i_0_i_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp37_i_i;
  unsigned int llvm_cbe_tmp45_i_i;
  unsigned int llvm_cbe_tmp35_i;
  unsigned int llvm_cbe_tmp44_i;
  unsigned char *ltmp_125_2;
  struct l_struct_2E_regobj **ltmp_126_9;
  struct l_struct_2E_regobj **llvm_cbe_tmp66_i;
  unsigned char *ltmp_127_2;
  struct l_struct_2E_regobj **llvm_cbe_tmp72_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp84_i;
  unsigned int llvm_cbe_tmp87_i;
  unsigned int llvm_cbe_tmp94_i;
  unsigned char llvm_cbe_newflodd_0_i;
  unsigned char llvm_cbe_newflodd_0_i__PHI_TEMPORARY;
  unsigned int *llvm_cbe_boundl_0_in_i;
  unsigned int *llvm_cbe_boundl_0_in_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_boundl_0_i;
  unsigned int llvm_cbe_tmp129_i;
  unsigned int llvm_cbe_tmp130_i;
  unsigned int llvm_cbe_tmp6_i_rle9;
  unsigned int llvm_cbe_tmp6_i_rle9__PHI_TEMPORARY;
  unsigned char llvm_cbe_flodd_0_reg2mem_0_i;
  unsigned char llvm_cbe_flodd_0_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned char llvm_cbe_tmp142_i;
  unsigned int llvm_cbe_tmp6_i_rle;
  unsigned int llvm_cbe_tmp6_i_rle__PHI_TEMPORARY;
  unsigned char llvm_cbe_tmp150_i;
  unsigned char *ltmp_128_2;
  struct l_struct_2E_regobj **ltmp_129_9;
  unsigned int llvm_cbe_tmp16_i;
  unsigned int *llvm_cbe_tmp79_i;
  unsigned int *llvm_cbe_tmp95_i1;
  struct l_struct_2E_regobj **llvm_cbe_tmp190_rle245_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp190_rle245_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar_i;
  unsigned int llvm_cbe_indvar_i__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_tmp23_reg2mem_0_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp23_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_i_0_reg2mem_0_i;
  unsigned int llvm_cbe_i_0_in_reg2mem_0_i;
  struct l_struct_2E_regobj *llvm_cbe_tmp27_i;
  unsigned int llvm_cbe_tmp176236_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp36_i3;
  unsigned int llvm_cbe_tmp49_i;
  unsigned int llvm_cbe_tmp56_i;
  unsigned int llvm_cbe_j_0_reg2mem_0_i;
  unsigned int llvm_cbe_j_0_reg2mem_0_i__PHI_TEMPORARY;
  struct l_struct_2E_regobj *llvm_cbe_minregionp_1_reg2mem_0_i;
  struct l_struct_2E_regobj *llvm_cbe_minregionp_1_reg2mem_0_i__PHI_TEMPORARY;
  float llvm_cbe_mindist2_1_reg2mem_0_i;
  float llvm_cbe_mindist2_1_reg2mem_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_val33;
  unsigned int llvm_cbe_val44;
  struct l_struct_2E_regobj *llvm_cbe_tmp43_i;
  unsigned int llvm_cbe_tmp46_i;
  unsigned int llvm_cbe_tmp54_i;
  unsigned int llvm_cbe_tmp75_i;
  unsigned int llvm_cbe_tmp80_i;
  float llvm_cbe_tmp8182_i;
  unsigned int llvm_cbe_tmp92_i;
  unsigned int llvm_cbe_tmp96_i;
  float llvm_cbe_tmp9798_i;
  float llvm_cbe_tmp108_i;
  float llvm_cbe_mindist2_0_i;
  float llvm_cbe_mindist2_0_i__PHI_TEMPORARY;
  struct l_struct_2E_regobj *llvm_cbe_minregionp_0_i;
  struct l_struct_2E_regobj *llvm_cbe_minregionp_0_i__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp171_i;
  struct l_struct_2E_regobj *llvm_cbe_minregionp_1_reg2mem_1_i;
  struct l_struct_2E_regobj *llvm_cbe_minregionp_1_reg2mem_1_i__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_tmp23_i;
  unsigned int llvm_cbe_indvar_next239_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp23_reg2mem_1_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp23_reg2mem_1_i__PHI_TEMPORARY;
  struct l_struct_2E_regobj *llvm_cbe_tmp208_i;
  unsigned int llvm_cbe_tmp308;
  unsigned int llvm_cbe_tmp308__PHI_TEMPORARY;
  struct l_struct_2E_regobj **llvm_cbe_tmp40;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )24);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )24));
  if ((llvm_cbe_rstart == llvm_cbe_rfinish)) {
    goto llvm_cbe_cond_true;
  } else {
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_true:
  ltmp_123_2 =  /*tail*/ malloc(((unsigned long long )8ll));
  ltmp_124_9 = ((struct l_struct_2E_regobj **)ltmp_123_2);
  *llvm_cbe_wayar = ltmp_124_9;
  *ltmp_124_9 = llvm_cbe_rstart;
  *llvm_cbe_waylength = ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )1);
llvm_cbe_cond_next:
  *(&(regway.field6)) = ((unsigned char )0);
  *(&(regway.field7)) = llvm_cbe_rfinish;
  *(&(regway.field8)) = llvm_cbe_rstart;
  llvm_cbe_tmp11_i = *(&(regway.field5));
  llvm_cbe_tmp3_i_i = &llvm_cbe_tmp11_i->field5;
  llvm_cbe_tmp4_i_i = *llvm_cbe_tmp3_i_i;
  llvm_cbe_tmp5_i_i = llvm_cbe_tmp4_i_i + ((unsigned int )1);
  *llvm_cbe_tmp3_i_i = llvm_cbe_tmp5_i_i;
  if ((llvm_cbe_tmp5_i_i == ((unsigned int )1073741824))) {
    goto llvm_cbe_cond_true_i_i;
  } else {
    llvm_cbe_i_0_i_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb33_i_i;
  }

llvm_cbe_cond_true_i_i:
  *llvm_cbe_tmp3_i_i = ((unsigned int )1);
  llvm_cbe_tmp3751_i_i = *(&llvm_cbe_tmp11_i->field18.field4);
  if ((((signed int )llvm_cbe_tmp3751_i_i) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_i_0_reg2mem_0_i_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb_i_i;
  } else {
    goto llvm_cbe__ZN9regmngobj13getregfillnumEv_exit_i;
  }

llvm_cbe_bb_i_i:
  llvm_cbe_i_0_reg2mem_0_i_i = llvm_cbe_i_0_reg2mem_0_i_i__PHI_TEMPORARY;
  llvm_cbe_tmp22_i_i = *(&llvm_cbe_tmp11_i->field18.field0);
  llvm_cbe_tmp29_i_i = *(&llvm_cbe_tmp22_i_i[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i_i)))]);
  *(&llvm_cbe_tmp29_i_i->field7) = ((unsigned int )0);
  llvm_cbe_tmp32_i_i = llvm_cbe_i_0_reg2mem_0_i_i + ((unsigned int )1);
  llvm_cbe_i_0_i_i__PHI_TEMPORARY = llvm_cbe_tmp32_i_i;   /* for PHI node */
  goto llvm_cbe_bb33_i_i;

llvm_cbe_bb33_i_i:
  llvm_cbe_i_0_i_i = llvm_cbe_i_0_i_i__PHI_TEMPORARY;
  llvm_cbe_tmp37_i_i = *(&llvm_cbe_tmp11_i->field18.field4);
  if ((((signed int )llvm_cbe_tmp37_i_i) > ((signed int )llvm_cbe_i_0_i_i))) {
    llvm_cbe_i_0_reg2mem_0_i_i__PHI_TEMPORARY = llvm_cbe_i_0_i_i;   /* for PHI node */
    goto llvm_cbe_bb_i_i;
  } else {
    goto llvm_cbe__ZN9regmngobj13getregfillnumEv_exit_i;
  }

llvm_cbe__ZN9regmngobj13getregfillnumEv_exit_i:
  llvm_cbe_tmp45_i_i = *llvm_cbe_tmp3_i_i;
  *(&(regway.field4)) = llvm_cbe_tmp45_i_i;
  *(&llvm_cbe_rstart->field7) = llvm_cbe_tmp45_i_i;
  *(&llvm_cbe_rstart->field8) = ((unsigned int )0);
  *(&(regway.field1.field1)) = ((unsigned int )0);
  llvm_cbe_tmp35_i = *(&(regway.field1.field2));
  if ((llvm_cbe_tmp35_i == ((unsigned int )0))) {
    goto llvm_cbe_cond_true_i;
  } else {
    goto llvm_cbe_cond_next81_i;
  }

llvm_cbe_cond_true_i:
  llvm_cbe_tmp44_i = llvm_cbe_tmp35_i << ((unsigned int )1);
  ltmp_125_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp44_i)) * ((unsigned long long )8ll)));
  ltmp_126_9 = ((struct l_struct_2E_regobj **)ltmp_125_2);
  llvm_cbe_tmp66_i = *(&(regway.field1.field0));
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )24);
  ltmp_127_2 = memcpy((((unsigned char *)ltmp_126_9)), (((unsigned char *)llvm_cbe_tmp66_i)), ((((signed long long )(signed int )llvm_cbe_tmp35_i)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp72_i = *(&(regway.field1.field0));
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp72_i)));
  *(&(regway.field1.field0)) = ltmp_126_9;
  *(&(regway.field1.field2)) = llvm_cbe_tmp44_i;
  goto llvm_cbe_cond_next81_i;

llvm_cbe_cond_next81_i:
  llvm_cbe_tmp84_i = *(&(regway.field1.field0));
  llvm_cbe_tmp87_i = *(&(regway.field1.field1));
  *(&llvm_cbe_tmp84_i[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp87_i)))]) = llvm_cbe_rstart;
  llvm_cbe_tmp94_i = *(&(regway.field1.field1));
  *(&(regway.field1.field1)) = (llvm_cbe_tmp94_i + ((unsigned int )1));
  *(&(regway.field3)) = ((unsigned int )1);
  llvm_cbe_tmp6_i_rle9__PHI_TEMPORARY = ((unsigned int )1);   /* for PHI node */
  llvm_cbe_flodd_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
  goto llvm_cbe_cond_next139_i;

  do {     /* Syntactic loop 'cond_next139.i' to make GCC happy */
llvm_cbe_cond_next139_i:
  llvm_cbe_tmp6_i_rle9 = llvm_cbe_tmp6_i_rle9__PHI_TEMPORARY;
  llvm_cbe_flodd_0_reg2mem_0_i = llvm_cbe_flodd_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )123);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )123));
  llvm_cbe_tmp142_i = *(&(regway.field6));
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp142_i == ((unsigned char )0))) {
    goto llvm_cbe_bb100_i;
  } else {
    llvm_cbe_tmp6_i_rle__PHI_TEMPORARY = llvm_cbe_tmp6_i_rle9;   /* for PHI node */
    goto llvm_cbe__ZN9regwayobj4fillEP6regobjS1__exit;
  }

llvm_cbe_cond_next125_i:
  llvm_cbe_newflodd_0_i = llvm_cbe_newflodd_0_i__PHI_TEMPORARY;
  llvm_cbe_boundl_0_in_i = llvm_cbe_boundl_0_in_i__PHI_TEMPORARY;
  llvm_cbe_boundl_0_i = *llvm_cbe_boundl_0_in_i;
  llvm_cbe_tmp129_i = *(&(regway.field3));
  llvm_cbe_tmp130_i = llvm_cbe_tmp129_i + ((unsigned int )1);
  *(&(regway.field3)) = llvm_cbe_tmp130_i;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_boundl_0_i == ((unsigned int )0))) {
    llvm_cbe_tmp6_i_rle__PHI_TEMPORARY = llvm_cbe_tmp130_i;   /* for PHI node */
    goto llvm_cbe__ZN9regwayobj4fillEP6regobjS1__exit;
  } else {
    llvm_cbe_tmp6_i_rle9__PHI_TEMPORARY = llvm_cbe_tmp130_i;   /* for PHI node */
    llvm_cbe_flodd_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_newflodd_0_i;   /* for PHI node */
    goto llvm_cbe_cond_next139_i;
  }

llvm_cbe_cond_true106_i:
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )123);
   /*tail*/ _ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_((&(regway.field1)), (&(regway.field2)));
  llvm_cbe_newflodd_0_i__PHI_TEMPORARY = ((unsigned char )1);   /* for PHI node */
  llvm_cbe_boundl_0_in_i__PHI_TEMPORARY = (&(regway.field2.field1));   /* for PHI node */
  goto llvm_cbe_cond_next125_i;

llvm_cbe_bb100_i:
  if ((llvm_cbe_flodd_0_reg2mem_0_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_true106_i;
  } else {
    goto llvm_cbe_cond_false_i;
  }

llvm_cbe_cond_false_i:
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )123);
   /*tail*/ _ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_((&(regway.field2)), (&(regway.field1)));
  llvm_cbe_newflodd_0_i__PHI_TEMPORARY = ((unsigned char )0);   /* for PHI node */
  llvm_cbe_boundl_0_in_i__PHI_TEMPORARY = (&(regway.field1.field1));   /* for PHI node */
  goto llvm_cbe_cond_next125_i;

  } while (1); /* end of syntactic loop 'cond_next139.i' */
llvm_cbe__ZN9regwayobj4fillEP6regobjS1__exit:
  llvm_cbe_tmp6_i_rle = llvm_cbe_tmp6_i_rle__PHI_TEMPORARY;
  llvm_cbe_tmp150_i = *(&(regway.field6));
  if ((llvm_cbe_tmp150_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_true22;
  } else {
    goto llvm_cbe_cond_next26;
  }

llvm_cbe_cond_true22:
  *llvm_cbe_wayar = ((struct l_struct_2E_regobj **)/*NULL*/0);
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
llvm_cbe_cond_next26:
  ltmp_128_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp6_i_rle)) * ((unsigned long long )8ll)));
  ltmp_129_9 = ((struct l_struct_2E_regobj **)ltmp_128_2);
  *llvm_cbe_wayar = ltmp_129_9;
  llvm_cbe_tmp16_i = llvm_cbe_tmp6_i_rle + ((unsigned int )-1);
  *(&ltmp_129_9[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp16_i)))]) = llvm_cbe_rfinish;
  if ((((signed int )llvm_cbe_tmp16_i) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_preheader_i;
  } else {
    llvm_cbe_tmp23_reg2mem_1_i__PHI_TEMPORARY = ltmp_129_9;   /* for PHI node */
    goto llvm_cbe_bb203_i;
  }

llvm_cbe_bb_preheader_i:
  llvm_cbe_tmp79_i = &llvm_cbe_rfinish->field5.field0;
  llvm_cbe_tmp95_i1 = &llvm_cbe_rfinish->field5.field1;
  llvm_cbe_tmp190_rle245_i__PHI_TEMPORARY = ltmp_129_9;   /* for PHI node */
  llvm_cbe_indvar_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_tmp23_reg2mem_0_i__PHI_TEMPORARY = ltmp_129_9;   /* for PHI node */
  goto llvm_cbe_bb_i;

  do {     /* Syntactic loop 'bb.i' to make GCC happy */
llvm_cbe_bb_i:
  llvm_cbe_tmp190_rle245_i = llvm_cbe_tmp190_rle245_i__PHI_TEMPORARY;
  llvm_cbe_indvar_i = llvm_cbe_indvar_i__PHI_TEMPORARY;
  llvm_cbe_tmp23_reg2mem_0_i = llvm_cbe_tmp23_reg2mem_0_i__PHI_TEMPORARY;
  *(&cg_caller_id_var) = ((unsigned int )124);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )124));
  llvm_cbe_i_0_reg2mem_0_i = llvm_cbe_tmp16_i - llvm_cbe_indvar_i;
  llvm_cbe_i_0_in_reg2mem_0_i = llvm_cbe_tmp6_i_rle - llvm_cbe_indvar_i;
  llvm_cbe_tmp27_i = *(&llvm_cbe_tmp23_reg2mem_0_i[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0_i)))]);
  llvm_cbe_tmp176236_i = *(&llvm_cbe_tmp27_i->field9.field1);
  if ((((signed int )llvm_cbe_tmp176236_i) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb28_preheader_i;
  } else {
    llvm_cbe_minregionp_1_reg2mem_1_i__PHI_TEMPORARY = ((struct l_struct_2E_regobj *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_bb181_i;
  }

llvm_cbe_cond_next188_i:
  *(&llvm_cbe_tmp190_rle245_i[((signed long long )(((signed long long )(signed int )(llvm_cbe_i_0_in_reg2mem_0_i + ((unsigned int )-2)))))]) = llvm_cbe_minregionp_1_reg2mem_1_i;
  llvm_cbe_tmp23_i = *llvm_cbe_wayar;
  llvm_cbe_indvar_next239_i = llvm_cbe_indvar_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )(llvm_cbe_i_0_reg2mem_0_i + ((unsigned int )-1))) > ((signed int )((unsigned int )0)))) {
    llvm_cbe_tmp190_rle245_i__PHI_TEMPORARY = llvm_cbe_tmp23_i;   /* for PHI node */
    llvm_cbe_indvar_i__PHI_TEMPORARY = llvm_cbe_indvar_next239_i;   /* for PHI node */
    llvm_cbe_tmp23_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp23_i;   /* for PHI node */
    goto llvm_cbe_bb_i;
  } else {
    llvm_cbe_tmp23_reg2mem_1_i__PHI_TEMPORARY = llvm_cbe_tmp23_i;   /* for PHI node */
    goto llvm_cbe_bb203_i;
  }

llvm_cbe_bb181_i:
  llvm_cbe_minregionp_1_reg2mem_1_i = llvm_cbe_minregionp_1_reg2mem_1_i__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_minregionp_1_reg2mem_1_i == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    llvm_cbe_tmp308__PHI_TEMPORARY = ((unsigned int )-1);   /* for PHI node */
    goto llvm_cbe__ZN9regwayobj6getwayEP6regobjRPS1__exit;
  } else {
    goto llvm_cbe_cond_next188_i;
  }

  do {     /* Syntactic loop 'bb28.i' to make GCC happy */
llvm_cbe_bb28_i:
  llvm_cbe_j_0_reg2mem_0_i = llvm_cbe_j_0_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_minregionp_1_reg2mem_0_i = llvm_cbe_minregionp_1_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_mindist2_1_reg2mem_0_i = llvm_cbe_mindist2_1_reg2mem_0_i__PHI_TEMPORARY;
  llvm_cbe_val33 = *(&cg_caller_id_var);
  llvm_cbe_val44 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )125);
  CallEdgeProfiler(llvm_cbe_val33, llvm_cbe_val44, ((unsigned int )125));
  llvm_cbe_tmp43_i = *(&llvm_cbe_tmp36_i3[((signed long long )(((signed long long )(signed int )llvm_cbe_j_0_reg2mem_0_i)))]);
  llvm_cbe_tmp46_i = *(&llvm_cbe_tmp43_i->field7);
  if ((llvm_cbe_tmp46_i == llvm_cbe_tmp49_i)) {
    goto llvm_cbe_cond_true_i4;
  } else {
    llvm_cbe_mindist2_0_i__PHI_TEMPORARY = llvm_cbe_mindist2_1_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_minregionp_0_i__PHI_TEMPORARY = llvm_cbe_minregionp_1_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_bb172_i;
  }

llvm_cbe_bb172_i:
  llvm_cbe_mindist2_0_i = llvm_cbe_mindist2_0_i__PHI_TEMPORARY;
  llvm_cbe_minregionp_0_i = llvm_cbe_minregionp_0_i__PHI_TEMPORARY;
  llvm_cbe_tmp171_i = llvm_cbe_j_0_reg2mem_0_i + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val44;
  *(&cg_caller_id_var) = llvm_cbe_val33;
  if ((((signed int )llvm_cbe_tmp176236_i) > ((signed int )llvm_cbe_tmp171_i))) {
    llvm_cbe_j_0_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_tmp171_i;   /* for PHI node */
    llvm_cbe_minregionp_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_minregionp_0_i;   /* for PHI node */
    llvm_cbe_mindist2_1_reg2mem_0_i__PHI_TEMPORARY = llvm_cbe_mindist2_0_i;   /* for PHI node */
    goto llvm_cbe_bb28_i;
  } else {
    llvm_cbe_minregionp_1_reg2mem_1_i__PHI_TEMPORARY = llvm_cbe_minregionp_0_i;   /* for PHI node */
    goto llvm_cbe_bb181_i;
  }

llvm_cbe_cond_true_i4:
  llvm_cbe_tmp54_i = *(&llvm_cbe_tmp43_i->field8);
  if ((llvm_cbe_tmp54_i == llvm_cbe_tmp56_i)) {
    goto llvm_cbe_cond_true60_i;
  } else {
    llvm_cbe_mindist2_0_i__PHI_TEMPORARY = llvm_cbe_mindist2_1_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_minregionp_0_i__PHI_TEMPORARY = llvm_cbe_minregionp_1_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_bb172_i;
  }

llvm_cbe_cond_true60_i:
  llvm_cbe_tmp75_i = *(&llvm_cbe_tmp43_i->field5.field0);
  llvm_cbe_tmp80_i = *llvm_cbe_tmp79_i;
  llvm_cbe_tmp8182_i = ((float )(signed int )(llvm_cbe_tmp75_i - llvm_cbe_tmp80_i));
  llvm_cbe_tmp92_i = *(&llvm_cbe_tmp43_i->field5.field1);
  llvm_cbe_tmp96_i = *llvm_cbe_tmp95_i1;
  llvm_cbe_tmp9798_i = ((float )(signed int )(llvm_cbe_tmp92_i - llvm_cbe_tmp96_i));
  llvm_cbe_tmp108_i = ((float )((((float )(llvm_cbe_tmp8182_i * llvm_cbe_tmp8182_i))) + (((float )(llvm_cbe_tmp9798_i * llvm_cbe_tmp9798_i)))));
  if ((llvm_cbe_minregionp_1_reg2mem_0_i == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    llvm_cbe_mindist2_0_i__PHI_TEMPORARY = llvm_cbe_tmp108_i;   /* for PHI node */
    llvm_cbe_minregionp_0_i__PHI_TEMPORARY = llvm_cbe_tmp43_i;   /* for PHI node */
    goto llvm_cbe_bb172_i;
  } else {
    goto llvm_cbe_cond_false_i7;
  }

llvm_cbe_cond_false_i7:
  if ((llvm_fcmp_olt(llvm_cbe_tmp108_i, llvm_cbe_mindist2_1_reg2mem_0_i))) {
    goto llvm_cbe_cond_true164_i;
  } else {
    llvm_cbe_mindist2_0_i__PHI_TEMPORARY = llvm_cbe_mindist2_1_reg2mem_0_i;   /* for PHI node */
    llvm_cbe_minregionp_0_i__PHI_TEMPORARY = llvm_cbe_minregionp_1_reg2mem_0_i;   /* for PHI node */
    goto llvm_cbe_bb172_i;
  }

llvm_cbe_cond_true164_i:
  llvm_cbe_mindist2_0_i__PHI_TEMPORARY = llvm_cbe_tmp108_i;   /* for PHI node */
  llvm_cbe_minregionp_0_i__PHI_TEMPORARY = llvm_cbe_tmp43_i;   /* for PHI node */
  goto llvm_cbe_bb172_i;

  } while (1); /* end of syntactic loop 'bb28.i' */
llvm_cbe_bb28_preheader_i:
  llvm_cbe_tmp36_i3 = *(&llvm_cbe_tmp27_i->field9.field0);
  llvm_cbe_tmp49_i = *(&(regway.field4));
  llvm_cbe_tmp56_i = llvm_cbe_i_0_in_reg2mem_0_i + ((unsigned int )-2);
  llvm_cbe_j_0_reg2mem_0_i__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_minregionp_1_reg2mem_0_i__PHI_TEMPORARY = ((struct l_struct_2E_regobj *)/*NULL*/0);   /* for PHI node */
  llvm_cbe_mindist2_1_reg2mem_0_i__PHI_TEMPORARY = 0x1.2a05f2p+33;   /* for PHI node */
  goto llvm_cbe_bb28_i;

  } while (1); /* end of syntactic loop 'bb.i' */
llvm_cbe_bb203_i:
  llvm_cbe_tmp23_reg2mem_1_i = llvm_cbe_tmp23_reg2mem_1_i__PHI_TEMPORARY;
  llvm_cbe_tmp208_i = *(&(regway.field8));
  *llvm_cbe_tmp23_reg2mem_1_i = llvm_cbe_tmp208_i;
  llvm_cbe_tmp308__PHI_TEMPORARY = llvm_cbe_tmp6_i_rle;   /* for PHI node */
  goto llvm_cbe__ZN9regwayobj6getwayEP6regobjRPS1__exit;

llvm_cbe__ZN9regwayobj6getwayEP6regobjRPS1__exit:
  llvm_cbe_tmp308 = llvm_cbe_tmp308__PHI_TEMPORARY;
  *llvm_cbe_waylength = llvm_cbe_tmp308;
  if ((llvm_cbe_tmp308 == ((unsigned int )-1))) {
    goto llvm_cbe_cond_true38;
  } else {
    goto llvm_cbe_UnifiedReturnBlock;
  }

llvm_cbe_cond_true38:
  llvm_cbe_tmp40 = *llvm_cbe_wayar;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp40)));
  *llvm_cbe_wayar = ((struct l_struct_2E_regobj **)/*NULL*/0);
  *llvm_cbe_waylength = ((unsigned int )0);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )0);
llvm_cbe_UnifiedReturnBlock:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return ((unsigned char )1);
}


static void _ZN9regwayobj7destroyEv(struct l_struct_2E_regwayobj *llvm_cbe_this) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  struct l_struct_2E_regobj **llvm_cbe_tmp5;
  struct l_struct_2E_regobj **llvm_cbe_tmp13;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )25);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )25));
  llvm_cbe_tmp5 = *(&llvm_cbe_this->field1.field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp5)));
  llvm_cbe_tmp13 = *(&llvm_cbe_this->field2.field0);
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp13)));
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static void _ZN6regobj10makebound2ER9flexarrayI6pointtES3_(struct l_struct_2E_regobj *llvm_cbe_this, struct l_struct_2E_boundart *llvm_cbe_b1arp, struct l_struct_2E_boundart *llvm_cbe_b2arp) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int *llvm_cbe_tmp8;
  unsigned int *llvm_cbe_tmp178190;
  unsigned int llvm_cbe_tmp179191;
  struct l_struct_2E_pointt **llvm_cbe_tmp14;
  struct l_struct_2E_regmngobj **llvm_cbe_tmp86;
  unsigned int *llvm_cbe_tmp43_i;
  unsigned int *llvm_cbe_tmp56_i;
  unsigned int *llvm_cbe_tmp102_i;
  struct l_struct_2E_pointt **llvm_cbe_tmp136_i;
  unsigned int *llvm_cbe_tmp206_i;
  unsigned int llvm_cbe_j_0_reg2mem_0;
  unsigned int llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_pointt *llvm_cbe_tmp15;
  unsigned long long llvm_cbe_tmp1617;
  unsigned int llvm_cbe_tmp23;
  unsigned int llvm_cbe_tmp24;
  unsigned int llvm_cbe_tmp40;
  unsigned int llvm_cbe_tmp41;
  unsigned int llvm_cbe_tmp58;
  unsigned int llvm_cbe_tmp75;
  unsigned int llvm_cbe_x1_0;
  unsigned int llvm_cbe_y1_0;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp87;
  unsigned int llvm_cbe_tmp89;
  unsigned int llvm_cbe_x2_0;
  unsigned int llvm_cbe_tmp105;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph;
  unsigned int llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  unsigned int llvm_cbe_indvar;
  unsigned int llvm_cbe_indvar__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  unsigned int llvm_cbe_x_0201;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp123;
  struct l_struct_2E_regobj **llvm_cbe_tmp132;
  unsigned int llvm_cbe_tmp135;
  unsigned long long llvm_cbe_tmp139140;
  struct l_struct_2E_regobj *llvm_cbe_tmp145;
  unsigned char *llvm_cbe_tmp20_i;
  unsigned char llvm_cbe_tmp30_i;
  unsigned char llvm_cbe_tmp39_i;
  unsigned int llvm_cbe_tmp44_i;
  unsigned int llvm_cbe_tmp46_i;
  unsigned int llvm_cbe_tmp57_i;
  unsigned int llvm_cbe_tmp59_i;
  unsigned int llvm_cbe_tmp82_i;
  unsigned int llvm_cbe_tmp100_i;
  unsigned int llvm_cbe_tmp103_i;
  unsigned int llvm_cbe_tmp114_i;
  unsigned char *ltmp_130_2;
  struct l_struct_2E_pointt *ltmp_131_5;
  struct l_struct_2E_pointt *llvm_cbe_tmp137_i;
  unsigned char *ltmp_132_2;
  struct l_struct_2E_pointt *llvm_cbe_tmp143_i;
  struct l_struct_2E_pointt *llvm_cbe_tmp155_i;
  unsigned int llvm_cbe_tmp158_i;
  unsigned long long llvm_cbe_tmp158166_i;
  unsigned int llvm_cbe_tmp176_i;
  struct l_struct_2E_regmngobj *llvm_cbe_tmp182_i;
  struct l_struct_2E_regobj **llvm_cbe_tmp191_i;
  unsigned int llvm_cbe_tmp194_i;
  unsigned int llvm_cbe_tmp207_i;
  unsigned int llvm_cbe_indvar_next;
  unsigned int llvm_cbe_tmp166;
  unsigned int llvm_cbe_y2_0;
  unsigned int llvm_cbe_y2_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_y_0;
  unsigned int llvm_cbe_y_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp175;
  unsigned int llvm_cbe_tmp179;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )26);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )26));
  llvm_cbe_tmp8 = &llvm_cbe_b2arp->field1;
  *llvm_cbe_tmp8 = ((unsigned int )0);
  llvm_cbe_tmp178190 = &llvm_cbe_b1arp->field1;
  llvm_cbe_tmp179191 = *llvm_cbe_tmp178190;
  if ((((signed int )llvm_cbe_tmp179191) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_preheader;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp14 = &llvm_cbe_b1arp->field0;
  llvm_cbe_tmp86 = &llvm_cbe_this->field3;
  llvm_cbe_tmp43_i = &llvm_cbe_this->field5.field0;
  llvm_cbe_tmp56_i = &llvm_cbe_this->field5.field1;
  llvm_cbe_tmp102_i = &llvm_cbe_b2arp->field2;
  llvm_cbe_tmp136_i = &llvm_cbe_b2arp->field0;
  llvm_cbe_tmp206_i = &llvm_cbe_this->field4;
  llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_j_0_reg2mem_0 = llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )126);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )126));
  llvm_cbe_tmp15 = *llvm_cbe_tmp14;
  llvm_cbe_tmp1617 = ((signed long long )(signed int )llvm_cbe_j_0_reg2mem_0);
  llvm_cbe_tmp23 = *(&llvm_cbe_tmp15[((signed long long )llvm_cbe_tmp1617)].field0);
  llvm_cbe_tmp24 = llvm_cbe_tmp23 + ((unsigned int )-1);
  llvm_cbe_tmp40 = *(&llvm_cbe_tmp15[((signed long long )llvm_cbe_tmp1617)].field1);
  llvm_cbe_tmp41 = llvm_cbe_tmp40 + ((unsigned int )-1);
  llvm_cbe_tmp58 = llvm_cbe_tmp23 + ((unsigned int )1);
  llvm_cbe_tmp75 = llvm_cbe_tmp40 + ((unsigned int )1);
  llvm_cbe_x1_0 = (((((signed int )llvm_cbe_tmp24) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp24));
  llvm_cbe_y1_0 = (((((signed int )llvm_cbe_tmp41) < ((signed int )((unsigned int )0)))) ? (((unsigned int )0)) : (llvm_cbe_tmp41));
  llvm_cbe_tmp87 = *llvm_cbe_tmp86;
  llvm_cbe_tmp89 = *(&llvm_cbe_tmp87->field12);
  llvm_cbe_x2_0 = (((((signed int )llvm_cbe_tmp89) < ((signed int )llvm_cbe_tmp58))) ? (llvm_cbe_tmp89) : (llvm_cbe_tmp58));
  llvm_cbe_tmp105 = *(&llvm_cbe_tmp87->field13);
  if ((((signed int )llvm_cbe_tmp105) < ((signed int )llvm_cbe_tmp75))) {
    goto llvm_cbe_cond_true110;
  } else {
    llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_tmp75;   /* for PHI node */
    llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb167;
  }

llvm_cbe_bb176:
  llvm_cbe_tmp175 = llvm_cbe_j_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp179 = *llvm_cbe_tmp178190;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp179) > ((signed int )llvm_cbe_tmp175))) {
    llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp175;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_cond_true110:
  if ((((signed int )llvm_cbe_y1_0) > ((signed int )llvm_cbe_tmp105))) {
    goto llvm_cbe_bb176;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_tmp105;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y1_0;   /* for PHI node */
    goto llvm_cbe_bb158_preheader;
  }

llvm_cbe_bb167:
  llvm_cbe_y2_0 = llvm_cbe_y2_0__PHI_TEMPORARY;
  llvm_cbe_y_0 = llvm_cbe_y_0__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_y_0) > ((signed int )llvm_cbe_y2_0))) {
    goto llvm_cbe_bb176;
  } else {
    llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y2_0;   /* for PHI node */
    llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY = llvm_cbe_y_0;   /* for PHI node */
    goto llvm_cbe_bb158_preheader;
  }

llvm_cbe_bb164:
  llvm_cbe_tmp166 = llvm_cbe_y_0_reg2mem_0_ph + ((unsigned int )1);
  llvm_cbe_y2_0__PHI_TEMPORARY = llvm_cbe_y2_0_reg2mem_0_ph;   /* for PHI node */
  llvm_cbe_y_0__PHI_TEMPORARY = llvm_cbe_tmp166;   /* for PHI node */
  goto llvm_cbe_bb167;

llvm_cbe_bb158_preheader:
  llvm_cbe_y2_0_reg2mem_0_ph = llvm_cbe_y2_0_reg2mem_0_ph__PHI_TEMPORARY;
  llvm_cbe_y_0_reg2mem_0_ph = llvm_cbe_y_0_reg2mem_0_ph__PHI_TEMPORARY;
  if ((((signed int )llvm_cbe_x1_0) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb164;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_bb120;
  }

  do {     /* Syntactic loop 'bb120' to make GCC happy */
llvm_cbe_bb120:
  llvm_cbe_indvar = llvm_cbe_indvar__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )127);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )127));
  llvm_cbe_x_0201 = llvm_cbe_indvar + llvm_cbe_x1_0;
  llvm_cbe_tmp123 = *llvm_cbe_tmp86;
  llvm_cbe_tmp132 = *(&llvm_cbe_tmp123->field6);
  llvm_cbe_tmp135 = *(&llvm_cbe_tmp123->field16);
  llvm_cbe_tmp139140 = ((signed long long )(signed int )((llvm_cbe_tmp135 * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0201));
  llvm_cbe_tmp145 = *(&llvm_cbe_tmp132[((signed long long )llvm_cbe_tmp139140)]);
  if ((llvm_cbe_tmp145 == ((struct l_struct_2E_regobj *)/*NULL*/0))) {
    goto llvm_cbe_cond_true150;
  } else {
    goto llvm_cbe_cond_next155;
  }

llvm_cbe_cond_next155:
  llvm_cbe_indvar_next = llvm_cbe_indvar + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )(llvm_cbe_x_0201 + ((unsigned int )1))) > ((signed int )llvm_cbe_x2_0))) {
    goto llvm_cbe_bb164;
  } else {
    llvm_cbe_indvar__PHI_TEMPORARY = llvm_cbe_indvar_next;   /* for PHI node */
    goto llvm_cbe_bb120;
  }

llvm_cbe_cond_true150:
  llvm_cbe_tmp20_i = *(&llvm_cbe_tmp123->field7);
  llvm_cbe_tmp30_i = *(&llvm_cbe_tmp20_i[((signed long long )llvm_cbe_tmp139140)]);
  llvm_cbe_tmp39_i = *(&llvm_cbe_tmp123->field8[((signed long long )(((unsigned long long )(unsigned char )llvm_cbe_tmp30_i)))]);
  if ((llvm_cbe_tmp39_i == ((unsigned char )0))) {
    goto llvm_cbe_cond_next155;
  } else {
    goto llvm_cbe_cond_true_i;
  }

llvm_cbe_cond_true_i:
  llvm_cbe_tmp44_i = *llvm_cbe_tmp43_i;
  llvm_cbe_tmp46_i = llvm_cbe_x_0201 - llvm_cbe_tmp44_i;
  llvm_cbe_tmp57_i = *llvm_cbe_tmp56_i;
  llvm_cbe_tmp59_i = llvm_cbe_y_0_reg2mem_0_ph - llvm_cbe_tmp57_i;
  llvm_cbe_tmp82_i = *(&llvm_cbe_tmp123->field10);
  if ((((signed int )(((signed int )(((float )((((float )(signed int )((llvm_cbe_tmp59_i * llvm_cbe_tmp59_i) + (llvm_cbe_tmp46_i * llvm_cbe_tmp46_i)))) + 0x1p-1)))))) > ((signed int )llvm_cbe_tmp82_i))) {
    goto llvm_cbe_cond_next155;
  } else {
    goto llvm_cbe_cond_true88_i;
  }

llvm_cbe_cond_next152_i:
  llvm_cbe_tmp155_i = *llvm_cbe_tmp136_i;
  llvm_cbe_tmp158_i = *llvm_cbe_tmp8;
  llvm_cbe_tmp158166_i = ((signed long long )(signed int )llvm_cbe_tmp158_i);
  *(&llvm_cbe_tmp155_i[((signed long long )llvm_cbe_tmp158166_i)].field0) = llvm_cbe_x_0201;
  *(&llvm_cbe_tmp155_i[((signed long long )llvm_cbe_tmp158166_i)].field1) = llvm_cbe_y_0_reg2mem_0_ph;
  llvm_cbe_tmp176_i = *llvm_cbe_tmp8;
  *llvm_cbe_tmp8 = (llvm_cbe_tmp176_i + ((unsigned int )1));
  llvm_cbe_tmp182_i = *llvm_cbe_tmp86;
  llvm_cbe_tmp191_i = *(&llvm_cbe_tmp182_i->field6);
  llvm_cbe_tmp194_i = *(&llvm_cbe_tmp182_i->field16);
  *(&llvm_cbe_tmp191_i[((signed long long )(((signed long long )(signed int )((llvm_cbe_tmp194_i * llvm_cbe_y_0_reg2mem_0_ph) + llvm_cbe_x_0201))))]) = llvm_cbe_this;
  llvm_cbe_tmp207_i = *llvm_cbe_tmp206_i;
  *llvm_cbe_tmp206_i = (llvm_cbe_tmp207_i + ((unsigned int )1));
  goto llvm_cbe_cond_next155;

llvm_cbe_cond_true88_i:
  llvm_cbe_tmp100_i = *llvm_cbe_tmp8;
  llvm_cbe_tmp103_i = *llvm_cbe_tmp102_i;
  if ((llvm_cbe_tmp100_i == llvm_cbe_tmp103_i)) {
    goto llvm_cbe_cond_true107_i;
  } else {
    goto llvm_cbe_cond_next152_i;
  }

llvm_cbe_cond_true107_i:
  llvm_cbe_tmp114_i = llvm_cbe_tmp103_i << ((unsigned int )1);
  ltmp_130_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp114_i)) * ((unsigned long long )8ll)));
  ltmp_131_5 = ((struct l_struct_2E_pointt *)ltmp_130_2);
  llvm_cbe_tmp137_i = *llvm_cbe_tmp136_i;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )127);
  ltmp_132_2 = memcpy((((unsigned char *)ltmp_131_5)), (((unsigned char *)llvm_cbe_tmp137_i)), ((((signed long long )(signed int )llvm_cbe_tmp103_i)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp143_i = *llvm_cbe_tmp136_i;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp143_i)));
  *llvm_cbe_tmp136_i = ltmp_131_5;
  *llvm_cbe_tmp102_i = llvm_cbe_tmp114_i;
  goto llvm_cbe_cond_next152_i;

  } while (1); /* end of syntactic loop 'bb120' */
  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static unsigned char _ZN9regwayobj12isaddtoboundEP6regobjS1_(struct l_struct_2E_regwayobj *llvm_cbe_this, struct l_struct_2E_regobj *llvm_cbe_initialregionp, struct l_struct_2E_regobj *llvm_cbe_regionp) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp3;
  unsigned int llvm_cbe_tmp6;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )27);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )27));
  llvm_cbe_tmp3 = *(&llvm_cbe_regionp->field7);
  llvm_cbe_tmp6 = *(&llvm_cbe_this->field4);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return (((unsigned char )(bool )(llvm_cbe_tmp3 != llvm_cbe_tmp6)));
}


static void _ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_(struct l_struct_2E_flexarray_3C_regobj_2A__3E_ *llvm_cbe_b1arp, struct l_struct_2E_flexarray_3C_regobj_2A__3E_ *llvm_cbe_b2arp) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int *llvm_cbe_tmp5;
  unsigned int *llvm_cbe_tmp163173;
  unsigned int llvm_cbe_tmp164174;
  struct l_struct_2E_regobj ***llvm_cbe_tmp11;
  unsigned int *llvm_cbe_tmp78;
  struct l_struct_2E_regobj ***llvm_cbe_tmp112;
  unsigned int llvm_cbe_j_0_reg2mem_0;
  unsigned int llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  struct l_struct_2E_regobj **llvm_cbe_tmp12;
  struct l_struct_2E_regobj *llvm_cbe_tmp19;
  unsigned int *llvm_cbe_tmp152179;
  unsigned int llvm_cbe_tmp153180;
  struct l_struct_2E_regobj ***llvm_cbe_tmp28;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val31;
  unsigned int llvm_cbe_val42;
  struct l_struct_2E_regobj **llvm_cbe_tmp29;
  struct l_struct_2E_regobj *llvm_cbe_tmp36;
  unsigned int  (**llvm_cbe_tmp39) ();
  unsigned int  (*llvm_cbe_tmp41) ();
  unsigned char llvm_cbe_tmp46;
  unsigned int llvm_cbe_tmp55;
  unsigned int llvm_cbe_tmp60;
  struct l_struct_2E_regobj *llvm_cbe_tmp64;
  unsigned int llvm_cbe_tmp76;
  unsigned int llvm_cbe_tmp79;
  unsigned int llvm_cbe_tmp90;
  unsigned char *ltmp_133_2;
  struct l_struct_2E_regobj **ltmp_134_9;
  struct l_struct_2E_regobj **llvm_cbe_tmp113;
  unsigned char *ltmp_135_2;
  struct l_struct_2E_regobj **llvm_cbe_tmp120;
  struct l_struct_2E_regobj **llvm_cbe_tmp132;
  unsigned int llvm_cbe_tmp135;
  unsigned int llvm_cbe_tmp142;
  unsigned int llvm_cbe_tmp148;
  unsigned int llvm_cbe_tmp153;
  unsigned int llvm_cbe_tmp160;
  unsigned int llvm_cbe_tmp164;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )28);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )28));
  llvm_cbe_tmp5 = &llvm_cbe_b2arp->field1;
  *llvm_cbe_tmp5 = ((unsigned int )0);
  llvm_cbe_tmp163173 = &llvm_cbe_b1arp->field1;
  llvm_cbe_tmp164174 = *llvm_cbe_tmp163173;
  if ((((signed int )llvm_cbe_tmp164174) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_preheader;
  } else {
    goto llvm_cbe_return;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp11 = &llvm_cbe_b1arp->field0;
  llvm_cbe_tmp78 = &llvm_cbe_b2arp->field2;
  llvm_cbe_tmp112 = &llvm_cbe_b2arp->field0;
  llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_j_0_reg2mem_0 = llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )128);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )128));
  llvm_cbe_tmp12 = *llvm_cbe_tmp11;
  llvm_cbe_tmp19 = *(&llvm_cbe_tmp12[((signed long long )(((signed long long )(signed int )llvm_cbe_j_0_reg2mem_0)))]);
  llvm_cbe_tmp152179 = &llvm_cbe_tmp19->field9.field1;
  llvm_cbe_tmp153180 = *llvm_cbe_tmp152179;
  if ((((signed int )llvm_cbe_tmp153180) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb20_preheader;
  } else {
    goto llvm_cbe_bb161;
  }

llvm_cbe_bb161:
  llvm_cbe_tmp160 = llvm_cbe_j_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp164 = *llvm_cbe_tmp163173;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp164) > ((signed int )llvm_cbe_tmp160))) {
    llvm_cbe_j_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp160;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    goto llvm_cbe_return;
  }

  do {     /* Syntactic loop 'bb20' to make GCC happy */
llvm_cbe_bb20:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val31 = *(&cg_caller_id_var);
  llvm_cbe_val42 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )129);
  CallEdgeProfiler(llvm_cbe_val31, llvm_cbe_val42, ((unsigned int )129));
  llvm_cbe_tmp29 = *llvm_cbe_tmp28;
  llvm_cbe_tmp36 = *(&llvm_cbe_tmp29[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0)))]);
  llvm_cbe_tmp39 = *(&(regway.field0));
  llvm_cbe_tmp41 = *llvm_cbe_tmp39;
  *(&cg_caller_call_site_var) = ((unsigned int )0);
  *(&cg_caller_id_var) = ((unsigned int )129);
  llvm_cbe_tmp46 =  /*tail*/ (((unsigned char  (*) (struct l_struct_2E_regwayobj *, struct l_struct_2E_regobj *, struct l_struct_2E_regobj *))llvm_cbe_tmp41))((&regway), llvm_cbe_tmp19, llvm_cbe_tmp36);
  if ((llvm_cbe_tmp46 == ((unsigned char )0))) {
    goto llvm_cbe_bb149;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_bb149:
  llvm_cbe_tmp148 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  llvm_cbe_tmp153 = *llvm_cbe_tmp152179;
  *(&cg_caller_call_site_var) = llvm_cbe_val42;
  *(&cg_caller_id_var) = llvm_cbe_val31;
  if ((((signed int )llvm_cbe_tmp153) > ((signed int )llvm_cbe_tmp148))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp148;   /* for PHI node */
    goto llvm_cbe_bb20;
  } else {
    goto llvm_cbe_bb161;
  }

llvm_cbe_cond_next129:
  llvm_cbe_tmp132 = *llvm_cbe_tmp112;
  llvm_cbe_tmp135 = *llvm_cbe_tmp5;
  *(&llvm_cbe_tmp132[((signed long long )(((signed long long )(signed int )llvm_cbe_tmp135)))]) = llvm_cbe_tmp36;
  llvm_cbe_tmp142 = *llvm_cbe_tmp5;
  *llvm_cbe_tmp5 = (llvm_cbe_tmp142 + ((unsigned int )1));
  goto llvm_cbe_bb149;

llvm_cbe_cond_next:
  llvm_cbe_tmp76 = *llvm_cbe_tmp5;
  llvm_cbe_tmp79 = *llvm_cbe_tmp78;
  if ((llvm_cbe_tmp76 == llvm_cbe_tmp79)) {
    goto llvm_cbe_cond_true83;
  } else {
    goto llvm_cbe_cond_next129;
  }

llvm_cbe_cond_true:
  llvm_cbe_tmp55 = *(&(regway.field4));
  *(&llvm_cbe_tmp36->field7) = llvm_cbe_tmp55;
  llvm_cbe_tmp60 = *(&(regway.field3));
  *(&llvm_cbe_tmp36->field8) = llvm_cbe_tmp60;
  llvm_cbe_tmp64 = *(&(regway.field7));
  if ((llvm_cbe_tmp64 == llvm_cbe_tmp36)) {
    goto llvm_cbe_cond_true69;
  } else {
    goto llvm_cbe_cond_next;
  }

llvm_cbe_cond_true69:
  *(&(regway.field6)) = ((unsigned char )1);
  goto llvm_cbe_cond_next;

llvm_cbe_cond_true83:
  llvm_cbe_tmp90 = llvm_cbe_tmp79 << ((unsigned int )1);
  ltmp_133_2 =  /*tail*/ malloc(((((unsigned long long )(unsigned int )llvm_cbe_tmp90)) * ((unsigned long long )8ll)));
  ltmp_134_9 = ((struct l_struct_2E_regobj **)ltmp_133_2);
  llvm_cbe_tmp113 = *llvm_cbe_tmp112;
  *(&cg_caller_call_site_var) = ((unsigned int )1);
  *(&cg_caller_id_var) = ((unsigned int )129);
  ltmp_135_2 = memcpy((((unsigned char *)ltmp_134_9)), (((unsigned char *)llvm_cbe_tmp113)), ((((signed long long )(signed int )llvm_cbe_tmp79)) << ((unsigned long long )3ll)));
  llvm_cbe_tmp120 = *llvm_cbe_tmp112;
   /*tail*/ free((((unsigned char *)llvm_cbe_tmp120)));
  *llvm_cbe_tmp112 = ltmp_134_9;
  *llvm_cbe_tmp78 = llvm_cbe_tmp90;
  goto llvm_cbe_cond_next129;

  } while (1); /* end of syntactic loop 'bb20' */
llvm_cbe_bb20_preheader:
  llvm_cbe_tmp28 = &llvm_cbe_tmp19->field9.field0;
  llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb20;

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_return:
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return;
}


static unsigned int _ZN6wayobj10makebound2EPiiS0_(unsigned int *llvm_cbe_bound1p, unsigned int llvm_cbe_bound1l, unsigned int *llvm_cbe_bound2p) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp3;
  struct l_struct_2E_point16t *llvm_cbe_tmp6;
  unsigned int llvm_cbe_tmp336;
  unsigned int llvm_cbe_tmp467;
  unsigned short llvm_cbe_tmp24;
  unsigned short *llvm_cbe_tmp29;
  unsigned short llvm_cbe_tmp59;
  unsigned int llvm_cbe_tmp63;
  unsigned int llvm_cbe_tmp533;
  unsigned int llvm_cbe_tmp542;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_bound2l_1_reg2mem_0;
  unsigned int llvm_cbe_bound2l_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp11;
  unsigned int llvm_cbe_tmp14;
  unsigned int llvm_cbe_tmp15;
  unsigned long long llvm_cbe_tmp1718;
  unsigned short *llvm_cbe_tmp20;
  unsigned short llvm_cbe_tmp21;
  unsigned short llvm_cbe_tmp33;
  unsigned int llvm_cbe_tmp44;
  unsigned int llvm_cbe_bound2l_0;
  unsigned int llvm_cbe_bound2l_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp7980;
  unsigned short *llvm_cbe_tmp82;
  unsigned short llvm_cbe_tmp83;
  unsigned short llvm_cbe_tmp97;
  unsigned int llvm_cbe_tmp108;
  unsigned int llvm_cbe_bound2l_2;
  unsigned int llvm_cbe_bound2l_2__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp143;
  unsigned long long llvm_cbe_tmp145146;
  unsigned short *llvm_cbe_tmp148;
  unsigned short llvm_cbe_tmp149;
  unsigned short llvm_cbe_tmp163;
  unsigned int llvm_cbe_tmp174;
  unsigned int llvm_cbe_bound2l_3;
  unsigned int llvm_cbe_bound2l_3__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp207;
  unsigned long long llvm_cbe_tmp209210;
  unsigned short *llvm_cbe_tmp212;
  unsigned short llvm_cbe_tmp213;
  unsigned short llvm_cbe_tmp227;
  unsigned int llvm_cbe_tmp238;
  unsigned int llvm_cbe_bound2l_4;
  unsigned int llvm_cbe_bound2l_4__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp271;
  unsigned long long llvm_cbe_tmp273274;
  unsigned short *llvm_cbe_tmp276;
  unsigned short llvm_cbe_tmp277;
  unsigned short llvm_cbe_tmp291;
  unsigned int llvm_cbe_tmp302;
  unsigned int llvm_cbe_bound2l_5;
  unsigned int llvm_cbe_bound2l_5__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp337;
  unsigned long long llvm_cbe_tmp339340;
  unsigned short *llvm_cbe_tmp342;
  unsigned short llvm_cbe_tmp343;
  unsigned short llvm_cbe_tmp357;
  unsigned int llvm_cbe_tmp368;
  unsigned int llvm_cbe_bound2l_6;
  unsigned int llvm_cbe_bound2l_6__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp402;
  unsigned long long llvm_cbe_tmp404405;
  unsigned short *llvm_cbe_tmp407;
  unsigned short llvm_cbe_tmp408;
  unsigned short llvm_cbe_tmp422;
  unsigned int llvm_cbe_tmp433;
  unsigned int llvm_cbe_bound2l_7;
  unsigned int llvm_cbe_bound2l_7__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp468;
  unsigned long long llvm_cbe_tmp470471;
  unsigned short *llvm_cbe_tmp473;
  unsigned short llvm_cbe_tmp474;
  unsigned short llvm_cbe_tmp488;
  unsigned int llvm_cbe_tmp499;
  unsigned int llvm_cbe_bound2l_8;
  unsigned int llvm_cbe_bound2l_8__PHI_TEMPORARY;
  unsigned int llvm_cbe_bound2l_9;
  unsigned int llvm_cbe_tmp545;
  unsigned int llvm_cbe_UnifiedRetVal;
  unsigned int llvm_cbe_UnifiedRetVal__PHI_TEMPORARY;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )29);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )29));
  llvm_cbe_tmp3 = *(&way_2E_8);
  llvm_cbe_tmp6 = *(&way_2E_17);
  if ((((signed int )llvm_cbe_bound1l) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_preheader;
  } else {
    llvm_cbe_UnifiedRetVal__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_UnifiedReturnBlock;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp336 = llvm_cbe_tmp3 + ((unsigned int )-1);
  llvm_cbe_tmp467 = llvm_cbe_tmp3 + ((unsigned int )1);
  llvm_cbe_tmp24 = *(&way_2E_25);
  llvm_cbe_tmp29 = *(&way_2E_16);
  llvm_cbe_tmp59 = *(&way_2E_24);
  llvm_cbe_tmp63 = *(&way_2E_23);
  llvm_cbe_tmp533 = *(&way_2E_20);
  llvm_cbe_tmp542 = llvm_cbe_tmp533 + ((unsigned int )-1);
  llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_bound2l_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_bound2l_1_reg2mem_0 = llvm_cbe_bound2l_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )130);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )130));
  llvm_cbe_tmp11 = *(&llvm_cbe_bound1p[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0)))]);
  llvm_cbe_tmp14 = llvm_cbe_tmp11 - llvm_cbe_tmp3;
  llvm_cbe_tmp15 = llvm_cbe_tmp14 + ((unsigned int )-1);
  llvm_cbe_tmp1718 = ((signed long long )(signed int )llvm_cbe_tmp15);
  llvm_cbe_tmp20 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp1718)].field0;
  llvm_cbe_tmp21 = *llvm_cbe_tmp20;
  if ((llvm_cbe_tmp21 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_0__PHI_TEMPORARY = llvm_cbe_bound2l_1_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_cond_next74;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_cond_next530:
  llvm_cbe_bound2l_8 = llvm_cbe_bound2l_8__PHI_TEMPORARY;
  llvm_cbe_bound2l_9 = (((((signed int )llvm_cbe_tmp533) > ((signed int )llvm_cbe_bound2l_8))) ? (llvm_cbe_bound2l_8) : (llvm_cbe_tmp542));
  llvm_cbe_tmp545 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp545) < ((signed int )llvm_cbe_bound1l))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp545;   /* for PHI node */
    llvm_cbe_bound2l_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_bound2l_9;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_UnifiedRetVal__PHI_TEMPORARY = llvm_cbe_bound2l_9;   /* for PHI node */
    goto llvm_cbe_UnifiedReturnBlock;
  }

llvm_cbe_cond_next464:
  llvm_cbe_bound2l_7 = llvm_cbe_bound2l_7__PHI_TEMPORARY;
  llvm_cbe_tmp468 = llvm_cbe_tmp467 + llvm_cbe_tmp11;
  llvm_cbe_tmp470471 = ((signed long long )(signed int )llvm_cbe_tmp468);
  llvm_cbe_tmp473 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp470471)].field0;
  llvm_cbe_tmp474 = *llvm_cbe_tmp473;
  if ((llvm_cbe_tmp474 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_8__PHI_TEMPORARY = llvm_cbe_bound2l_7;   /* for PHI node */
    goto llvm_cbe_cond_next530;
  } else {
    goto llvm_cbe_cond_true481;
  }

llvm_cbe_cond_next399:
  llvm_cbe_bound2l_6 = llvm_cbe_bound2l_6__PHI_TEMPORARY;
  llvm_cbe_tmp402 = llvm_cbe_tmp11 + llvm_cbe_tmp3;
  llvm_cbe_tmp404405 = ((signed long long )(signed int )llvm_cbe_tmp402);
  llvm_cbe_tmp407 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp404405)].field0;
  llvm_cbe_tmp408 = *llvm_cbe_tmp407;
  if ((llvm_cbe_tmp408 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_7__PHI_TEMPORARY = llvm_cbe_bound2l_6;   /* for PHI node */
    goto llvm_cbe_cond_next464;
  } else {
    goto llvm_cbe_cond_true415;
  }

llvm_cbe_cond_next333:
  llvm_cbe_bound2l_5 = llvm_cbe_bound2l_5__PHI_TEMPORARY;
  llvm_cbe_tmp337 = llvm_cbe_tmp336 + llvm_cbe_tmp11;
  llvm_cbe_tmp339340 = ((signed long long )(signed int )llvm_cbe_tmp337);
  llvm_cbe_tmp342 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp339340)].field0;
  llvm_cbe_tmp343 = *llvm_cbe_tmp342;
  if ((llvm_cbe_tmp343 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_6__PHI_TEMPORARY = llvm_cbe_bound2l_5;   /* for PHI node */
    goto llvm_cbe_cond_next399;
  } else {
    goto llvm_cbe_cond_true350;
  }

llvm_cbe_cond_next269:
  llvm_cbe_bound2l_4 = llvm_cbe_bound2l_4__PHI_TEMPORARY;
  llvm_cbe_tmp271 = llvm_cbe_tmp11 + ((unsigned int )1);
  llvm_cbe_tmp273274 = ((signed long long )(signed int )llvm_cbe_tmp271);
  llvm_cbe_tmp276 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp273274)].field0;
  llvm_cbe_tmp277 = *llvm_cbe_tmp276;
  if ((llvm_cbe_tmp277 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_5__PHI_TEMPORARY = llvm_cbe_bound2l_4;   /* for PHI node */
    goto llvm_cbe_cond_next333;
  } else {
    goto llvm_cbe_cond_true284;
  }

llvm_cbe_cond_next205:
  llvm_cbe_bound2l_3 = llvm_cbe_bound2l_3__PHI_TEMPORARY;
  llvm_cbe_tmp207 = llvm_cbe_tmp11 + ((unsigned int )-1);
  llvm_cbe_tmp209210 = ((signed long long )(signed int )llvm_cbe_tmp207);
  llvm_cbe_tmp212 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp209210)].field0;
  llvm_cbe_tmp213 = *llvm_cbe_tmp212;
  if ((llvm_cbe_tmp213 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_4__PHI_TEMPORARY = llvm_cbe_bound2l_3;   /* for PHI node */
    goto llvm_cbe_cond_next269;
  } else {
    goto llvm_cbe_cond_true220;
  }

llvm_cbe_cond_next139:
  llvm_cbe_bound2l_2 = llvm_cbe_bound2l_2__PHI_TEMPORARY;
  llvm_cbe_tmp143 = llvm_cbe_tmp14 + ((unsigned int )1);
  llvm_cbe_tmp145146 = ((signed long long )(signed int )llvm_cbe_tmp143);
  llvm_cbe_tmp148 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp145146)].field0;
  llvm_cbe_tmp149 = *llvm_cbe_tmp148;
  if ((llvm_cbe_tmp149 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_3__PHI_TEMPORARY = llvm_cbe_bound2l_2;   /* for PHI node */
    goto llvm_cbe_cond_next205;
  } else {
    goto llvm_cbe_cond_true156;
  }

llvm_cbe_cond_next74:
  llvm_cbe_bound2l_0 = llvm_cbe_bound2l_0__PHI_TEMPORARY;
  llvm_cbe_tmp7980 = ((signed long long )(signed int )llvm_cbe_tmp14);
  llvm_cbe_tmp82 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp7980)].field0;
  llvm_cbe_tmp83 = *llvm_cbe_tmp82;
  if ((llvm_cbe_tmp83 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_2__PHI_TEMPORARY = llvm_cbe_bound2l_0;   /* for PHI node */
    goto llvm_cbe_cond_next139;
  } else {
    goto llvm_cbe_cond_true90;
  }

llvm_cbe_cond_true:
  llvm_cbe_tmp33 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp1718)]);
  if ((llvm_cbe_tmp33 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true37;
  } else {
    llvm_cbe_bound2l_0__PHI_TEMPORARY = llvm_cbe_bound2l_1_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_cond_next74;
  }

llvm_cbe_cond_true37:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_1_reg2mem_0)))]) = llvm_cbe_tmp15;
  llvm_cbe_tmp44 = llvm_cbe_bound2l_1_reg2mem_0 + ((unsigned int )1);
  *llvm_cbe_tmp20 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp1718)].field1) = llvm_cbe_tmp59;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp63 == llvm_cbe_tmp15)) {
    goto llvm_cbe_cond_true68;
  } else {
    llvm_cbe_bound2l_0__PHI_TEMPORARY = llvm_cbe_tmp44;   /* for PHI node */
    goto llvm_cbe_cond_next74;
  }

llvm_cbe_cond_true90:
  llvm_cbe_tmp97 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp7980)]);
  if ((llvm_cbe_tmp97 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true101;
  } else {
    llvm_cbe_bound2l_2__PHI_TEMPORARY = llvm_cbe_bound2l_0;   /* for PHI node */
    goto llvm_cbe_cond_next139;
  }

llvm_cbe_cond_true101:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_0)))]) = llvm_cbe_tmp14;
  llvm_cbe_tmp108 = llvm_cbe_bound2l_0 + ((unsigned int )1);
  *llvm_cbe_tmp82 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp7980)].field1) = llvm_cbe_tmp59;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp63 == llvm_cbe_tmp14)) {
    goto llvm_cbe_cond_true132;
  } else {
    llvm_cbe_bound2l_2__PHI_TEMPORARY = llvm_cbe_tmp108;   /* for PHI node */
    goto llvm_cbe_cond_next139;
  }

llvm_cbe_cond_true156:
  llvm_cbe_tmp163 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp145146)]);
  if ((llvm_cbe_tmp163 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true167;
  } else {
    llvm_cbe_bound2l_3__PHI_TEMPORARY = llvm_cbe_bound2l_2;   /* for PHI node */
    goto llvm_cbe_cond_next205;
  }

llvm_cbe_cond_true167:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_2)))]) = llvm_cbe_tmp143;
  llvm_cbe_tmp174 = llvm_cbe_bound2l_2 + ((unsigned int )1);
  *llvm_cbe_tmp148 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp145146)].field1) = llvm_cbe_tmp59;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp63 == llvm_cbe_tmp143)) {
    goto llvm_cbe_cond_true198;
  } else {
    llvm_cbe_bound2l_3__PHI_TEMPORARY = llvm_cbe_tmp174;   /* for PHI node */
    goto llvm_cbe_cond_next205;
  }

llvm_cbe_cond_true220:
  llvm_cbe_tmp227 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp209210)]);
  if ((llvm_cbe_tmp227 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true231;
  } else {
    llvm_cbe_bound2l_4__PHI_TEMPORARY = llvm_cbe_bound2l_3;   /* for PHI node */
    goto llvm_cbe_cond_next269;
  }

llvm_cbe_cond_true231:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_3)))]) = llvm_cbe_tmp207;
  llvm_cbe_tmp238 = llvm_cbe_bound2l_3 + ((unsigned int )1);
  *llvm_cbe_tmp212 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp209210)].field1) = llvm_cbe_tmp59;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp63 == llvm_cbe_tmp207)) {
    goto llvm_cbe_cond_true262;
  } else {
    llvm_cbe_bound2l_4__PHI_TEMPORARY = llvm_cbe_tmp238;   /* for PHI node */
    goto llvm_cbe_cond_next269;
  }

llvm_cbe_cond_true284:
  llvm_cbe_tmp291 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp273274)]);
  if ((llvm_cbe_tmp291 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true295;
  } else {
    llvm_cbe_bound2l_5__PHI_TEMPORARY = llvm_cbe_bound2l_4;   /* for PHI node */
    goto llvm_cbe_cond_next333;
  }

llvm_cbe_cond_true295:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_4)))]) = llvm_cbe_tmp271;
  llvm_cbe_tmp302 = llvm_cbe_bound2l_4 + ((unsigned int )1);
  *llvm_cbe_tmp276 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp273274)].field1) = llvm_cbe_tmp59;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp63 == llvm_cbe_tmp271)) {
    goto llvm_cbe_cond_true326;
  } else {
    llvm_cbe_bound2l_5__PHI_TEMPORARY = llvm_cbe_tmp302;   /* for PHI node */
    goto llvm_cbe_cond_next333;
  }

llvm_cbe_cond_true350:
  llvm_cbe_tmp357 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp339340)]);
  if ((llvm_cbe_tmp357 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true361;
  } else {
    llvm_cbe_bound2l_6__PHI_TEMPORARY = llvm_cbe_bound2l_5;   /* for PHI node */
    goto llvm_cbe_cond_next399;
  }

llvm_cbe_cond_true361:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_5)))]) = llvm_cbe_tmp337;
  llvm_cbe_tmp368 = llvm_cbe_bound2l_5 + ((unsigned int )1);
  *llvm_cbe_tmp342 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp339340)].field1) = llvm_cbe_tmp59;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp63 == llvm_cbe_tmp337)) {
    goto llvm_cbe_cond_true392;
  } else {
    llvm_cbe_bound2l_6__PHI_TEMPORARY = llvm_cbe_tmp368;   /* for PHI node */
    goto llvm_cbe_cond_next399;
  }

llvm_cbe_cond_true415:
  llvm_cbe_tmp422 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp404405)]);
  if ((llvm_cbe_tmp422 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true426;
  } else {
    llvm_cbe_bound2l_7__PHI_TEMPORARY = llvm_cbe_bound2l_6;   /* for PHI node */
    goto llvm_cbe_cond_next464;
  }

llvm_cbe_cond_true426:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_6)))]) = llvm_cbe_tmp402;
  llvm_cbe_tmp433 = llvm_cbe_bound2l_6 + ((unsigned int )1);
  *llvm_cbe_tmp407 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp404405)].field1) = llvm_cbe_tmp59;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp63 == llvm_cbe_tmp402)) {
    goto llvm_cbe_cond_true457;
  } else {
    llvm_cbe_bound2l_7__PHI_TEMPORARY = llvm_cbe_tmp433;   /* for PHI node */
    goto llvm_cbe_cond_next464;
  }

llvm_cbe_cond_true481:
  llvm_cbe_tmp488 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp470471)]);
  if ((llvm_cbe_tmp488 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true492;
  } else {
    llvm_cbe_bound2l_8__PHI_TEMPORARY = llvm_cbe_bound2l_7;   /* for PHI node */
    goto llvm_cbe_cond_next530;
  }

llvm_cbe_cond_true492:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_7)))]) = llvm_cbe_tmp468;
  llvm_cbe_tmp499 = llvm_cbe_bound2l_7 + ((unsigned int )1);
  *llvm_cbe_tmp473 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp470471)].field1) = llvm_cbe_tmp59;
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp63 == llvm_cbe_tmp468)) {
    goto llvm_cbe_cond_true523;
  } else {
    llvm_cbe_bound2l_8__PHI_TEMPORARY = llvm_cbe_tmp499;   /* for PHI node */
    goto llvm_cbe_cond_next530;
  }

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_cond_true68:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp44;
llvm_cbe_cond_true132:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp108;
llvm_cbe_cond_true198:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp174;
llvm_cbe_cond_true262:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp238;
llvm_cbe_cond_true326:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp302;
llvm_cbe_cond_true392:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp368;
llvm_cbe_cond_true457:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp433;
llvm_cbe_cond_true523:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_tmp499;
llvm_cbe_UnifiedReturnBlock:
  llvm_cbe_UnifiedRetVal = llvm_cbe_UnifiedRetVal__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_UnifiedRetVal;
}


static unsigned int _ZN6wayobj18makeobstaclebound2EPiiS0_(unsigned int *llvm_cbe_bound1p, unsigned int llvm_cbe_bound1l, unsigned int *llvm_cbe_bound2p) {
  unsigned int llvm_cbe_val;
  unsigned int llvm_cbe_val2;
  unsigned int llvm_cbe_tmp3;
  struct l_struct_2E_point16t *llvm_cbe_tmp6;
  unsigned int llvm_cbe_tmp371;
  unsigned int llvm_cbe_tmp516;
  unsigned short llvm_cbe_tmp24;
  unsigned short *llvm_cbe_tmp29;
  unsigned short llvm_cbe_tmp59;
  unsigned int llvm_cbe_tmp589622;
  unsigned int llvm_cbe_tmp598;
  unsigned int llvm_cbe_i_0_reg2mem_0;
  unsigned int llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_bound2l_1_reg2mem_0;
  unsigned int llvm_cbe_bound2l_1_reg2mem_0__PHI_TEMPORARY;
  unsigned int llvm_cbe_val3;
  unsigned int llvm_cbe_val4;
  unsigned int llvm_cbe_tmp11;
  unsigned int llvm_cbe_tmp14;
  unsigned int llvm_cbe_tmp15;
  unsigned long long llvm_cbe_tmp1718;
  unsigned short *llvm_cbe_tmp20;
  unsigned short llvm_cbe_tmp21;
  unsigned short llvm_cbe_tmp33;
  unsigned int llvm_cbe_tmp44;
  unsigned int llvm_cbe_bound2l_0;
  unsigned int llvm_cbe_bound2l_0__PHI_TEMPORARY;
  unsigned long long llvm_cbe_tmp8586;
  unsigned short *llvm_cbe_tmp88;
  unsigned short llvm_cbe_tmp90;
  unsigned short llvm_cbe_tmp104;
  unsigned int llvm_cbe_tmp115;
  unsigned int llvm_cbe_bound2l_2;
  unsigned int llvm_cbe_bound2l_2__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp157;
  unsigned long long llvm_cbe_tmp159160;
  unsigned short *llvm_cbe_tmp162;
  unsigned short llvm_cbe_tmp163;
  unsigned short llvm_cbe_tmp177;
  unsigned int llvm_cbe_tmp188;
  unsigned int llvm_cbe_bound2l_3;
  unsigned int llvm_cbe_bound2l_3__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp228;
  unsigned long long llvm_cbe_tmp230231;
  unsigned short *llvm_cbe_tmp233;
  unsigned short llvm_cbe_tmp234;
  unsigned short llvm_cbe_tmp248;
  unsigned int llvm_cbe_tmp259;
  unsigned int llvm_cbe_bound2l_4;
  unsigned int llvm_cbe_bound2l_4__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp299;
  unsigned long long llvm_cbe_tmp301302;
  unsigned short *llvm_cbe_tmp304;
  unsigned short llvm_cbe_tmp305;
  unsigned short llvm_cbe_tmp319;
  unsigned int llvm_cbe_tmp330;
  unsigned int llvm_cbe_bound2l_5;
  unsigned int llvm_cbe_bound2l_5__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp372;
  unsigned long long llvm_cbe_tmp374375;
  unsigned short *llvm_cbe_tmp377;
  unsigned short llvm_cbe_tmp378;
  unsigned short llvm_cbe_tmp392;
  unsigned int llvm_cbe_tmp403;
  unsigned int llvm_cbe_bound2l_6;
  unsigned int llvm_cbe_bound2l_6__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp444;
  unsigned long long llvm_cbe_tmp446447;
  unsigned short *llvm_cbe_tmp449;
  unsigned short llvm_cbe_tmp450;
  unsigned short llvm_cbe_tmp464;
  unsigned int llvm_cbe_tmp475;
  unsigned int llvm_cbe_bound2l_7;
  unsigned int llvm_cbe_bound2l_7__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp517;
  unsigned long long llvm_cbe_tmp519520;
  unsigned short *llvm_cbe_tmp522;
  unsigned short llvm_cbe_tmp523;
  unsigned short llvm_cbe_tmp537;
  unsigned int llvm_cbe_tmp548;
  unsigned int llvm_cbe_bound2l_9;
  unsigned int llvm_cbe_bound2l_9__PHI_TEMPORARY;
  unsigned int llvm_cbe_tmp601;
  unsigned int llvm_cbe_UnifiedRetVal;
  unsigned int llvm_cbe_UnifiedRetVal__PHI_TEMPORARY;

  llvm_cbe_val = *(&cg_caller_id_var);
  llvm_cbe_val2 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )30);
  CallEdgeProfiler(llvm_cbe_val, llvm_cbe_val2, ((unsigned int )30));
  llvm_cbe_tmp3 = *(&way_2E_8);
  llvm_cbe_tmp6 = *(&way_2E_17);
  if ((((signed int )llvm_cbe_bound1l) > ((signed int )((unsigned int )0)))) {
    goto llvm_cbe_bb_preheader;
  } else {
    llvm_cbe_UnifiedRetVal__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
    goto llvm_cbe_UnifiedReturnBlock;
  }

llvm_cbe_bb_preheader:
  llvm_cbe_tmp371 = llvm_cbe_tmp3 + ((unsigned int )-1);
  llvm_cbe_tmp516 = llvm_cbe_tmp3 + ((unsigned int )1);
  llvm_cbe_tmp24 = *(&way_2E_25);
  llvm_cbe_tmp29 = *(&way_2E_16);
  llvm_cbe_tmp59 = *(&way_2E_24);
  llvm_cbe_tmp589622 = *(&way_2E_20);
  llvm_cbe_tmp598 = llvm_cbe_tmp589622 + ((unsigned int )-1);
  llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  llvm_cbe_bound2l_1_reg2mem_0__PHI_TEMPORARY = ((unsigned int )0);   /* for PHI node */
  goto llvm_cbe_bb;

  do {     /* Syntactic loop 'bb' to make GCC happy */
llvm_cbe_bb:
  llvm_cbe_i_0_reg2mem_0 = llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_bound2l_1_reg2mem_0 = llvm_cbe_bound2l_1_reg2mem_0__PHI_TEMPORARY;
  llvm_cbe_val3 = *(&cg_caller_id_var);
  llvm_cbe_val4 = *(&cg_caller_call_site_var);
  *(&cg_caller_id_var) = ((unsigned int )131);
  CallEdgeProfiler(llvm_cbe_val3, llvm_cbe_val4, ((unsigned int )131));
  llvm_cbe_tmp11 = *(&llvm_cbe_bound1p[((signed long long )(((signed long long )(signed int )llvm_cbe_i_0_reg2mem_0)))]);
  llvm_cbe_tmp14 = llvm_cbe_tmp11 - llvm_cbe_tmp3;
  llvm_cbe_tmp15 = llvm_cbe_tmp14 + ((unsigned int )-1);
  llvm_cbe_tmp1718 = ((signed long long )(signed int )llvm_cbe_tmp15);
  llvm_cbe_tmp20 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp1718)].field0;
  llvm_cbe_tmp21 = *llvm_cbe_tmp20;
  if ((llvm_cbe_tmp21 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_0__PHI_TEMPORARY = llvm_cbe_bound2l_1_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_cond_next80;
  } else {
    goto llvm_cbe_cond_true;
  }

llvm_cbe_bb602:
  llvm_cbe_bound2l_9 = llvm_cbe_bound2l_9__PHI_TEMPORARY;
  llvm_cbe_tmp601 = llvm_cbe_i_0_reg2mem_0 + ((unsigned int )1);
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((((signed int )llvm_cbe_tmp601) < ((signed int )llvm_cbe_bound1l))) {
    llvm_cbe_i_0_reg2mem_0__PHI_TEMPORARY = llvm_cbe_tmp601;   /* for PHI node */
    llvm_cbe_bound2l_1_reg2mem_0__PHI_TEMPORARY = llvm_cbe_bound2l_9;   /* for PHI node */
    goto llvm_cbe_bb;
  } else {
    llvm_cbe_UnifiedRetVal__PHI_TEMPORARY = llvm_cbe_bound2l_9;   /* for PHI node */
    goto llvm_cbe_UnifiedReturnBlock;
  }

llvm_cbe_cond_true541:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_7)))]) = llvm_cbe_tmp517;
  llvm_cbe_tmp548 = llvm_cbe_bound2l_7 + ((unsigned int )1);
  *llvm_cbe_tmp522 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp519520)].field1) = llvm_cbe_tmp59;
  if ((((signed int )llvm_cbe_tmp589622) > ((signed int )llvm_cbe_tmp548))) {
    llvm_cbe_bound2l_9__PHI_TEMPORARY = llvm_cbe_tmp548;   /* for PHI node */
    goto llvm_cbe_bb602;
  } else {
    goto llvm_cbe_cond_true594;
  }

llvm_cbe_cond_true530:
  llvm_cbe_tmp537 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp519520)]);
  if ((((signed short )llvm_cbe_tmp537) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_cond_true541;
  } else {
    goto llvm_cbe_cond_false565;
  }

llvm_cbe_cond_next513:
  llvm_cbe_bound2l_7 = llvm_cbe_bound2l_7__PHI_TEMPORARY;
  llvm_cbe_tmp517 = llvm_cbe_tmp516 + llvm_cbe_tmp11;
  llvm_cbe_tmp519520 = ((signed long long )(signed int )llvm_cbe_tmp517);
  llvm_cbe_tmp522 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp519520)].field0;
  llvm_cbe_tmp523 = *llvm_cbe_tmp522;
  if ((llvm_cbe_tmp523 == llvm_cbe_tmp24)) {
    goto llvm_cbe_cond_next586;
  } else {
    goto llvm_cbe_cond_true530;
  }

llvm_cbe_cond_next441:
  llvm_cbe_bound2l_6 = llvm_cbe_bound2l_6__PHI_TEMPORARY;
  llvm_cbe_tmp444 = llvm_cbe_tmp11 + llvm_cbe_tmp3;
  llvm_cbe_tmp446447 = ((signed long long )(signed int )llvm_cbe_tmp444);
  llvm_cbe_tmp449 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp446447)].field0;
  llvm_cbe_tmp450 = *llvm_cbe_tmp449;
  if ((llvm_cbe_tmp450 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_7__PHI_TEMPORARY = llvm_cbe_bound2l_6;   /* for PHI node */
    goto llvm_cbe_cond_next513;
  } else {
    goto llvm_cbe_cond_true457;
  }

llvm_cbe_cond_next368:
  llvm_cbe_bound2l_5 = llvm_cbe_bound2l_5__PHI_TEMPORARY;
  llvm_cbe_tmp372 = llvm_cbe_tmp371 + llvm_cbe_tmp11;
  llvm_cbe_tmp374375 = ((signed long long )(signed int )llvm_cbe_tmp372);
  llvm_cbe_tmp377 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp374375)].field0;
  llvm_cbe_tmp378 = *llvm_cbe_tmp377;
  if ((llvm_cbe_tmp378 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_6__PHI_TEMPORARY = llvm_cbe_bound2l_5;   /* for PHI node */
    goto llvm_cbe_cond_next441;
  } else {
    goto llvm_cbe_cond_true385;
  }

llvm_cbe_cond_next297:
  llvm_cbe_bound2l_4 = llvm_cbe_bound2l_4__PHI_TEMPORARY;
  llvm_cbe_tmp299 = llvm_cbe_tmp11 + ((unsigned int )1);
  llvm_cbe_tmp301302 = ((signed long long )(signed int )llvm_cbe_tmp299);
  llvm_cbe_tmp304 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp301302)].field0;
  llvm_cbe_tmp305 = *llvm_cbe_tmp304;
  if ((llvm_cbe_tmp305 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_5__PHI_TEMPORARY = llvm_cbe_bound2l_4;   /* for PHI node */
    goto llvm_cbe_cond_next368;
  } else {
    goto llvm_cbe_cond_true312;
  }

llvm_cbe_cond_next226:
  llvm_cbe_bound2l_3 = llvm_cbe_bound2l_3__PHI_TEMPORARY;
  llvm_cbe_tmp228 = llvm_cbe_tmp11 + ((unsigned int )-1);
  llvm_cbe_tmp230231 = ((signed long long )(signed int )llvm_cbe_tmp228);
  llvm_cbe_tmp233 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp230231)].field0;
  llvm_cbe_tmp234 = *llvm_cbe_tmp233;
  if ((llvm_cbe_tmp234 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_4__PHI_TEMPORARY = llvm_cbe_bound2l_3;   /* for PHI node */
    goto llvm_cbe_cond_next297;
  } else {
    goto llvm_cbe_cond_true241;
  }

llvm_cbe_cond_next153:
  llvm_cbe_bound2l_2 = llvm_cbe_bound2l_2__PHI_TEMPORARY;
  llvm_cbe_tmp157 = llvm_cbe_tmp14 + ((unsigned int )1);
  llvm_cbe_tmp159160 = ((signed long long )(signed int )llvm_cbe_tmp157);
  llvm_cbe_tmp162 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp159160)].field0;
  llvm_cbe_tmp163 = *llvm_cbe_tmp162;
  if ((llvm_cbe_tmp163 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_3__PHI_TEMPORARY = llvm_cbe_bound2l_2;   /* for PHI node */
    goto llvm_cbe_cond_next226;
  } else {
    goto llvm_cbe_cond_true170;
  }

llvm_cbe_cond_next80:
  llvm_cbe_bound2l_0 = llvm_cbe_bound2l_0__PHI_TEMPORARY;
  llvm_cbe_tmp8586 = ((signed long long )(signed int )llvm_cbe_tmp14);
  llvm_cbe_tmp88 = &llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp8586)].field0;
  llvm_cbe_tmp90 = *llvm_cbe_tmp88;
  if ((llvm_cbe_tmp90 == llvm_cbe_tmp24)) {
    llvm_cbe_bound2l_2__PHI_TEMPORARY = llvm_cbe_bound2l_0;   /* for PHI node */
    goto llvm_cbe_cond_next153;
  } else {
    goto llvm_cbe_cond_true97;
  }

llvm_cbe_cond_true37:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_1_reg2mem_0)))]) = llvm_cbe_tmp15;
  llvm_cbe_tmp44 = llvm_cbe_bound2l_1_reg2mem_0 + ((unsigned int )1);
  *llvm_cbe_tmp20 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp1718)].field1) = llvm_cbe_tmp59;
  llvm_cbe_bound2l_0__PHI_TEMPORARY = llvm_cbe_tmp44;   /* for PHI node */
  goto llvm_cbe_cond_next80;

llvm_cbe_cond_true:
  llvm_cbe_tmp33 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp1718)]);
  if ((((signed short )llvm_cbe_tmp33) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_cond_true37;
  } else {
    goto llvm_cbe_cond_false;
  }

llvm_cbe_cond_false:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp33 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true71;
  } else {
    llvm_cbe_bound2l_0__PHI_TEMPORARY = llvm_cbe_bound2l_1_reg2mem_0;   /* for PHI node */
    goto llvm_cbe_cond_next80;
  }

llvm_cbe_cond_true108:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_0)))]) = llvm_cbe_tmp14;
  llvm_cbe_tmp115 = llvm_cbe_bound2l_0 + ((unsigned int )1);
  *llvm_cbe_tmp88 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp8586)].field1) = llvm_cbe_tmp59;
  llvm_cbe_bound2l_2__PHI_TEMPORARY = llvm_cbe_tmp115;   /* for PHI node */
  goto llvm_cbe_cond_next153;

llvm_cbe_cond_true97:
  llvm_cbe_tmp104 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp8586)]);
  if ((((signed short )llvm_cbe_tmp104) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_cond_true108;
  } else {
    goto llvm_cbe_cond_false132;
  }

llvm_cbe_cond_false132:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp104 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true143;
  } else {
    llvm_cbe_bound2l_2__PHI_TEMPORARY = llvm_cbe_bound2l_0;   /* for PHI node */
    goto llvm_cbe_cond_next153;
  }

llvm_cbe_cond_true181:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_2)))]) = llvm_cbe_tmp157;
  llvm_cbe_tmp188 = llvm_cbe_bound2l_2 + ((unsigned int )1);
  *llvm_cbe_tmp162 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp159160)].field1) = llvm_cbe_tmp59;
  llvm_cbe_bound2l_3__PHI_TEMPORARY = llvm_cbe_tmp188;   /* for PHI node */
  goto llvm_cbe_cond_next226;

llvm_cbe_cond_true170:
  llvm_cbe_tmp177 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp159160)]);
  if ((((signed short )llvm_cbe_tmp177) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_cond_true181;
  } else {
    goto llvm_cbe_cond_false205;
  }

llvm_cbe_cond_false205:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp177 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true216;
  } else {
    llvm_cbe_bound2l_3__PHI_TEMPORARY = llvm_cbe_bound2l_2;   /* for PHI node */
    goto llvm_cbe_cond_next226;
  }

llvm_cbe_cond_true252:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_3)))]) = llvm_cbe_tmp228;
  llvm_cbe_tmp259 = llvm_cbe_bound2l_3 + ((unsigned int )1);
  *llvm_cbe_tmp233 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp230231)].field1) = llvm_cbe_tmp59;
  llvm_cbe_bound2l_4__PHI_TEMPORARY = llvm_cbe_tmp259;   /* for PHI node */
  goto llvm_cbe_cond_next297;

llvm_cbe_cond_true241:
  llvm_cbe_tmp248 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp230231)]);
  if ((((signed short )llvm_cbe_tmp248) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_cond_true252;
  } else {
    goto llvm_cbe_cond_false276;
  }

llvm_cbe_cond_false276:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp248 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true287;
  } else {
    llvm_cbe_bound2l_4__PHI_TEMPORARY = llvm_cbe_bound2l_3;   /* for PHI node */
    goto llvm_cbe_cond_next297;
  }

llvm_cbe_cond_true323:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_4)))]) = llvm_cbe_tmp299;
  llvm_cbe_tmp330 = llvm_cbe_bound2l_4 + ((unsigned int )1);
  *llvm_cbe_tmp304 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp301302)].field1) = llvm_cbe_tmp59;
  llvm_cbe_bound2l_5__PHI_TEMPORARY = llvm_cbe_tmp330;   /* for PHI node */
  goto llvm_cbe_cond_next368;

llvm_cbe_cond_true312:
  llvm_cbe_tmp319 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp301302)]);
  if ((((signed short )llvm_cbe_tmp319) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_cond_true323;
  } else {
    goto llvm_cbe_cond_false347;
  }

llvm_cbe_cond_false347:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp319 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true358;
  } else {
    llvm_cbe_bound2l_5__PHI_TEMPORARY = llvm_cbe_bound2l_4;   /* for PHI node */
    goto llvm_cbe_cond_next368;
  }

llvm_cbe_cond_true396:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_5)))]) = llvm_cbe_tmp372;
  llvm_cbe_tmp403 = llvm_cbe_bound2l_5 + ((unsigned int )1);
  *llvm_cbe_tmp377 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp374375)].field1) = llvm_cbe_tmp59;
  llvm_cbe_bound2l_6__PHI_TEMPORARY = llvm_cbe_tmp403;   /* for PHI node */
  goto llvm_cbe_cond_next441;

llvm_cbe_cond_true385:
  llvm_cbe_tmp392 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp374375)]);
  if ((((signed short )llvm_cbe_tmp392) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_cond_true396;
  } else {
    goto llvm_cbe_cond_false420;
  }

llvm_cbe_cond_false420:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp392 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true431;
  } else {
    llvm_cbe_bound2l_6__PHI_TEMPORARY = llvm_cbe_bound2l_5;   /* for PHI node */
    goto llvm_cbe_cond_next441;
  }

llvm_cbe_cond_true468:
  *(&llvm_cbe_bound2p[((signed long long )(((signed long long )(signed int )llvm_cbe_bound2l_6)))]) = llvm_cbe_tmp444;
  llvm_cbe_tmp475 = llvm_cbe_bound2l_6 + ((unsigned int )1);
  *llvm_cbe_tmp449 = llvm_cbe_tmp24;
  *(&llvm_cbe_tmp6[((signed long long )llvm_cbe_tmp446447)].field1) = llvm_cbe_tmp59;
  llvm_cbe_bound2l_7__PHI_TEMPORARY = llvm_cbe_tmp475;   /* for PHI node */
  goto llvm_cbe_cond_next513;

llvm_cbe_cond_true457:
  llvm_cbe_tmp464 = *(&llvm_cbe_tmp29[((signed long long )llvm_cbe_tmp446447)]);
  if ((((signed short )llvm_cbe_tmp464) > ((signed short )((unsigned short )0)))) {
    goto llvm_cbe_cond_true468;
  } else {
    goto llvm_cbe_cond_false492;
  }

llvm_cbe_cond_false492:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp464 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true503;
  } else {
    llvm_cbe_bound2l_7__PHI_TEMPORARY = llvm_cbe_bound2l_6;   /* for PHI node */
    goto llvm_cbe_cond_next513;
  }

llvm_cbe_cond_next586:
  if ((((signed int )llvm_cbe_tmp589622) > ((signed int )llvm_cbe_bound2l_7))) {
    llvm_cbe_bound2l_9__PHI_TEMPORARY = llvm_cbe_bound2l_7;   /* for PHI node */
    goto llvm_cbe_bb602;
  } else {
    goto llvm_cbe_cond_true594;
  }

llvm_cbe_cond_false565:
  *(&cg_caller_call_site_var) = llvm_cbe_val4;
  *(&cg_caller_id_var) = llvm_cbe_val3;
  if ((llvm_cbe_tmp537 == ((unsigned short )0))) {
    goto llvm_cbe_cond_true576;
  } else {
    goto llvm_cbe_cond_next586;
  }

llvm_cbe_cond_true594:
  llvm_cbe_bound2l_9__PHI_TEMPORARY = llvm_cbe_tmp598;   /* for PHI node */
  goto llvm_cbe_bb602;

  } while (1); /* end of syntactic loop 'bb' */
llvm_cbe_cond_true71:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&way_2E_23) = llvm_cbe_tmp15;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_bound2l_1_reg2mem_0;
llvm_cbe_cond_true143:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&way_2E_23) = llvm_cbe_tmp14;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_bound2l_0;
llvm_cbe_cond_true216:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&way_2E_23) = llvm_cbe_tmp157;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_bound2l_2;
llvm_cbe_cond_true287:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&way_2E_23) = llvm_cbe_tmp228;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_bound2l_3;
llvm_cbe_cond_true358:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&way_2E_23) = llvm_cbe_tmp299;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_bound2l_4;
llvm_cbe_cond_true431:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&way_2E_23) = llvm_cbe_tmp372;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_bound2l_5;
llvm_cbe_cond_true503:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&way_2E_23) = llvm_cbe_tmp444;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_bound2l_6;
llvm_cbe_cond_true576:
  *(&way_2E_22_2E_b) = ((1) & 1);
  *(&way_2E_23) = llvm_cbe_tmp517;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_bound2l_7;
llvm_cbe_UnifiedReturnBlock:
  llvm_cbe_UnifiedRetVal = llvm_cbe_UnifiedRetVal__PHI_TEMPORARY;
  *(&cg_caller_call_site_var) = llvm_cbe_val2;
  *(&cg_caller_id_var) = llvm_cbe_val;
  return llvm_cbe_UnifiedRetVal;
}

