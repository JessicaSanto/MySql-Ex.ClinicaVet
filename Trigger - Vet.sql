USE db_clinica;

ALTER TABLE tb_pets ADD idade INT(3);

-- ******************************* Trigger: Calcular Idade e Armazenar no Campo idade -- **********************************

-- CREATE DEFINER=`root`@`localhost` TRIGGER `tb_pets_BEFORE_INSERT` BEFORE INSERT ON `tb_pets` FOR EACH ROW BEGIN
 --   SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE());
-- END


-- ****************************** Trigger para notificar quando um cliente cadastrar mais de 5 pets *******************************
-- CREATE DEFINER=`root`@`localhost` TRIGGER `tb_pets_AFTER_INSERT` AFTER INSERT ON `tb_pets` FOR EACH ROW BEGIN
  --  DECLARE pet_count INT;
    
    -- Verificar quantos pets o cliente possui
  --  SELECT COUNT(*) INTO pet_count
  --  FROM tb_pets
  --  WHERE id_cliente = NEW.id_cliente;
    
    -- Se o cliente tiver mais de 5 pets, criar notificação
 --   IF pet_count > 5 THEN
   --     INSERT INTO Notificacoes (id_cliente, mensagem)
     --   VALUES (NEW.id_cliente, 'Você tem mais de 5 pets cadastrados na clínica.');
  --  END IF;
-- END


-- ****************************** Trigger para impedir exclusão de veterinário com atendimentos  *******************************
-- CREATE TRIGGER trg_no_delete_veterinario
-- BEFORE DELETE ON Veterinarios
-- FOR EACH ROW
-- BEGIN
   --  DECLARE atendimento_count INT;
    
    -- Verificar se o veterinário tem atendimentos
  --   SELECT COUNT(*) INTO atendimento_count
 --    FROM Atendimentos
  --   WHERE id_veterinario = OLD.id_veterinario;
    
    -- Se houver atendimentos, impede a exclusão
  --   IF atendimento_count > 0 THEN
     --    SIGNAL SQLSTATE '45000'
      --   SET MESSAGE_TEXT = 'Não é possível excluir o veterinário, pois ele tem atendimentos registrados.';
  --   END IF;
--  END$$

