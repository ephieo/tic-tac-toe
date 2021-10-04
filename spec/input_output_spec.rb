require 'rspec'
require 'simplecov'
SimpleCov.start
require_relative '../lib/input_output'

describe InputOutput do
  subject(:input_output) { described_class.new }

  before do
    # allow($stdout).to receive(:write)
    allow(input_output).to receive(:write)
  end

  # stdin is using gets to read the input and
  # and stdout is using write to output (write to CLI)
  it 'gets a move from a player' do
    allow(input_output).to receive(:gets).and_return('3')

    expect do
      input_output.get_move
    end.to output("Enter the number for where you want to play your marker below [0-8]:\n").to_stdout
    expect(input_output.get_move).to eq(3)
  end

  it 'takes a string as an output and prints it out to the terminal' do
    string = 'Hello World !'
    expect do
      input_output.print(string)
    end.to output("Hello World !\n").to_stdout
    # expect(input_output.print(string)).to eq("Hello World !\n")
  end
end
