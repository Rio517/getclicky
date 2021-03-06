require "spec_helper"

describe Getclicky::Response do
  subject {
    Getclicky::Response.new([{
      "type"=>"pages",
      "dates"=>
        [{"date"=>"2011-09-27",
          "items"=>
          [{"value"=>"6",
            "value_percent"=>"66.7",
            "title"=>"Test Page",
            "stats_url"=>"http://getclicky.com/stats/visitors",
            "url"=>"http://blackbookemg.dev/posts"},
          {"value"=>"1",
            "value_percent"=>"11.1",
            "title"=>"Test Page 2",
            "stats_url"=>
            "http://getclicky.com/stats/visitors",
            "url"=>"http://blackbookemg.dev/requests/1"}
          ]}
        ]
      }])
  }
  
  its(:item) { should be_an_instance_of Array }
  its(:data) { should be_an_instance_of Array }
  
  context "when using" do
    it "should return an array of Hashie objects" do
      subject.data.each do |d|
        d.should be_an_instance_of Hashie::Mash
      end
    end
  end
end