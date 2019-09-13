require "tdd"

RSpec.describe "tdd" do
  
  describe "#my_uniq" do

    it "should raise error when no arg given" do 
      expect{ my_uniq }.to raise_error(ArgumentError)
    end

    it "should remove duplicates" do 
      expect(my_uniq([1, 2, 3, 3, 2, 1, 5, 6])).to eq([1, 2, 3, 5, 6])
    end
  end

  describe "Array#two_sum" do 

    let(:arr) { [-1, 0, 2, -2, 1]  }

    it "should find pairs of indexes where elements sum to zero" do
      expect(arr.two_sum).to eq([[0,4], [2,3]])
    end

    it "should not duplicate pairs of indexes with same elements" do
      expect(arr.two_sum).to_not eq( [[0,4], [2,3], [3,2], [4,0] ] )
    end

    it "should return pairs sorted smaller index to larger index" do
      expect(arr.two_sum).to_not eq([[4,0], [3,2]])
    end

  end

  describe "#my_transpose" do

    let(:rows) {[
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8]
              ]}
    
    let(:cols) {[
                [0, 3, 6],
                [1, 4, 7],
                [2, 5, 8]
              ]}

    it "should transpose rows to columns" do     
      expect(my_transpose(rows)).to eq(cols)
    end

    it "should return a 2D array" do
      answer = my_transpose(rows)
      row_length = answer.length 
      col_length = answer[0].length
      expect(row_length).to eq(rows.length)
      expect(col_length).to eq(rows[0].length)
    end

  end

  describe "#stock_picker" do

    let(:stocks) { [10,11,10.3,11.2,1100,10,2] }

    it "should return the pair of indices with the biggest difference in price" do
      expect(stock_picker(stocks)).to eq([0,4])
    end

    it "should check that the stock was purchased before it was sold" do 
      expect(stock_picker(stocks)).to_not eq ([4,6])
    end

  end

end

