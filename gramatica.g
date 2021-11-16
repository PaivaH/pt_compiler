class MeuParser extends Parser;
{
	java.util.HashMap<String, String> mapaVar;
}

prog      : 
          { 
               System.out.println("Inicio do programa");
               mapaVar = new java.util.HashMap<String, String>(); 
          }
          "inicio" declara bloco 
		;

declara   : 
          "declara" 
          T_Id {mapaVar.put(LT(0).getText(), LT(0).getText());}
          ( 
               T_virg 
               T_Id {
                    System.out.println("Declaracao de variavel");
                    mapaVar.put(LT(0).getText(), LT(0).getText());
                    }
          )* 
          T_pontovirgula 
		;

bloco     : (cmd)+ "fim"
          {
               System.out.println("Fim do programa");
          }
          ;

cmd       : cmdLeia     T_pontovirgula  
		    | cmdEscr   T_pontovirgula
		    | cmdAttr   T_pontovirgula
            | cmdSe     T_pontovirgula
            | cmdPara   T_pontovirgula
            ;   
        

cmdLeia   : "leia" T_ap 
          T_Id {
               System.out.println("Execucao do comando leia");
               if (mapaVar.get(LT(0).getText()) == null){
                    throw new RuntimeException("ERROR ID "+LT(0).getText()+" not declared!");
               }
          } 
          T_fp
		;

cmdEscr   : "escreva" T_ap ( 
               T_texto 
               | T_Id {
                    System.out.println("Execucao do comando escreva");
                    if (mapaVar.get(LT(0).getText()) == null){
                         throw new RuntimeException("ERROR ID "+LT(0).getText()+" not declared!");
                    }
               }  
           ) T_fp
		;

cmdAttr   : T_Id{
               System.out.println("Execucao de atribuicao");
	          if (mapaVar.get(LT(0).getText()) == null){
                    throw new RuntimeException("ERROR ID "+LT(0).getText()+" not declared!");
               }
          } 
          T_attr 
          expr
		;

cmdSe   : "se" T_ap logica T_fp
          {
               System.out.println("Execucao estrutura condicional");
          }
		;

cmdPara   : "para" T_ap fator T_pontovirgula logica T_pontovirgula expr T_fp
          {
               System.out.println("Execucao estrutura de repticao");
          }
		;

logica    : fator (T_maior | T_menor | T_igual | T_dif) fator
          ;

expr      :  termo (( T_soma | T_subt ) termo)*
		;

termo     :  fator (( T_mult | T_divi ) fator)*
		;

fator     :  T_Id 
          {
               if (mapaVar.get(LT(0).getText()) == null){
                    throw new RuntimeException("ERROR ID "+LT(0).getText()+" not declared!");
               }
          }  
          | T_num 
          | T_ap expr T_fp
		;



class MeuLexer extends Lexer;
options{
	caseSensitive = true;
}

T_Id	     : ('a'..'z' | 'A'..'Z') ('a'..'z'| 'A'..'Z'| '0'..'9')*
		;

T_num	: ('0'..'9')+
		;

T_soma    : '+'
		;

T_subt    : '-'
		;

T_mult    : '*'
		;

T_divi    : '/'
		;

T_maior   : ">"
          ;

T_menor   : "<"
          ;

T_igual   : "=="
          ;

T_dif   : "!="
          ;

T_virg    : ','
		;

T_pontovirgula  : ';'
		;

T_ap	     : '('
		;

T_fp      : ')'
		;

T_texto   : '"' ( 'a'..'z' | '0'..'9' | ' ' | 'A'..'Z' )+ '"'
		;

T_attr    : ":="
		;

T_blank   : ( ' ' | '\n' {newline();}| '\r' | '\t') {_ttype=Token.SKIP;}
	     ;