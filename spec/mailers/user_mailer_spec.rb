require 'spec_helper'

describe UserMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  describe '.invite_requested' do
    let(:contact_message) { Factory.build :contact_message, :email => 'someone@someco.com' }

    describe 'one email to one user' do
      subject { InviteMailer.invite_requested(invite) }
      it { should deliver_to     invite.email                                                  }
      it { should deliver_from   'alex@awesome-startup.com'                                    }
    end
  end
end