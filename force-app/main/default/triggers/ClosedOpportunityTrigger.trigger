trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
  List<Task> listTasks = new List<Task>();
  for (Opportunity opp : Trigger.new) {
    if (opp.StageName == 'Closed Won') {
      Task newTask = new Task(Subject='Follow Up Test Task', WhatId=opp.Id);
      listTasks.add(newTask);
    }
  }
  upsert listTasks;
}