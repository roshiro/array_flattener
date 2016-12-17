require_relative '../lib/array_flattener'

describe ArrayFlattener do
  describe '.flatten' do
    [
      { ctx: 'when array is nil', expect: 'returns empty array',
        array_test: nil, expected_result: [] },
      { ctx: 'when array is empty', expect: 'returns empty array',
        array_test: [], expected_result: [] },
      { ctx: 'when array is flat', expect: 'returns the same array',
        array_test: [1, 2, 3, 4], expected_result: [1, 2, 3, 4] },
      { ctx: 'when array has one nested array', expect: 'flattens the array',
        array_test: [1, 2, [ 3, 4 ]], expected_result: [1, 2, 3, 4] },
      { ctx: 'when array two one nested arrays', expect: 'flattens the array',
        array_test: [[1, 2], [3, 4], 5], expected_result: [1, 2, 3, 4, 5] },
      { ctx: 'when array two levels of nesting', expect: 'flattens the array',
        array_test: [1, [2 , [3, 4], 5]], expected_result: [1, 2, 3, 4, 5] },
      { ctx: 'when array three levels of nesting', expect: 'flattens the array',
        array_test: [1, [2, [3, [4, 5]]], [6, 7]], expected_result: [1, 2, 3, 4, 5, 6, 7] },
      { ctx: 'when array many nested arrays of arrays', expect: 'flattens the array',
        array_test: [1, [2, [3, [4]], 5], 6, [7, 8], 9, [10, [11, [12]]], 13],
        expected_result: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13] },
      { ctx: 'when array has many items and many arrays of arrays', expect: 'flattens the array',
        array_test: [1, 2, [ *3..50 ], [[[51, *52..1000]]]],
        expected_result: [*1..1000] }
    ].each do |test_params|
      context "#{test_params[:ctx]}" do
        it "#{test_params[:expect]}" do
          expect(described_class.flatten(test_params[:array_test])).to eq(test_params[:expected_result])
        end
      end
    end
  end
end
