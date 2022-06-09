local config = require("u.config")

describe("config", function()
    describe("exists", function()
        it("should return false when an option is not set", function()
            assert.is_not.True(config.exists("foo"))
        end)
    end)

    describe("set", function()
        it("should set a config value", function()
          config.set("foo", "bar")
          assert.are.equal(config.get("foo"), "bar")
        end)
    end)

    describe("get", function()
      it("should return a default value", function()
        local default = "somedefault"
        local value = config.get("get_default", default)
        assert.are.equal(value, default)
      end)
    end)

    describe("remove", function()
      it("should remove a key", function()
        local key = "removeme"
        config.set(key, 1)
        config.remove(key)
        assert.is_not.True(config.exists(key))
      end)
    end)
end)
