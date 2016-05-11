" Vim syntax file
" Language:		MSIL
" Maintainer:	Shawn Farkas
" Last Change:	5/25/2004
" Filename:		*.il

if exists("b:current_syntax")
	finish
endif

let s:il_cpo_save = &cpo
set cpo&vim

setlocal iskeyword+=.

syn region	ilComment	start="/\*" end="\*/"
syn match	ilComment	"//.*$"

syn region	ilString	start=+"+ end=+"+ contains=@Spell
syn match	ilCharacter	"'[^']*'"
syn match	ilCharacter	"'\\''"
syn match	ilCharacter	"'[^\\]'"
syn match	ilNumber	"\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match	ilNumber	"\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match	ilNumber	"\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match	ilNumber	"\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

syn keyword ilDotDirective	.addon .assembly .cctor .ctor .class .corflags .custom .data .entrypoint
syn keyword ilDotDirective	.emitbyte .event .export .field .file .fire .get .hash .imagebase .import
syn keyword ilDotDirective	.language .line .locale .localized .locals .manifestres \.maxstack .method
syn keyword ilDotDirective	.module .mresource .mscorlib .namespace .other .override .pack .param .pdirect
syn keyword ilDotDirective	.permission .permissionset .property .publickey .publickeytoken .removeon
syn keyword ilDotDirective	.sdata .set .size .subsystem .stcakreserve .try .typelist .typedef .ver .vtable
syn keyword ilDotDirective	.vtentry .vtfixup .zeroinit

syn keyword ilDirective		algorithm alignment any array as at break bstr bytearray
syn keyword ilDirective		callmostderived carray catch cil ckfinite class const cpblk cpobj custom
syn keyword ilDirective		default endfilter endfinally endmac enum explicit extends extern
syn keyword ilDirective		fault field filter final finally fixed forwardref fromunmanaged handler
syn keyword ilDirective		hidebysig implements in init initblk initobj interface instance literal
syn keyword ilDirective		managed marshal mdtoken method modreq modopt native nested noinlining
syn keyword ilDirective		nometadata notserialized opt out pinned property retainappdomain struct
syn keyword ilDirective		tls type with valuetype vararg 

syn keyword ilSecurity		assert demand deny inheritcheck inheritancedemandor linkcheck linkdemandor
syn keyword ilSecurity		permitonly prejitgrant prejitdeny reqmin reqopt request reqrefuse noncasdemand
syn keyword ilSecurity		noncasinheritance noncaslinkdemand 

syn keyword ilLiteral		true false null nullref 

syn keyword ilType			array blob blob_object bool byvalstr carray cf char clsid currency date decimal
syn keyword ilType			filetime float float32 float64 error hresult int int8 int16 int32 int64 iunknown
syn keyword ilType			idispatch lpstr lpwstr lptstr lpstruct object objectref record safearray string
syn keyword ilType		 	stream streamed_object storage stored_object syschar sysstring tbstr userdefined
syn keyword ilType			unsigned uint8 uint16 uint32 uint64 variant void

syn keyword ilAsmAttr		jittrack legacy library nojitopt platform_appdomain platform_process
syn keyword ilAsmAttr		platform_system retargetable

syn keyword	ilCodeAttr		abstract ansi auto autochar beforefieldinit cil enum explicit final flags
syn keyword ilCodeAttr		forwardref hidebysig import initonly interface internalcall literal managed
syn keyword	ilCodeAttr		marshal mustrun native nested newslot noinlining notserialized optil
syn keyword ilCodeAttr		pinvokeimpl preservesig privatescope reqsecobj rtspecialname runtime
syn keyword ilCodeAttr		sealed serializable sequential specialname static strict synchronized
syn keyword ilCodeAttr		unmanaged unmanagedexp value virtual unicode

syn keyword ilPinvokeAttr	bestfit cdecl charmaperror fastcall lasterr nomangle on off stdcall thiscall winapi

syn keyword ilVisibility	assembly famandassem family famorassem private public

