      # Specifies a many-to-many relationship with another class. This associates two classes via an
      # intermediate join table. Unless the join table is explicitly specified as an option, it is
      # guessed using the lexical order of the class names. So a join between Developer and Project
      # will give the default join table name of "developers_projects" because "D" precedes "P" alphabetically.
      # Note that this precedence is calculated using the <tt><</tt> operator for String. This
      # means that if the strings are of different lengths, and the strings are equal when compared
      # up to the shortest length, then the longer string is considered of higher
      # lexical precedence than the shorter one. For example, one would expect the tables "paper_boxes" and "papers"
      # to generate a join table name of "papers_paper_boxes" because of the length of the name "paper_boxes",
      # but it in fact generates a join table name of "paper_boxes_papers". Be aware of this caveat, and use the
      # custom <tt>:join_table</tt> option if you need to.
      # If your tables share a common prefix, it will only appear once at the beginning. For example,
      # the tables "catalog_categories" and "catalog_products" generate a join table name of "catalog_categories_products".
      #
      # The join table should not have a primary key or a model associated with it. You must manually generate the
      # join table with a migration such as this:
      #
      #   class CreateDevelopersProjectsJoinTable < ActiveRecord::Migration
      #     def change
      #       create_table :developers_projects, id: false do |t|
      #         t.integer :developer_id
      #         t.integer :project_id
      #       end
      #     end
      #   end
      #
      # It's also a good idea to add indexes to each of those columns to speed up the joins process.
      # However, in MySQL it is advised to add a compound index for both of the columns as MySQL only
      # uses one index per table during the lookup.
      #
      # Adds the following methods for retrieval and query:
      #
      # [collection(force_reload = false)]
      #   Returns an array of all the associated objects.
      #   An empty array is returned if none are found.
      # [collection<<(object, ...)]
      #   Adds one or more objects to the collection by creating associations in the join table
      #   (<tt>collection.push</tt> and <tt>collection.concat</tt> are aliases to this method).
      #   Note that this operation instantly fires update SQL without waiting for the save or update call on the
      #   parent object, unless the parent object is a new record.
      # [collection.delete(object, ...)]
      #   Removes one or more objects from the collection by removing their associations from the join table.
      #   This does not destroy the objects.
      # [collection.destroy(object, ...)]
      #   Removes one or more objects from the collection by running destroy on each association in the join table, overriding any dependent option.
      #   This does not destroy the objects.
      # [collection=objects]
      #   Replaces the collection's content by deleting and adding objects as appropriate.
      # [collection_singular_ids]
      #   Returns an array of the associated objects' ids.
      # [collection_singular_ids=ids]
      #   Replace the collection by the objects identified by the primary keys in +ids+.
      # [collection.clear]
      #   Removes every object from the collection. This does not destroy the objects.
      # [collection.empty?]
      #   Returns +true+ if there are no associated objects.
      # [collection.size]
      #   Returns the number of associated objects.
      # [collection.find(id)]
      #   Finds an associated object responding to the +id+ and that
      #   meets the condition that it has to be associated with this object.
      #   Uses the same rules as <tt>ActiveRecord::Base.find</tt>.
      # [collection.exists?(...)]
      #   Checks whether an associated object with the given conditions exists.
      #   Uses the same rules as <tt>ActiveRecord::Base.exists?</tt>.
      # [collection.build(attributes = {})]
      #   Returns a new object of the collection type that has been instantiated
      #   with +attributes+ and linked to this object through the join table, but has not yet been saved.
      # [collection.create(attributes = {})]
      #   Returns a new object of the collection type that has been instantiated
      #   with +attributes+, linked to this object through the join table, and that has already been
      #   saved (if it passed the validation).
      #
      # (+collection+ is replaced with the symbol passed as the first argument, so
      # <tt>has_and_belongs_to_many :categories</tt> would add among others <tt>categories.empty?</tt>.)
      #
      # === Example
      #
      # A Developer class declares <tt>has_and_belongs_to_many :projects</tt>, which will add:
      # * <tt>Developer#projects</tt>
      # * <tt>Developer#projects<<</tt>
      # * <tt>Developer#projects.delete</tt>
      # * <tt>Developer#projects.destroy</tt>
      # * <tt>Developer#projects=</tt>
      # * <tt>Developer#project_ids</tt>
      # * <tt>Developer#project_ids=</tt>
      # * <tt>Developer#projects.clear</tt>
      # * <tt>Developer#projects.empty?</tt>
      # * <tt>Developer#projects.size</tt>
      # * <tt>Developer#projects.find(id)</tt>
      # * <tt>Developer#projects.exists?(...)</tt>
      # * <tt>Developer#projects.build</tt> (similar to <tt>Project.new("developer_id" => id)</tt>)
      # * <tt>Developer#projects.create</tt> (similar to <tt>c = Project.new("developer_id" => id); c.save; c</tt>)
      # The declaration may include an options hash to specialize the behavior of the association.
      #
      # === Options
      #
      # [:class_name]
      #   Specify the class name of the association. Use it only if that name can't be inferred
      #   from the association name. So <tt>has_and_belongs_to_many :projects</tt> will by default be linked to the
      #   Project class, but if the real class name is SuperProject, you'll have to specify it with this option.
      # [:join_table]
      #   Specify the name of the join table if the default based on lexical order isn't what you want.
      #   <b>WARNING:</b> If you're overwriting the table name of either class, the +table_name+ method
      #   MUST be declared underneath any +has_and_belongs_to_many+ declaration in order to work.
      # [:foreign_key]
      #   Specify the foreign key used for the association. By default this is guessed to be the name
      #   of this class in lower-case and "_id" suffixed. So a Person class that makes
      #   a +has_and_belongs_to_many+ association to Project will use "person_id" as the
      #   default <tt>:foreign_key</tt>.
      # [:association_foreign_key]
      #   Specify the foreign key used for the association on the receiving side of the association.
      #   By default this is guessed to be the name of the associated class in lower-case and "_id" suffixed.
      #   So if a Person class makes a +has_and_belongs_to_many+ association to Project,
      #   the association will use "project_id" as the default <tt>:association_foreign_key</tt>.
      # [:readonly]
      #   If true, all the associated objects are readonly through the association.
      # [:validate]
      #   If +false+, don't validate the associated objects when saving the parent object. +true+ by default.
      # [:autosave]
      #   If true, always save the associated objects or destroy them if marked for destruction, when
      #   saving the parent object.
      #   If false, never save or destroy the associated objects.
      #   By default, only save associated objects that are new records.
      #
      #   Note that <tt>accepts_nested_attributes_for</tt> sets <tt>:autosave</tt> to <tt>true</tt>.
      #
      # Option examples:
      #   has_and_belongs_to_many :projects
      #   has_and_belongs_to_many :projects, -> { includes :milestones, :manager }
      #   has_and_belongs_to_many :nations, class_name: "Country"
      #   has_and_belongs_to_many :categories, join_table: "prods_cats"
      #   has_and_belongs_to_many :categories, -> { readonly }
