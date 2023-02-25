trigger caseCommentTest on CaseComment(after insert) {
  system.debug('Trigger: caseCommentTest');

  //Trigger.new retorna uma lista com todos os registros novos que foram inseridos desde a chamada da trigger
  //Trigger.new[0] pega o registro mais recente
  List<CaseComment> newRegister = Trigger.new;
  CaseComment newRegister2 = Trigger.old[0];

  newRegister[0].addError('Erro ao adicionar');

  caseCommentTest.changePriority(Trigger.new);

  /**
   * ORDEM DE EXECUÇÃO
   * Carrega registro atual na base
   * System validation rules
   * Before triggers
   * Custom validation rules
   * Duplicate rules
   * Salva registro na base momentaneamente
   * After triggers
   * Assignment rules
   * Auto-response
   * Workflow rules
   * Escalation rules
   * Entitlement rules
   */

}