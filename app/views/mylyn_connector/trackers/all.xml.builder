xml.instruct! :xml, :encoding => "UTF-8"
xml.trackers :xmlns => 'http://redmin-mylyncon.sf.net/api', :api=>api_version do
  @trackers.each do |tracker|
    xml.tracker :id => tracker.id do
      xml.name tracker.name
      xml.position tracker.position
    end
  end
end