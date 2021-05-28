Library IEEE;
Use IEEE.std_logic_1164.all;

Entity bSM is
	Port(X: in std_logic;
		Y: in std_logic_vector(1 downto 0);
		f:out std_logic);
End bSM;

Architecture behv of bSM is
Type allState is(BSL,YK,DRL,SKM);
Signal dNow:allState:=BSL;
Begin
Process(X)
Begin
If(Rising_edge(X)) then
Case dNow is
When BSL=>
If(Y="00") Then
f<='0'; dNow<=YK;
Elsif(Y="01") Then
f<='0'; dNow<=DRL;
Elsif(Y="10") Then
f<='0'; dNow<=SKM;
End if;
When YK=>
If(Y="01") Then
f<='0'; dNow<=DRL;
End if;
When DRL=>
If(Y="10") Then
f<='0'; dNow<=SKM;
End if;
When SKM=> 
f<='1';
End case;
End if;
End process;
End behv;
