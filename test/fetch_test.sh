. ./test/helper.sh

setUp()
{
	RUBY=ruby
}

test_fetch()
{
	local key="1.8.7"
	local expected="1.8.7-p371"
	local value=$(fetch "$RUBY/versions" "$key")

	assertEquals "did not fetch the correct value" "$expected" "$value"
}

test_fetch_with_excess_whitespace()
{
	local key="ruby-1.8.7-p371.tar.bz2"
	local expected="c27526b298659a186bdb5107fcec2341"
	local value=$(fetch "$RUBY/md5" "$key")

	assertEquals "did not fetch the correct value" "$expected" "$value"
}

test_fetch_with_unknown_key()
{
	local key="foo"
	local expected=""
	local value=$(fetch "$RUBY/versions" "$key")

	assertEquals "returned the wrong value" "$expected" "$value"
}

SHUNIT_PARENT=$0 . $SHUNIT2
