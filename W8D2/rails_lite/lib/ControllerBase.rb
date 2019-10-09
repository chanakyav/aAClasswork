class ControllerBase

    attr_accessor :req, :res, :already_built_response

    def initialize(req, res)
        @req = req
        @res = res
        @already_built_response = nil
    end

    def render_content(content, content_type="text/html")
        raise 'Double render error' if already_built_response
        res['Content-Type'] = content_type
        res.write(content)
        already_built_response = true
    end

    def redirect_to(url)
        raise 'Double render error' if already_built_response
        res.location = url
        res.status = 302
        @already_built_response = true
    end
end