import React from 'react';
import Authenticated from '@/Layouts/Authenticated';
import { Head, usePage } from '@inertiajs/inertia-react';

export default function Dashboard(props) {
    const {heroes, weapons} = usePage().props;
    return (
        <Authenticated
            auth={props.auth}
            errors={props.errors}
            header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>}
        >
            <Head title="Dashboard" />
            <div>
            <div className="container mx-auto">
                <h1 className="my-8 text-3xl font-bold text-center">Heroes</h1>
                <div className="overflow-x-auto bg-white rounded shadow">
                    <table className="w-full whitespace-nowrap">
                        <thead className="text-white bg-gray-600">
                            <tr className="font-bold text-left">
                                <th className="px-6 pt-5 pb-4">#</th>
                                <th className="px-6 pt-5 pb-4">Name</th>
                                <th className="px-6 pt-5 pb-4">Health</th>
                                <th className="px-6 pt-5 pb-4">Damage</th>
                            </tr>
                        </thead>
                        <tbody>
                            {heroes.map(({ id, name, health, damage }) => (
                                <tr key={id} className="">
                                    <td className="border-t">
                                        <div
                                            className="flex items-center px-6 py-4 focus:text-indigo-700 focus:outline-none"
                                        >
                                            {id}
                                        </div>
                                    </td>
                                    <td className="border-t">
                                        <div
                                            className="flex items-center px-6 py-4 focus:text-indigo-700 focus:outline-none"
                                        >
                                            {name}
                                        </div>
                                    </td>
                                    <td className="border-t">
                                        <div
                                            tabIndex="1"
                                            className="flex items-center px-6 py-4"
                                        >
                                            {health}
                                        </div>
                                    </td>
                                    <td className="border-t">
                                        <div
                                            tabIndex="1"
                                            className="px-4 py-2"
                                        >
                                            {damage}
                                        </div>
                                    </td>
                                </tr>
                            ))}
                            {heroes.length === 0 && (
                                <tr>
                                    <td
                                        className="px-6 py-4 border-t"
                                        colSpan="4"
                                    >
                                        No heroes found.
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            </div>

            <div className="container mx-auto">
                <h1 className="my-8 text-3xl font-bold text-center">Weapons</h1>
                <div className="overflow-x-auto bg-white rounded shadow">
                    <table className="w-full whitespace-nowrap">
                        <thead className="text-white bg-gray-600">
                            <tr className="font-bold text-left">
                                <th className="px-6 pt-5 pb-4">#</th>
                                <th className="px-6 pt-5 pb-4">Name</th>
                                <th className="px-6 pt-5 pb-4">Damage</th>
                                <th className="px-6 pt-5 pb-4">Is Range</th>
                                <th className="px-6 pt-5 pb-4">Owned Hores</th>
                            </tr>
                        </thead>
                        <tbody>
                            {weapons.map(({ id, name, is_range, damage, heroes }) => (
                                <tr key={id} className="">
                                    <td className="border-t">
                                        <div
                                            className="flex items-center px-6 py-4 focus:text-indigo-700 focus:outline-none"
                                        >
                                            {id}
                                        </div>
                                    </td>
                                    <td className="border-t">
                                        <div
                                            className="flex items-center px-6 py-4 focus:text-indigo-700 focus:outline-none"
                                        >
                                            {name}
                                        </div>
                                    </td>
                                    <td className="border-t">
                                        <div
                                            tabIndex="1"
                                            className="flex items-center px-6 py-4"
                                        >
                                            {damage}
                                        </div>
                                    </td>
                                    <td className="border-t">
                                        <div
                                            tabIndex="1"
                                            className="px-4 py-2"
                                        >
                                            {is_range ? 'Range' : ''}
                                        </div>
                                    </td>
                                    <td className="border-t">
                                        <div
                                            tabIndex="1"
                                            className="px-4 py-2"
                                        >
                                            {heroes.length}
                                        </div>
                                    </td>
                                </tr>
                            ))}
                            {weapons.length === 0 && (
                                <tr>
                                    <td
                                        className="px-6 py-4 border-t"
                                        colSpan="4"
                                    >
                                        No weapons found.
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        </Authenticated>
    );
}
