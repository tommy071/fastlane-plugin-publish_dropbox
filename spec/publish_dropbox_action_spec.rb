describe Fastlane::Actions::PublishDropboxAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The publish_dropbox plugin is working!")

      Fastlane::Actions::PublishDropboxAction.run(nil)
    end
  end
end
