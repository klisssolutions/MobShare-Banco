DELIMITER $
create trigger t_geracao_conta_receber_pagar after insert on locacao
for each row
begin

	
    declare receber float;
    declare pagar float;
    declare banco int;
    declare porcentagem_empresa float;
    
    
    set banco = (select idBanco from banco where receiver = 1);
    
    set porcentagem_empresa = (select distinct cv.porcentagemGanhoEmpresa from solicitacao_locacao as sl join locacao as l 
    on sl.idSolicitacao_locacao = l.idSolicitacao_locacao join veiculo as v on v.idVeiculo = sl.idVeiculo 
    join categoria_veiculo as cv on cv.idCategoria_veiculo = v.idCategoria_veiculo  where v.idVeiculo = 
    (select sl.idVeiculo from solicitacao_locacao as sl join locacao as l on l.idSolicitacao_locacao = sl.idSolicitacao_locacao 
    where l.idLocacao = new.idLocacao));
    
    
    
	set receber =  new.valor;
    
    
    insert into conta_receber(vencimento, idBanco, valor, idLocacao) 
    values(DATE_ADD(CURDATE(), INTERVAL 30 DAY), banco, receber, NEW.idLocacao);
    
    set pagar = receber - ((receber * porcentagem_empresa)/100 );
    
    insert into conta_pagar( valor, vencimento, idBanco) values( pagar, DATE_ADD(CURDATE(), INTERVAL 30 DAY), banco);

end$
DELIMITER ; 





DELIMITER $
create trigger t_criacao_locacao after update on  solicitacao_locacao
for each row
begin

	declare valor float;
	set valor = (select ((select v.valorHora from veiculo as v where v.idVeiculo = NEW.idVeiculo) * 
    CEILING(TIMESTAMPDIFF(MINUTE, new.horarioInicio, new.horarioFim)/60)));
    
     

	if(OLD.confirmLocador is null and NEW.confirmLocador = 1) then
		insert into locacao(idSolicitacao_locacao, valor) values(OLD.idSolicitacao_Locacao, valor);
	end if;
		
end$
DELIMITER ;



DELIMITER $
create trigger t_baixa_conta_receber after update on conta_receber
for each row
begin

	
    declare saldo_atual float;
    set saldo_atual = (select saldo from banco where idBanco = new.idBanco);

	if(old.paga is null and new.paga = 1) then
    
		update banco set saldo = (saldo_atual + new.valor) where idBanco = new.idBanco;
    
    end if;
    

	

end$
DELIMITER ;



DELIMITER $
create trigger t_baixa_conta_pagar after update on conta_pagar
for each row
begin

	
    declare saldo_atual float;
    set saldo_atual = (select saldo from banco where idBanco = new.idBanco);

	if(old.paga is null and new.paga = 1) then
    
		update banco set saldo = (saldo_atual - new.valor) where idBanco = new.idBanco;
    
    end if;
    

	

end$
DELIMITER ;