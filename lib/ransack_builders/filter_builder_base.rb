# frozen_string_literal: true

module RansackBuilders
  class FilterBuilderBase
    class << self
      # @param path [Array<Symbol>]
      # @param block [Proc]
      def filter_for(path, &block)
        filter_builders[path] = block
      end

      # @return [Hash]
      def filter_builders
        @_filter_builders ||= {}
      end
    end

    # @!attribute [r] params
    #   @return [Hash]
    attr_reader :params

    # @param raw_params [Hash]
    def initialize(raw_params)
      @params = raw_params.deep_dup
      @params[:filter] ||= {}
    end

    def call
      self.class.filter_builders.each do |path, transformer|
        parent, key = traverse_to_key(params, path)

        if parent && parent[key]
          new_key_name = transformer.call(key)
          params[:filter][new_key_name] = parent.delete(key)
        end
      end

      params
    end

    private

    # @param hash [Hash] - The hash we are traversing
    # @param path [Array<Symbol>] - The array representing the path to the key
    # @return [Array] - The parent hash and the final key
    def traverse_to_key(hash, path)
      *initial_keys, final_key = path

      parent =
        if initial_keys.any?
          hash.dig(*initial_keys)
        else
          hash
        end

      [parent, final_key]
    end
  end
end