syn keyword	ilOpcode		nop break ldarg.0 ldarg.1 ldarg.2 ldarg.3 ldloc.0 ldloc.1 ldloc.2 ldloc.3
syn keyword ilOpcode		stloc.0 stloc.1 stloc.2 stloc.3 ldarg.s ldarga.s starg.s ldloc.s ldloca.s
syn keyword ilOpcode		stloc.s ldnull ildc.i4 ldc.i4.m1 ldc.i4.0 ldc.i4.1 ldc.i4.2 ldc.i4.3 ldc.i4.4 ldc.i4.5
syn keyword ilOpcode		ldc.i4.6 ldc.i4.7 ldc.i4.8 ldc.i4.s ldc.i4 ldc.i8 ldc.r4 ldc.r8 dup pop jmp
syn keyword ilOpcode		call calli ret br.s brfalse.s brtrue.s beq.s bge.s bgt.s ble.s blt.s bne.un.s
syn keyword ilOpcode		bge.un.s bgt.un.s ble.un.s blt.un.s br brfalse brtrue beq bge bgt ble blt bne.un
syn keyword ilOpcode		bge.un bgt.un ble.un blt.un switch ldind.i1 ldind.u1 ldind.i2 ldind.u2 ldind.i4
syn keyword ilOpcode		ldind.u4 ldind.i8 ldind.i ldind.r4 ldind.r8 ldind.ref stind.ref stind.i1 stind.i2
syn keyword ilOpcode		stind.i4 stind.i8 stind.r4 stind.r8 add sub mul div div.un rem rem.un and or xor
syn keyword ilOpcode		shl shr shr.un neg not conv.i1 conv.i2 conv.i4 conv.i8 conv.r4 conv.r8 conv.u4
syn keyword ilOpcode		conv.u8 callvirt cpobj ldobj ldstr newobj castclass isinst conv.r.un unbox throw
syn keyword ilOpcode		ldfld ldflda stfld ldsfld ldsflda stsfld stobj conv.ovf.i1.un conv.ovf.i2.un
syn keyword ilOpcode		conv.ovf.i4.un conv.ovf.i8.un conv.ovf.u1.un conv.ovf.u2.un conv.ovf.u4.un
syn keyword ilOpcode		conv.ovf.u8.un conv.ovf.i.un conv.ovf.u.un box newarr ldlen ldelema ldelem.i1
syn keyword ilOpcode		ldelem.u1 ldelem.i2 ldelem.u2 ldelem.i4 ldelem.u4 ldelem.i8 ldelem.i ldelem.r4
syn keyword ilOpcode		ldelem.r8 ldelem.ref stelem.i stelem.i1 stelem.i2 stelem.i4 stelem.i8 stelem.r4
syn keyword ilOpcode		stelem.r8 stelem.ref ldelem stelem unbox.any conv.ovf.i1 conv.ovf.u1 conv.ovf.i2
syn keyword ilOpcode		conv.ovf.u2 conv.ovf.i4 conv.ovf.u4 conv.ovf.i8 conv.ovf.u8 refanyval ckfinite
syn keyword ilOpcode		mkrefany ldtoken conv.u2 conv.u1 conv.i conv.ovf.i conv.ovf.u add.ovf add.ovf.un
syn keyword ilOpcode		mul.ovf mul.ovf.un sub.ovf sub.ovf.un endfinally leave leave.s stind.i conv.u
syn keyword ilOpcode		ref arglist ceq cgt cgt.un clt clt.un ldftn ldvirtftn ldarg ldarga starg ldloc
syn keyword ilOpcode		ldloca stloc localloc endfilter unaligned volatile tail initobj constrained
syn keyword ilOpcode		cpblk initblk rethrow sizeof refanytype readonly brnull brnull.s brzero brzero.s
syn keyword ilOpcode		brinst brinst.s ldind.u8 ldelem.u8 ldelem.any stelem.any ldc.i4.M1 endfault

hi def link	ilLiteral		Constant
hi def link ilCharacter		Constant
hi def link ilLiteral		Constant
hi def link ilNumber		Number
hi def link ilString		String
hi def link	ilDotDirective	Keyword
hi def link ilDirective		Keyword
hi def link ilSecurity		Keyword
hi def link ilAsmAttr		Keyword
hi def link ilCodeAttr		Keyword
hi def link ilPinvokeAttr	Keyword
hi def link ilVisibility	Keyword
hi def link ilOpcode		Keyword
hi def link ilType		Type
hi def link ilComment		Comment

let	b:current_syntax="il"
let &cpo=s:il_cpo_save
unlet s:il_cpo_save
