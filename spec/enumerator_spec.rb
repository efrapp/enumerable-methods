require('./lib/Enumerator.rb')

describe Enumerable do
  let(:ary){ [1, 3, 2, 5, 6, 5, 7] }
  let(:response_ary){ [] }

  describe "my_each" do
    it "returns the values of the arry" do
      ary.my_each{|i| response_ary << i}
      expect(response_ary).to eq [1, 3, 2, 5, 6, 5, 7]
    end

    it "returns an empty array" do
      [].my_each{|i| response_ary << i}
      expect(response_ary).to eq []
    end
  end

  describe "my_each_with_index" do
    it "returns the indexes of the array" do
      ary.my_each_with_index{|value, i| response_ary << i}
      expect(response_ary).to eq [0, 1, 2, 3, 4, 5, 6]
    end

    it "returns the values of the arry" do
      ary.my_each_with_index{|value, i| response_ary << value}
      expect(response_ary).to eq [1, 3, 2, 5, 6, 5, 7]
    end

    it "returns an empty array" do
      [].my_each_with_index{|value, i| response_ary << value}
      expect(response_ary).to eq []
    end
  end

  describe "my_select" do
    it "returns the value greater than or equal to 5" do
      response_ary = ary.my_select{|value| value >= 5}
      expect(response_ary).to eq [5, 6, 5, 7]
    end

    it "returns an empty array" do
      response_ary = [].my_select{|value| value}
      expect(response_ary).to eq []
    end
  end

  describe "my_all?" do
    it "returns true if all values are integers" do
      response_ary = ary.my_all?{|value| value.is_a? Numeric}
      expect(response_ary).to be true
    end

    it "returns false if just one value is different from String" do
      ary = ['a', 'b', 'c', 1]
      response_ary = ary.my_all?{|value| value.is_a? String}
      expect(response_ary).to be false
    end

    it "returns false if just one value is different from String" do
      ary = [1, 3, 2, 5, 6, 5, 'a']
      response_ary = ary.my_all?{|value| value.is_a? String}
      expect(response_ary).to be false
    end

    it "returns true on empty array" do
      response_ary = [].my_all?{|value| value}
      expect(response_ary).to be true
    end
  end

  describe "my_any?" do
    it "returns true if at least one value is string" do
      ary = [1, 3, 2, 5, 6, 5, 'a']
      response_ary = ary.my_any?{|value| value.is_a? String}
      expect(response_ary).to be true
    end

    it "returns true if at least one value is string" do
      ary = ['b', 'c', 'd', 'e', 'f', 'g', 'a']
      response_ary = ary.my_any?{|value| value.is_a? String}
      expect(response_ary).to be true
    end

    it "returns false if all of them are numeric values" do
      ary = [1, 3, 2, 5, 6, 5]
      response_ary = ary.my_any?{|value| value.is_a? String}
      expect(response_ary).to be false
    end

    it "returns false on empty array" do
      response_ary = [].my_any?{|value| value}
      expect(response_ary).to be false
    end
  end

  describe "my_none?" do
    it "returns true if none of them are strings" do
      ary = [1, 3, 2, 5, 6, 5]
      response_ary = ary.my_none?{|value| value.is_a? String}
      expect(response_ary).to be true
    end

    it "returns false if at least one value is string" do
      ary = ['b', 'c', 'd', 'e', 'f', 'g', 'a']
      response_ary = ary.my_any?{|value| value.is_a? String}
      expect(response_ary).to be true
    end

    it "returns false if at least on value is numeric" do
      ary = [1, 3, 2, 5, 6, 5, 'a']
      response_ary = ary.my_none?{|value| value.is_a? Numeric}
      expect(response_ary).to be false
    end

    it "returns true on empty array" do
      response_ary = [].my_none?{|value| value}
      expect(response_ary).to be true
    end
  end
end