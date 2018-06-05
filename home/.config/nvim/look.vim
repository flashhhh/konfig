" Enable syntax highlighting
syntax enable
let g:solarized_contrast="low"
let g:solarized_termtrans=0
set background=dark
colorscheme solarized

set statusline+=%#StatusLineNC#
set statusline+=\ %f\ %r\ %q
set statusline+=%=
set statusline+=%#Search#
set statusline+=\ %l:%v/%L
set statusline+=\ %#ErrorMsg#
set statusline+=\ %{ale#statusline#Count(bufnr('')).error}
set statusline+=\ |

function! PhpSyntaxOverride()
  hi! def link phpParent      None
  hi! def link phpIdentifier  None
  hi! def link phpVarSelector None
endfunction

augroup PhpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

function! TypescriptSyntaxOverride()
  hi! def link typescriptReserved             None
  hi! def link typescriptEndColons            None
  hi! def link typescriptSymbols              None
  hi! def link typescriptBraces               None
  hi! def link typescriptParens               None
  hi! def link typescriptComment              Comment
  hi! def link typescriptLineComment          Comment
  hi! def link typescriptDocComment           Comment
  hi! def link typescriptCommentTodo          Comment
  hi! def link typescriptRef                  None
  hi! def link typescriptDocNotation          None
  hi! def link typescriptDocTags              None
  hi! def link typescriptDocNGParam           None
  hi! def link typescriptDocParam             None
  hi! def link typescriptDocNumParam          None
  hi! def link typescriptDocEventRef          None
  hi! def link typescriptDocNamedParamType    None
  hi! def link typescriptDocParamName         None
  hi! def link typescriptDocParamType         None
  hi! def link typescriptString               String
  hi! def link typescriptStringLiteralType    String
  hi! def link typescriptStringMember         String
  hi! def link typescriptTemplate             String
  hi! def link typescriptEventString          String
  hi! def link typescriptASCII                None
  hi! def link typescriptTemplateSB           None
  hi! def link typescriptRegexpString         String
  hi! def link typescriptGlobal               None
  hi! def link typescriptPrototype            None
  hi! def link typescriptConditional          Keyword
  hi! def link typescriptConditionalElse      Keyword
  hi! def link typescriptCase                 None
  hi! def link typescriptDefault              None
  hi! def link typescriptBranch               None
  hi! def link typescriptIdentifier           None
  hi! def link typescriptVariable             None
  hi! def link typescriptEnumKeyword          None
  hi! def link typescriptRepeat               None
  hi! def link typescriptForOperator          None
  hi! def link typescriptStatementKeyword     Keyword
  hi! def link typescriptMessage              None
  hi! def link typescriptOperator             None
  hi! def link typescriptKeywordOp            None
  hi! def link typescriptCastKeyword          None
  hi! def link typescriptType                 Type
  hi! def link typescriptNull                 String
  hi! def link typescriptNumber               String
  hi! def link typescriptExponent             None
  hi! def link typescriptBoolean              String
  hi! def link typescriptObjectLabel          None
  hi! def link typescriptLabel                None
  hi! def link typescriptStringProperty       String
  hi! def link typescriptImport               None
  hi! def link typescriptAmbientDeclaration   None
  hi! def link typescriptExport               None
  hi! def link typescriptModule               None
  hi! def link typescriptTry                  None
  hi! def link typescriptExceptions           None
  hi! def link typescriptMember              Function
  hi! def link typescriptMethodAccessor       None
  hi! def link typescriptAsyncFuncKeyword     None
  hi! def link typescriptAsyncFor             None
  hi! def link typescriptFuncKeyword          None
  hi! def link typescriptAsyncFunc            None
  hi! def link typescriptArrowFunc            None
  hi! def link typescriptFuncName             None
  hi! def link typescriptFuncArg              None
  hi! def link typescriptArrowFuncArg         None
  hi! def link typescriptFuncComma            None
  hi! def link typescriptClassKeyword         None
  hi! def link typescriptClassExtends         None
  hi! def link typescriptClassName            Type
  hi! def link typescriptAbstract             None
  hi! def link typescriptClassHeritage        Type
  hi! def link typescriptInterfaceHeritage    Type
  hi! def link typescriptClassStatic          None
  hi! def link typescriptInterfaceKeyword     None
  hi! def link typescriptInterfaceExtends     None
  hi! def link typescriptInterfaceName        None
  hi! def link shellbang                      None
  hi! def link typescriptTypeParameter         Type
  hi! def link typescriptConstraint            None
  hi! def link typescriptPredefinedType        Type
  hi! def link typescriptUnion                 None
  hi! def link typescriptFuncTypeArrow         None
  hi! def link typescriptConstructorType       None
  hi! def link typescriptTypeQuery             None
  hi! def link typescriptAccessibilityModifier None
  hi! def link typescriptOptionalMark          None
  hi! def link typescriptFuncType              None
  hi! def link typescriptMappedIn              None
  hi! def link typescriptCall                  None
  hi! def link typescriptParamImpl             None
  hi! def link typescriptConstructSignature    None
  hi! def link typescriptAliasDeclaration      None
  hi! def link typescriptAliasKeyword          None
  hi! def link typescriptUserDefinedType       None
  hi! def link typescriptTypeReference         Type
  hi! def link typescriptConstructor           None
  hi! def link typescriptDecorator             None
endfunction

augroup TypescriptSyntaxOverride
  autocmd!
  autocmd FileType typescript call TypescriptSyntaxOverride()
augroup END

hi! def link BufTabLineCurrent StatusLine
hi! def link BufTabLineFill    None
hi! def link BufTabLineActive  StatusLineNC
hi! def link BufTabLineHidden  StatusLineNC

hi! def link CursorLine StatusLineNC
