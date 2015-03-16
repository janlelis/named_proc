require_relative '../lib/named_proc'

describe "proc" do
  it "creates a new proc as usual when called with a block" do
    a = proc{}
    expect( a ).to be_instance_of Proc
    expect( a ).not_to be_lambda
  end
  
  it "creates a named proc when a method gets called on it" do
    a = proc.brawl{}
    expect( a ).to be_a Proc
    expect( a ).to be_instance_of NamedProc
    expect( a ).not_to be_lambda
    expect( a.name ).to eq :brawl
  end
end

describe "lambda" do
  it "creates a new lambda as usual when called with a block" do
    a = lambda{}
    expect( a ).to be_instance_of Proc
    expect( a ).to be_lambda
  end
  
  it "creates a named lambda when a method gets called on it" do
    a = lambda.brawl{}
    expect( a ).to be_a Proc
    expect( a ).to be_instance_of NamedProc
    expect( a ).to be_lambda
    expect( a.name ).to eq :brawl
  end
end
