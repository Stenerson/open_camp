require "spec_helper"

describe TaskMailer do
  describe "task_creation" do
    let(:mail) { TaskMailer.task_creation }

    it "renders the headers" do
      mail.subject.should eq("Task creation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
