# encoding: utf-8
require 'spec_helper'

describe DefaultGuardTestRunner do

  describe "#finished" do
    # Can't test...
    pending "with GUARD_TEST_NOTIFY=true" do
      it "should notify the results" do
        Guard::Notifier.turn_on
        Guard::Notifier.should_receive(:notify)

        system "ruby -Itest -rubygems -r #{@lib_path.join('guard/test/runners/default_guard_test_runner')} " \
        "-e \"GUARD_TEST_NOTIFY=true\" " \
        "\"#{@lib_path.join('../test/succeeding_test.rb')}\" --runner=guard-default 1>/dev/null"
      end
    end

    context "with GUARD_TEST_NOTIFY=false" do
      it "should not notify the results" do
        Guard::Notifier.turn_on
        Guard::Notifier.should_not_receive(:notify)

        system "ruby -Itest -rubygems -r #{@lib_path.join('guard/test/runners/default_guard_test_runner')} " \
        "-e \"GUARD_TEST_NOTIFY=false\" " \
        "\"#{@lib_path.join('../test/succeeding_test.rb')}\" --runner=guard-default 1>/dev/null"
      end
    end
  end

end
