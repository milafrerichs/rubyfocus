class Rubyfocus::ContextsTasks < Rubyfocus::Item
  include Rubyfocus::Parser
  def self.matches_node?(node)
    return (node.name == "task-to-tag")
  end

  attr_accessor :task_id, :context_id, :task_rank, :context_rank

  def apply_xml(n)
    super(n)
    conditional_set(:context_id, n.at_xpath("xmlns:context")) { |e| e["idref"] }
    conditional_set(:task_id, n.at_xpath("xmlns:task")) { |e| e["idref"] }
		conditional_set(:task_rank, n.at_xpath("xmlns:rank-in-task")){ |e| e.inner_html.to_i }
		conditional_set(:context_rank, n.at_xpath("xmlns:rank-in-tag")){ |e| e.inner_html }
  end

  def context
    document.contexts.find(self.context_id)
  end

  def task
    document.tasks.find(self.task_id)
  end

end
