import {
	graphql,
	GraphQLSchema,
	GraphQLObjectType,
	GraphQLString,
} from 'graphql'
import { getCharacterById } from './queries/characters'
import { client } from './lib/db'

const characterType = new GraphQLObjectType({
	name: 'character',
	fields: {
		name: {
			type: GraphQLString,
		},
	},
})

const schema = new GraphQLSchema({
	query: new GraphQLObjectType({
		name: 'RootQueryType',
		fields: {
			hello: {
				type: GraphQLString,
				resolve() {
					return 'world'
				},
			},
			character: {
				type: characterType,
				args: {
					id: { type: GraphQLString },
				},
				resolve: async (_, { id }) => {
					return await getCharacterById(id)
				},
			},
			user: {
				type: new GraphQLObjectType({
					name: 'user',
					description: 'The user of this service',
					fields: {
						firstName: {
							type: GraphQLString,
							resolve: (lala) => lala.firstName + ' Changed',
						},
						lastName: {
							type: GraphQLString,
						},
					},
				}),
				resolve: () => ({
					firstName: 'Björn',
					lastName: 'Eric',
				}),
			},
		},
	}),
})

const source = '{ character(id:"1"){name} }'

graphql({ schema, source })
	.then((res) => console.log(res))
	.catch((e) => {
		console.error(e)
		process.exit(1)
	})
// .finally(() => {
// 	client.end()
// })
