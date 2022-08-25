require 'sqlite3'
require 'active_record'
require 'byebug'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'customers.sqlite3')
# Show queries in the console.
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Customer(id: integer, first: string, last: string, email: string, birthdate: datetime)
class Customer < ActiveRecord::Base
  def to_s
    "  [#{id}] #{first} #{last}, <#{email}>, #{birthdate.strftime('%Y-%m-%d')}"
  end

  ## OPTIONAL
  ## scopes are a way of reusing (and composing) common subqueries.
  scope :valid_email, -> { where('email LIKE ?', '%@%') }
  scope :born_before, -> (date) { where('birthdate < ?', Time.parse(date)) }

  def self.any_candice
    where(first: 'Candice')
  end

  def self.with_valid_email
    where('email LIKE ?', '%@%')
  end

  def self.with_dot_org_email
    where('email LIKE ?', '%.org')
  end

  def self.with_invalid_email
    where.not('email LIKE ?', '%@%')
  end

  def self.with_blank_email
    where(email: ['', nil])
  end

  def self.born_before_1980
    where('birthdate < ?', Date.new(1980, 1, 1))
  end

  def self.with_valid_email_and_born_before_1980
    # TODO: This is a good example, but the expection is too strict.
    # where('birthdate < :date AND email LIKE :email',{date: Date.new(1980, 1, 1), email: '%@%'})
    # with_valid_email.born_before_1980
    where('1').born_before('1980-01-01').and(valid_email)
  end

  def self.last_names_starting_with_b
    where('last LIKE :text', {text: 'B%'}).order(birthdate: :asc)
  end

  def self.twenty_youngest
    order(birthdate: :desc).limit(20)
  end

  def self.update_gussie_murray_birthdate
    find_by(first: 'Gussie', last: 'Murray').update(birthdate: Time.parse('2004-02-08'))
  end

  def self.change_all_invalid_emails_to_blank
    with_invalid_email.update_all(email: '')
  end

  def self.delete_meggie_herman
    find_by(first: 'Meggie', last: 'Herman').delete
  end

  def self.delete_everyone_born_before_1978
    born_before('1987-01-01').delete_all
  end

end
