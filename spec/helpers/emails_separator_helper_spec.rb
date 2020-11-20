require "rails_helper"

describe EmailsSeparatorHelper do
  describe "#separate_emails" do
    context "one email" do
      it do
        emails = "test@test.com"
        expect(helper.separate_emails(emails)).to eql([emails])
      end
    end

    context "multiply emails" do
      context "using comma as separator" do
        it do
          emails = "test@test.com, test1@test.com"
          expect(helper.separate_emails(emails)).to eql(["test@test.com", "test1@test.com"])
        end
      end

      context "using new line as separator" do
        it do
          emails = "test@test.com\ntest1@test.com"
          expect(helper.separate_emails(emails)).to eql(["test@test.com", "test1@test.com"])
        end
      end

      context "using new line and comma as separator" do
        it do
          emails = "test@test.com, test2@test.com\ntest1@test.com"
          expect(helper.separate_emails(emails)).to eql(["test@test.com", "test2@test.com", "test1@test.com"])
        end
      end

      context "with whitespace" do
        it do
          emails = "test@test.com,     test1@test.com"
          expect(helper.separate_emails(emails)).to eql(["test@test.com", "test1@test.com"])
        end
      end
    end
  end
end
