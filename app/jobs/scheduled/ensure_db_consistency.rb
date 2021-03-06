module Jobs
  # various consistency checks
  class EnsureDbConsistency < Jobs::Scheduled
    every 1.day

    def execute(args)
      TopicUser.ensure_consistency!
      UserVisit.ensure_consistency!
      Group.refresh_automatic_groups!
      Notification.ensure_consistency!
      UserAction.ensure_consistency!
    end
  end
end
