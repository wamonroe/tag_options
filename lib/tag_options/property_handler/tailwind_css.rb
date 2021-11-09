# frozen_string_literal: true

require 'tag_options/property_handler/base'

module TagOptions
  module PropertyHandler
    class TailwindCSS < Generic
      MATCHER = /\Aclass\z/.freeze

      # The following is automatically generated using `bin/update_tailwindcss`
      SORT_ORDER = %w[
        container decoration-slice decoration-clone box-border box-content block inline-block inline flex inline-flex
        inline-table table-caption table-cell table-column table-column-group table-footer-group table-header-group
        table-row flow-root grid inline-grid contents list-item hidden float-right float-left float-none clear-left
        clear-both clear-none isolate isolation-auto object-contain object-cover object-fill object-none
        object-bottom object-center object-left object-left-bottom object-left-top object-right object-right-bottom
        object-top overflow-auto overflow-hidden overflow-visible overflow-scroll overflow-x-auto overflow-y-auto
        overflow-y-hidden overflow-x-visible overflow-y-visible overflow-x-scroll overflow-y-scroll overscroll-auto
        overscroll-none overscroll-y-auto overscroll-y-contain overscroll-y-none overscroll-x-auto overscroll-x-contain
        static fixed absolute relative sticky inset-0 -inset-0 inset-x-0 -inset-x-0 inset-y-0 -inset-y-0 top-0 -top-0
        -right-0 bottom-0 -bottom-0 left-0 -left-0 inset-px -inset-px inset-x-px -inset-x-px inset-y-px -inset-y-px
        -top-px right-px -right-px bottom-px -bottom-px left-px -left-px inset-0.5 -inset-0.5 inset-x-0.5 -inset-x-0.5
        -inset-y-0.5 top-0.5 -top-0.5 right-0.5 -right-0.5 bottom-0.5 -bottom-0.5 left-0.5 -left-0.5 inset-1 -inset-1
        -inset-x-1 inset-y-1 -inset-y-1 top-1 -top-1 right-1 -right-1 bottom-1 -bottom-1 left-1 -left-1 inset-1.5
        inset-x-1.5 -inset-x-1.5 inset-y-1.5 -inset-y-1.5 top-1.5 -top-1.5 right-1.5 -right-1.5 bottom-1.5 -bottom-1.5
        -left-1.5 inset-2 -inset-2 inset-x-2 -inset-x-2 inset-y-2 -inset-y-2 top-2 -top-2 right-2 -right-2 bottom-2
        left-2 -left-2 inset-2.5 -inset-2.5 inset-x-2.5 -inset-x-2.5 inset-y-2.5 -inset-y-2.5 top-2.5 -top-2.5 right-2.5
        bottom-2.5 -bottom-2.5 left-2.5 -left-2.5 inset-3 -inset-3 inset-x-3 -inset-x-3 inset-y-3 -inset-y-3 top-3
        right-3 -right-3 bottom-3 -bottom-3 left-3 -left-3 inset-3.5 -inset-3.5 inset-x-3.5 -inset-x-3.5 inset-y-3.5
        top-3.5 -top-3.5 right-3.5 -right-3.5 bottom-3.5 -bottom-3.5 left-3.5 -left-3.5 inset-4 -inset-4 inset-x-4
        inset-y-4 -inset-y-4 top-4 -top-4 right-4 -right-4 bottom-4 -bottom-4 left-4 -left-4 inset-5 -inset-5 inset-x-5
        inset-y-5 -inset-y-5 top-5 -top-5 right-5 -right-5 bottom-5 -bottom-5 left-5 -left-5 inset-6 -inset-6 inset-x-6
        inset-y-6 -inset-y-6 top-6 -top-6 right-6 -right-6 bottom-6 -bottom-6 left-6 -left-6 inset-7 -inset-7 inset-x-7
        inset-y-7 -inset-y-7 top-7 -top-7 right-7 -right-7 bottom-7 -bottom-7 left-7 -left-7 inset-8 -inset-8 inset-x-8
        inset-y-8 -inset-y-8 top-8 -top-8 right-8 -right-8 bottom-8 -bottom-8 left-8 -left-8 inset-9 -inset-9 inset-x-9
        inset-y-9 -inset-y-9 top-9 -top-9 right-9 -right-9 bottom-9 -bottom-9 left-9 -left-9 inset-10 -inset-10
        -inset-x-10 inset-y-10 -inset-y-10 top-10 -top-10 right-10 -right-10 bottom-10 -bottom-10 left-10 -left-10
        -inset-11 inset-x-11 -inset-x-11 inset-y-11 -inset-y-11 top-11 -top-11 right-11 -right-11 bottom-11 -bottom-11
        -left-11 inset-12 -inset-12 inset-x-12 -inset-x-12 inset-y-12 -inset-y-12 top-12 -top-12 right-12 -right-12
        -bottom-12 left-12 -left-12 inset-14 -inset-14 inset-x-14 -inset-x-14 inset-y-14 -inset-y-14 top-14 -top-14
        -right-14 bottom-14 -bottom-14 left-14 -left-14 inset-16 -inset-16 inset-x-16 -inset-x-16 inset-y-16 -inset-y-16
        -top-16 right-16 -right-16 bottom-16 -bottom-16 left-16 -left-16 inset-20 -inset-20 inset-x-20 -inset-x-20
        -inset-y-20 top-20 -top-20 right-20 -right-20 bottom-20 -bottom-20 left-20 -left-20 inset-24 -inset-24
        -inset-x-24 inset-y-24 -inset-y-24 top-24 -top-24 right-24 -right-24 bottom-24 -bottom-24 left-24 -left-24
        -inset-28 inset-x-28 -inset-x-28 inset-y-28 -inset-y-28 top-28 -top-28 right-28 -right-28 bottom-28 -bottom-28
        -left-28 inset-32 -inset-32 inset-x-32 -inset-x-32 inset-y-32 -inset-y-32 top-32 -top-32 right-32 -right-32
        -bottom-32 left-32 -left-32 inset-36 -inset-36 inset-x-36 -inset-x-36 inset-y-36 -inset-y-36 top-36 -top-36
        -right-36 bottom-36 -bottom-36 left-36 -left-36 inset-40 -inset-40 inset-x-40 -inset-x-40 inset-y-40 -inset-y-40
        -top-40 right-40 -right-40 bottom-40 -bottom-40 left-40 -left-40 inset-44 -inset-44 inset-x-44 -inset-x-44
        -inset-y-44 top-44 -top-44 right-44 -right-44 bottom-44 -bottom-44 left-44 -left-44 inset-48 -inset-48
        -inset-x-48 inset-y-48 -inset-y-48 top-48 -top-48 right-48 -right-48 bottom-48 -bottom-48 left-48 -left-48
        -inset-52 inset-x-52 -inset-x-52 inset-y-52 -inset-y-52 top-52 -top-52 right-52 -right-52 bottom-52 -bottom-52
        -left-52 inset-56 -inset-56 inset-x-56 -inset-x-56 inset-y-56 -inset-y-56 top-56 -top-56 right-56 -right-56
        -bottom-56 left-56 -left-56 inset-60 -inset-60 inset-x-60 -inset-x-60 inset-y-60 -inset-y-60 top-60 -top-60
        -right-60 bottom-60 -bottom-60 left-60 -left-60 inset-64 -inset-64 inset-x-64 -inset-x-64 inset-y-64 -inset-y-64
        -top-64 right-64 -right-64 bottom-64 -bottom-64 left-64 -left-64 inset-72 -inset-72 inset-x-72 -inset-x-72
        -inset-y-72 top-72 -top-72 right-72 -right-72 bottom-72 -bottom-72 left-72 -left-72 inset-80 -inset-80
        -inset-x-80 inset-y-80 -inset-y-80 top-80 -top-80 right-80 -right-80 bottom-80 -bottom-80 left-80 -left-80
        -inset-96 inset-x-96 -inset-x-96 inset-y-96 -inset-y-96 top-96 -top-96 right-96 -right-96 bottom-96 -bottom-96
        -left-96 inset-auto inset-1/2 inset-1/3 inset-2/3 inset-1/4 inset-2/4 inset-3/4 inset-full -inset-1/2 -inset-1/3
        -inset-1/4 -inset-2/4 -inset-3/4 -inset-full inset-x-auto inset-x-1/2 inset-x-1/3 inset-x-2/3 inset-x-1/4
        inset-x-3/4 inset-x-full -inset-x-1/2 -inset-x-1/3 -inset-x-2/3 -inset-x-1/4 -inset-x-2/4 -inset-x-3/4
        inset-y-auto inset-y-1/2 inset-y-1/3 inset-y-2/3 inset-y-1/4 inset-y-2/4 inset-y-3/4 inset-y-full -inset-y-1/2
        -inset-y-2/3 -inset-y-1/4 -inset-y-2/4 -inset-y-3/4 -inset-y-full top-auto top-1/2 top-1/3 top-2/3 top-1/4
        top-3/4 top-full -top-1/2 -top-1/3 -top-2/3 -top-1/4 -top-2/4 -top-3/4 -top-full right-auto right-1/2 right-1/3
        right-1/4 right-2/4 right-3/4 right-full -right-1/2 -right-1/3 -right-2/3 -right-1/4 -right-2/4 -right-3/4
        bottom-auto bottom-1/2 bottom-1/3 bottom-2/3 bottom-1/4 bottom-2/4 bottom-3/4 bottom-full -bottom-1/2
        -bottom-2/3 -bottom-1/4 -bottom-2/4 -bottom-3/4 -bottom-full left-auto left-1/2 left-1/3 left-2/3 left-1/4
        left-3/4 left-full -left-1/2 -left-1/3 -left-2/3 -left-1/4 -left-2/4 -left-3/4 -left-full visible invisible z-0
        z-20 z-30 z-40 z-50 z-auto flex-row flex-row-reverse flex-col flex-col-reverse flex-wrap flex-wrap-reverse
        flex-1 flex-auto flex-initial flex-none flex-grow-0 flex-grow flex-shrink-0 flex-shrink order-1 order-2 order-3
        order-5 order-6 order-7 order-8 order-9 order-10 order-11 order-12 order-first order-last order-none grid-cols-1
        grid-cols-3 grid-cols-4 grid-cols-5 grid-cols-6 grid-cols-7 grid-cols-8 grid-cols-9 grid-cols-10 grid-cols-11
        grid-cols-none col-auto col-span-1 col-span-2 col-span-3 col-span-4 col-span-5 col-span-6 col-span-7 col-span-8
        col-span-10 col-span-11 col-span-12 col-span-full col-start-1 col-start-2 col-start-3 col-start-4 col-start-5
        col-start-7 col-start-8 col-start-9 col-start-10 col-start-11 col-start-12 col-start-13 col-start-auto col-end-1
        col-end-3 col-end-4 col-end-5 col-end-6 col-end-7 col-end-8 col-end-9 col-end-10 col-end-11 col-end-12
        col-end-auto grid-rows-1 grid-rows-2 grid-rows-3 grid-rows-4 grid-rows-5 grid-rows-6 grid-rows-none row-auto
        row-span-2 row-span-3 row-span-4 row-span-5 row-span-6 row-span-full row-start-1 row-start-2 row-start-3
        row-start-5 row-start-6 row-start-7 row-start-auto row-end-1 row-end-2 row-end-3 row-end-4 row-end-5 row-end-6
        row-end-auto grid-flow-row grid-flow-col grid-flow-row-dense grid-flow-col-dense auto-cols-auto auto-cols-min
        auto-cols-fr auto-rows-auto auto-rows-min auto-rows-max auto-rows-fr gap-0 gap-x-0 gap-y-0 gap-px gap-x-px
        gap-0.5 gap-x-0.5 gap-y-0.5 gap-1 gap-x-1 gap-y-1 gap-1.5 gap-x-1.5 gap-y-1.5 gap-2 gap-x-2 gap-y-2 gap-2.5
        gap-y-2.5 gap-3 gap-x-3 gap-y-3 gap-3.5 gap-x-3.5 gap-y-3.5 gap-4 gap-x-4 gap-y-4 gap-5 gap-x-5 gap-y-5 gap-6
        gap-y-6 gap-7 gap-x-7 gap-y-7 gap-8 gap-x-8 gap-y-8 gap-9 gap-x-9 gap-y-9 gap-10 gap-x-10 gap-y-10 gap-11
        gap-y-11 gap-12 gap-x-12 gap-y-12 gap-14 gap-x-14 gap-y-14 gap-16 gap-x-16 gap-y-16 gap-20 gap-x-20 gap-y-20
        gap-x-24 gap-y-24 gap-28 gap-x-28 gap-y-28 gap-32 gap-x-32 gap-y-32 gap-36 gap-x-36 gap-y-36 gap-40 gap-x-40
        gap-44 gap-x-44 gap-y-44 gap-48 gap-x-48 gap-y-48 gap-52 gap-x-52 gap-y-52 gap-56 gap-x-56 gap-y-56 gap-60
        gap-y-60 gap-64 gap-x-64 gap-y-64 gap-72 gap-x-72 gap-y-72 gap-80 gap-x-80 gap-y-80 gap-96 gap-x-96 gap-y-96
        justify-end justify-center justify-between justify-around justify-evenly justify-items-start justify-items-end
        justify-items-stretch justify-self-auto justify-self-start justify-self-end justify-self-center
        content-center content-start content-end content-between content-around content-evenly items-start items-end
        items-baseline items-stretch self-auto self-start self-end self-center self-stretch place-content-center
        place-content-end place-content-between place-content-around place-content-evenly place-content-stretch
        place-items-end place-items-center place-items-stretch place-self-auto place-self-start place-self-end
        place-self-stretch p-0 p-px p-0.5 p-1 p-1.5 p-2 p-2.5 p-3 p-3.5 p-4 p-5 p-6 p-7 p-8 p-9 p-10 p-11 p-12 p-14 p-16
        p-24 p-28 p-32 p-36 p-40 p-44 p-48 p-52 p-56 p-60 p-64 p-72 p-80 p-96 px-0 px-px px-0.5 px-1 px-1.5 px-2 px-2.5
        px-3.5 px-4 px-5 px-6 px-7 px-8 px-9 px-10 px-11 px-12 px-14 px-16 px-20 px-24 px-28 px-32 px-36 px-40 px-44
        px-52 px-56 px-60 px-64 px-72 px-80 px-96 py-0 py-px py-0.5 py-1 py-1.5 py-2 py-2.5 py-3 py-3.5 py-4 py-5 py-6
        py-8 py-9 py-10 py-11 py-12 py-14 py-16 py-20 py-24 py-28 py-32 py-36 py-40 py-44 py-48 py-52 py-56 py-60 py-64
        py-80 py-96 pt-0 pt-px pt-0.5 pt-1 pt-1.5 pt-2 pt-2.5 pt-3 pt-3.5 pt-4 pt-5 pt-6 pt-7 pt-8 pt-9 pt-10 pt-11
        pt-14 pt-16 pt-20 pt-24 pt-28 pt-32 pt-36 pt-40 pt-44 pt-48 pt-52 pt-56 pt-60 pt-64 pt-72 pt-80 pt-96 pr-0 pr-px
        pr-1 pr-1.5 pr-2 pr-2.5 pr-3 pr-3.5 pr-4 pr-5 pr-6 pr-7 pr-8 pr-9 pr-10 pr-11 pr-12 pr-14 pr-16 pr-20 pr-24
        pr-32 pr-36 pr-40 pr-44 pr-48 pr-52 pr-56 pr-60 pr-64 pr-72 pr-80 pr-96 pb-0 pb-px pb-0.5 pb-1 pb-1.5 pb-2
        pb-3 pb-3.5 pb-4 pb-5 pb-6 pb-7 pb-8 pb-9 pb-10 pb-11 pb-12 pb-14 pb-16 pb-20 pb-24 pb-28 pb-32 pb-36 pb-40
        pb-48 pb-52 pb-56 pb-60 pb-64 pb-72 pb-80 pb-96 pl-0 pl-px pl-0.5 pl-1 pl-1.5 pl-2 pl-2.5 pl-3 pl-3.5 pl-4 pl-5
        pl-7 pl-8 pl-9 pl-10 pl-11 pl-12 pl-14 pl-16 pl-20 pl-24 pl-28 pl-32 pl-36 pl-40 pl-44 pl-48 pl-52 pl-56 pl-60
        pl-72 pl-80 pl-96 m-0 m-px m-0.5 m-1 m-1.5 m-2 m-2.5 m-3 m-3.5 m-4 m-5 m-6 m-7 m-8 m-9 m-10 m-11 m-12 m-14 m-16
        m-24 m-28 m-32 m-36 m-40 m-44 m-48 m-52 m-56 m-60 m-64 m-72 m-80 m-96 m-auto -m-0 -m-px -m-0.5 -m-1 -m-1.5 -m-2
        -m-3 -m-3.5 -m-4 -m-5 -m-6 -m-7 -m-8 -m-9 -m-10 -m-11 -m-12 -m-14 -m-16 -m-20 -m-24 -m-28 -m-32 -m-36 -m-40
        -m-48 -m-52 -m-56 -m-60 -m-64 -m-72 -m-80 -m-96 mx-0 mx-px mx-0.5 mx-1 mx-1.5 mx-2 mx-2.5 mx-3 mx-3.5 mx-4 mx-5
        mx-7 mx-8 mx-9 mx-10 mx-11 mx-12 mx-14 mx-16 mx-20 mx-24 mx-28 mx-32 mx-36 mx-40 mx-44 mx-48 mx-52 mx-56 mx-60
        mx-72 mx-80 mx-96 mx-auto -mx-0 -mx-px -mx-0.5 -mx-1 -mx-1.5 -mx-2 -mx-2.5 -mx-3 -mx-3.5 -mx-4 -mx-5 -mx-6 -mx-7
        -mx-9 -mx-10 -mx-11 -mx-12 -mx-14 -mx-16 -mx-20 -mx-24 -mx-28 -mx-32 -mx-36 -mx-40 -mx-44 -mx-48 -mx-52 -mx-56
        -mx-64 -mx-72 -mx-80 -mx-96 my-0 my-px my-0.5 my-1 my-1.5 my-2 my-2.5 my-3 my-3.5 my-4 my-5 my-6 my-7 my-8 my-9
        my-11 my-12 my-14 my-16 my-20 my-24 my-28 my-32 my-36 my-40 my-44 my-48 my-52 my-56 my-60 my-64 my-72 my-80
        my-auto -my-0 -my-px -my-0.5 -my-1 -my-1.5 -my-2 -my-2.5 -my-3 -my-3.5 -my-4 -my-5 -my-6 -my-7 -my-8 -my-9
        -my-11 -my-12 -my-14 -my-16 -my-20 -my-24 -my-28 -my-32 -my-36 -my-40 -my-44 -my-48 -my-52 -my-56 -my-60 -my-64
        -my-80 -my-96 mt-0 mt-px mt-0.5 mt-1 mt-1.5 mt-2 mt-2.5 mt-3 mt-3.5 mt-4 mt-5 mt-6 mt-7 mt-8 mt-9 mt-10 mt-11
        mt-14 mt-16 mt-20 mt-24 mt-28 mt-32 mt-36 mt-40 mt-44 mt-48 mt-52 mt-56 mt-60 mt-64 mt-72 mt-80 mt-96 mt-auto
        -mt-px -mt-0.5 -mt-1 -mt-1.5 -mt-2 -mt-2.5 -mt-3 -mt-3.5 -mt-4 -mt-5 -mt-6 -mt-7 -mt-8 -mt-9 -mt-10 -mt-11
        -mt-14 -mt-16 -mt-20 -mt-24 -mt-28 -mt-32 -mt-36 -mt-40 -mt-44 -mt-48 -mt-52 -mt-56 -mt-60 -mt-64 -mt-72 -mt-80
        mr-0 mr-px mr-0.5 mr-1 mr-1.5 mr-2 mr-2.5 mr-3 mr-3.5 mr-4 mr-5 mr-6 mr-7 mr-8 mr-9 mr-10 mr-11 mr-12 mr-14
        mr-20 mr-24 mr-28 mr-32 mr-36 mr-40 mr-44 mr-48 mr-52 mr-56 mr-60 mr-64 mr-72 mr-80 mr-96 mr-auto -mr-0 -mr-px
        -mr-1 -mr-1.5 -mr-2 -mr-2.5 -mr-3 -mr-3.5 -mr-4 -mr-5 -mr-6 -mr-7 -mr-8 -mr-9 -mr-10 -mr-11 -mr-12 -mr-14 -mr-16
        -mr-24 -mr-28 -mr-32 -mr-36 -mr-40 -mr-44 -mr-48 -mr-52 -mr-56 -mr-60 -mr-64 -mr-72 -mr-80 -mr-96 mb-0 mb-px
        mb-1 mb-1.5 mb-2 mb-2.5 mb-3 mb-3.5 mb-4 mb-5 mb-6 mb-7 mb-8 mb-9 mb-10 mb-11 mb-12 mb-14 mb-16 mb-20 mb-24
        mb-32 mb-36 mb-40 mb-44 mb-48 mb-52 mb-56 mb-60 mb-64 mb-72 mb-80 mb-96 mb-auto -mb-0 -mb-px -mb-0.5 -mb-1
        -mb-2 -mb-2.5 -mb-3 -mb-3.5 -mb-4 -mb-5 -mb-6 -mb-7 -mb-8 -mb-9 -mb-10 -mb-11 -mb-12 -mb-14 -mb-16 -mb-20 -mb-24
        -mb-32 -mb-36 -mb-40 -mb-44 -mb-48 -mb-52 -mb-56 -mb-60 -mb-64 -mb-72 -mb-80 -mb-96 ml-0 ml-px ml-0.5 ml-1
        ml-2 ml-2.5 ml-3 ml-3.5 ml-4 ml-5 ml-6 ml-7 ml-8 ml-9 ml-10 ml-11 ml-12 ml-14 ml-16 ml-20 ml-24 ml-28 ml-32
        ml-40 ml-44 ml-48 ml-52 ml-56 ml-60 ml-64 ml-72 ml-80 ml-96 ml-auto -ml-0 -ml-px -ml-0.5 -ml-1 -ml-1.5 -ml-2
        -ml-3 -ml-3.5 -ml-4 -ml-5 -ml-6 -ml-7 -ml-8 -ml-9 -ml-10 -ml-11 -ml-12 -ml-14 -ml-16 -ml-20 -ml-24 -ml-28 -ml-32
        -ml-40 -ml-44 -ml-48 -ml-52 -ml-56 -ml-60 -ml-64 -ml-72 -ml-80 -ml-96 space-x-0 space-x-0.5 space-x-1
        space-x-2 space-x-2.5 space-x-3 space-x-3.5 space-x-4 space-x-5 space-x-6 space-x-7 space-x-8 space-x-9
        space-x-11 space-x-12 space-x-14 space-x-16 space-x-20 space-x-24 space-x-28 space-x-32 space-x-36 space-x-40
        space-x-48 space-x-52 space-x-56 space-x-60 space-x-64 space-x-72 space-x-80 space-x-96 space-x-px
        -space-x-0 -space-x-0.5 -space-x-1 -space-x-1.5 -space-x-2 -space-x-2.5 -space-x-3 -space-x-3.5 -space-x-4
        -space-x-6 -space-x-7 -space-x-8 -space-x-9 -space-x-10 -space-x-11 -space-x-12 -space-x-14 -space-x-16
        -space-x-24 -space-x-28 -space-x-32 -space-x-36 -space-x-40 -space-x-44 -space-x-48 -space-x-52 -space-x-56
        -space-x-64 -space-x-72 -space-x-80 -space-x-96 -space-x-px space-y-0 space-y-0.5 space-y-1 space-y-1.5
        space-y-2.5 space-y-3 space-y-3.5 space-y-4 space-y-5 space-y-6 space-y-7 space-y-8 space-y-9 space-y-10
        space-y-12 space-y-14 space-y-16 space-y-20 space-y-24 space-y-28 space-y-32 space-y-36 space-y-40 space-y-44
        space-y-52 space-y-56 space-y-60 space-y-64 space-y-72 space-y-80 space-y-96 space-y-px space-y-reverse
        -space-y-0.5 -space-y-1 -space-y-1.5 -space-y-2 -space-y-2.5 -space-y-3 -space-y-3.5 -space-y-4 -space-y-5
        -space-y-7 -space-y-8 -space-y-9 -space-y-10 -space-y-11 -space-y-12 -space-y-14 -space-y-16 -space-y-20
        -space-y-28 -space-y-32 -space-y-36 -space-y-40 -space-y-44 -space-y-48 -space-y-52 -space-y-56 -space-y-60
        -space-y-72 -space-y-80 -space-y-96 -space-y-px w-0 w-px w-0.5 w-1 w-1.5 w-2 w-2.5 w-3 w-3.5 w-4 w-5 w-6 w-7 w-8
        w-10 w-11 w-12 w-14 w-16 w-20 w-24 w-28 w-32 w-36 w-40 w-44 w-48 w-52 w-56 w-60 w-64 w-72 w-80 w-96 w-auto w-1/2
        w-2/3 w-1/4 w-2/4 w-3/4 w-1/5 w-2/5 w-3/5 w-4/5 w-1/6 w-2/6 w-3/6 w-4/6 w-5/6 w-1/12 w-2/12 w-3/12 w-4/12 w-5/12
        w-7/12 w-8/12 w-9/12 w-10/12 w-11/12 w-full w-screen w-min w-max min-w-0 min-w-full min-w-min min-w-max max-w-0
        max-w-xs max-w-sm max-w-md max-w-lg max-w-xl max-w-2xl max-w-3xl max-w-4xl max-w-5xl max-w-6xl max-w-7xl
        max-w-min max-w-max max-w-prose max-w-screen-sm max-w-screen-md max-w-screen-lg max-w-screen-xl max-w-screen-2xl
        h-px h-0.5 h-1 h-1.5 h-2 h-2.5 h-3 h-3.5 h-4 h-5 h-6 h-7 h-8 h-9 h-10 h-11 h-12 h-14 h-16 h-20 h-24 h-28 h-32
        h-40 h-44 h-48 h-52 h-56 h-60 h-64 h-72 h-80 h-96 h-auto h-1/2 h-1/3 h-2/3 h-1/4 h-2/4 h-3/4 h-1/5 h-2/5 h-3/5
        h-1/6 h-2/6 h-3/6 h-4/6 h-5/6 h-full h-screen min-h-0 min-h-full min-h-screen max-h-0 max-h-px max-h-0.5 max-h-1
        max-h-2 max-h-2.5 max-h-3 max-h-3.5 max-h-4 max-h-5 max-h-6 max-h-7 max-h-8 max-h-9 max-h-10 max-h-11 max-h-12
        max-h-16 max-h-20 max-h-24 max-h-28 max-h-32 max-h-36 max-h-40 max-h-44 max-h-48 max-h-52 max-h-56 max-h-60
        max-h-72 max-h-80 max-h-96 max-h-full max-h-screen font-sans font-serif font-mono text-xs text-sm text-base
        text-xl text-2xl text-3xl text-4xl text-5xl text-6xl text-7xl text-8xl text-9xl antialiased subpixel-antialiased
        not-italic font-thin font-extralight font-light font-normal font-medium font-semibold font-bold font-extrabold
        normal-nums ordinal slashed-zero lining-nums oldstyle-nums proportional-nums tabular-nums diagonal-fractions
        tracking-tighter tracking-tight tracking-normal tracking-wide tracking-wider tracking-widest leading-3 leading-4
        leading-6 leading-7 leading-8 leading-9 leading-10 leading-none leading-tight leading-snug leading-normal
        leading-loose list-none list-disc list-decimal list-inside list-outside placeholder-transparent
        placeholder-black placeholder-white placeholder-rose-50 placeholder-rose-100 placeholder-rose-200
        placeholder-rose-400 placeholder-rose-500 placeholder-rose-600 placeholder-rose-700 placeholder-rose-800
        placeholder-pink-50 placeholder-pink-100 placeholder-pink-200 placeholder-pink-300 placeholder-pink-400
        placeholder-pink-600 placeholder-pink-700 placeholder-pink-800 placeholder-pink-900 placeholder-fuchsia-50
        placeholder-fuchsia-200 placeholder-fuchsia-300 placeholder-fuchsia-400 placeholder-fuchsia-500
        placeholder-fuchsia-700 placeholder-fuchsia-800 placeholder-fuchsia-900 placeholder-purple-50
        placeholder-purple-200 placeholder-purple-300 placeholder-purple-400 placeholder-purple-500
        placeholder-purple-700 placeholder-purple-800 placeholder-purple-900 placeholder-violet-50
        placeholder-violet-200 placeholder-violet-300 placeholder-violet-400 placeholder-violet-500
        placeholder-violet-700 placeholder-violet-800 placeholder-violet-900 placeholder-indigo-50
        placeholder-indigo-200 placeholder-indigo-300 placeholder-indigo-400 placeholder-indigo-500
        placeholder-indigo-700 placeholder-indigo-800 placeholder-indigo-900 placeholder-blue-50 placeholder-blue-100
        placeholder-blue-300 placeholder-blue-400 placeholder-blue-500 placeholder-blue-600 placeholder-blue-700
        placeholder-blue-900 placeholder-light-blue-50 placeholder-light-blue-100 placeholder-light-blue-200
        placeholder-light-blue-400 placeholder-light-blue-500 placeholder-light-blue-600 placeholder-light-blue-700
        placeholder-light-blue-900 placeholder-sky-50 placeholder-sky-100 placeholder-sky-200 placeholder-sky-300
        placeholder-sky-500 placeholder-sky-600 placeholder-sky-700 placeholder-sky-800 placeholder-sky-900
        placeholder-cyan-100 placeholder-cyan-200 placeholder-cyan-300 placeholder-cyan-400 placeholder-cyan-500
        placeholder-cyan-700 placeholder-cyan-800 placeholder-cyan-900 placeholder-teal-50 placeholder-teal-100
        placeholder-teal-300 placeholder-teal-400 placeholder-teal-500 placeholder-teal-600 placeholder-teal-700
        placeholder-teal-900 placeholder-emerald-50 placeholder-emerald-100 placeholder-emerald-200
        placeholder-emerald-400 placeholder-emerald-500 placeholder-emerald-600 placeholder-emerald-700
        placeholder-emerald-900 placeholder-green-50 placeholder-green-100 placeholder-green-200 placeholder-green-300
        placeholder-green-500 placeholder-green-600 placeholder-green-700 placeholder-green-800 placeholder-green-900
        placeholder-lime-100 placeholder-lime-200 placeholder-lime-300 placeholder-lime-400 placeholder-lime-500
        placeholder-lime-700 placeholder-lime-800 placeholder-lime-900 placeholder-yellow-50 placeholder-yellow-100
        placeholder-yellow-300 placeholder-yellow-400 placeholder-yellow-500 placeholder-yellow-600
        placeholder-yellow-800 placeholder-yellow-900 placeholder-amber-50 placeholder-amber-100 placeholder-amber-200
        placeholder-amber-400 placeholder-amber-500 placeholder-amber-600 placeholder-amber-700 placeholder-amber-800
        placeholder-orange-50 placeholder-orange-100 placeholder-orange-200 placeholder-orange-300
        placeholder-orange-500 placeholder-orange-600 placeholder-orange-700 placeholder-orange-800
        placeholder-red-50 placeholder-red-100 placeholder-red-200 placeholder-red-300 placeholder-red-400
        placeholder-red-600 placeholder-red-700 placeholder-red-800 placeholder-red-900 placeholder-warm-gray-50
        placeholder-warm-gray-200 placeholder-warm-gray-300 placeholder-warm-gray-400 placeholder-warm-gray-500
        placeholder-warm-gray-700 placeholder-warm-gray-800 placeholder-warm-gray-900 placeholder-true-gray-50
        placeholder-true-gray-200 placeholder-true-gray-300 placeholder-true-gray-400 placeholder-true-gray-500
        placeholder-true-gray-700 placeholder-true-gray-800 placeholder-true-gray-900 placeholder-gray-50
        placeholder-gray-200 placeholder-gray-300 placeholder-gray-400 placeholder-gray-500 placeholder-gray-600
        placeholder-gray-800 placeholder-gray-900 placeholder-cool-gray-50 placeholder-cool-gray-100
        placeholder-cool-gray-300 placeholder-cool-gray-400 placeholder-cool-gray-500 placeholder-cool-gray-600
        placeholder-cool-gray-800 placeholder-cool-gray-900 placeholder-blue-gray-50 placeholder-blue-gray-100
        placeholder-blue-gray-300 placeholder-blue-gray-400 placeholder-blue-gray-500 placeholder-blue-gray-600
        placeholder-blue-gray-800 placeholder-blue-gray-900 placeholder-opacity-0 placeholder-opacity-5
        placeholder-opacity-20 placeholder-opacity-25 placeholder-opacity-30 placeholder-opacity-40
        placeholder-opacity-60 placeholder-opacity-70 placeholder-opacity-75 placeholder-opacity-80
        placeholder-opacity-95 placeholder-opacity-100 text-left text-center text-right text-justify text-transparent
        text-black text-white text-rose-50 text-rose-100 text-rose-200 text-rose-300 text-rose-400 text-rose-500
        text-rose-700 text-rose-800 text-rose-900 text-pink-50 text-pink-100 text-pink-200 text-pink-300 text-pink-400
        text-pink-600 text-pink-700 text-pink-800 text-pink-900 text-fuchsia-50 text-fuchsia-100 text-fuchsia-200
        text-fuchsia-400 text-fuchsia-500 text-fuchsia-600 text-fuchsia-700 text-fuchsia-800 text-fuchsia-900
        text-purple-100 text-purple-200 text-purple-300 text-purple-400 text-purple-500 text-purple-600 text-purple-700
        text-purple-900 text-violet-50 text-violet-100 text-violet-200 text-violet-300 text-violet-400 text-violet-500
        text-violet-700 text-violet-800 text-violet-900 text-indigo-50 text-indigo-100 text-indigo-200 text-indigo-300
        text-indigo-500 text-indigo-600 text-indigo-700 text-indigo-800 text-indigo-900 text-blue-50 text-blue-100
        text-blue-300 text-blue-400 text-blue-500 text-blue-600 text-blue-700 text-blue-800 text-blue-900
        text-light-blue-100 text-light-blue-200 text-light-blue-300 text-light-blue-400 text-light-blue-500
        text-light-blue-700 text-light-blue-800 text-light-blue-900 text-sky-50 text-sky-100 text-sky-200 text-sky-300
        text-sky-500 text-sky-600 text-sky-700 text-sky-800 text-sky-900 text-cyan-50 text-cyan-100 text-cyan-200
        text-cyan-400 text-cyan-500 text-cyan-600 text-cyan-700 text-cyan-800 text-cyan-900 text-teal-50 text-teal-100
        text-teal-300 text-teal-400 text-teal-500 text-teal-600 text-teal-700 text-teal-800 text-teal-900
        text-emerald-100 text-emerald-200 text-emerald-300 text-emerald-400 text-emerald-500 text-emerald-600
        text-emerald-800 text-emerald-900 text-green-50 text-green-100 text-green-200 text-green-300 text-green-400
        text-green-600 text-green-700 text-green-800 text-green-900 text-lime-50 text-lime-100 text-lime-200
        text-lime-400 text-lime-500 text-lime-600 text-lime-700 text-lime-800 text-lime-900 text-yellow-50
        text-yellow-200 text-yellow-300 text-yellow-400 text-yellow-500 text-yellow-600 text-yellow-700 text-yellow-800
        text-amber-50 text-amber-100 text-amber-200 text-amber-300 text-amber-400 text-amber-500 text-amber-600
        text-amber-800 text-amber-900 text-orange-50 text-orange-100 text-orange-200 text-orange-300 text-orange-400
        text-orange-600 text-orange-700 text-orange-800 text-orange-900 text-red-50 text-red-100 text-red-200
        text-red-400 text-red-500 text-red-600 text-red-700 text-red-800 text-red-900 text-warm-gray-50
        text-warm-gray-200 text-warm-gray-300 text-warm-gray-400 text-warm-gray-500 text-warm-gray-600
        text-warm-gray-800 text-warm-gray-900 text-true-gray-50 text-true-gray-100 text-true-gray-200 text-true-gray-300
        text-true-gray-500 text-true-gray-600 text-true-gray-700 text-true-gray-800 text-true-gray-900 text-gray-50
        text-gray-200 text-gray-300 text-gray-400 text-gray-500 text-gray-600 text-gray-700 text-gray-800 text-gray-900
        text-cool-gray-100 text-cool-gray-200 text-cool-gray-300 text-cool-gray-400 text-cool-gray-500
        text-cool-gray-700 text-cool-gray-800 text-cool-gray-900 text-blue-gray-50 text-blue-gray-100 text-blue-gray-200
        text-blue-gray-400 text-blue-gray-500 text-blue-gray-600 text-blue-gray-700 text-blue-gray-800
        text-opacity-0 text-opacity-5 text-opacity-10 text-opacity-20 text-opacity-25 text-opacity-30 text-opacity-40
        text-opacity-60 text-opacity-70 text-opacity-75 text-opacity-80 text-opacity-90 text-opacity-95 text-opacity-100
        line-through no-underline uppercase lowercase capitalize normal-case truncate overflow-ellipsis overflow-clip
        align-top align-middle align-bottom align-text-top align-text-bottom whitespace-normal whitespace-nowrap
        whitespace-pre-line whitespace-pre-wrap break-normal break-words break-all bg-fixed bg-local bg-scroll
        bg-clip-padding bg-clip-content bg-clip-text bg-transparent bg-current bg-black bg-white bg-rose-50 bg-rose-100
        bg-rose-300 bg-rose-400 bg-rose-500 bg-rose-600 bg-rose-700 bg-rose-800 bg-rose-900 bg-pink-50 bg-pink-100
        bg-pink-300 bg-pink-400 bg-pink-500 bg-pink-600 bg-pink-700 bg-pink-800 bg-pink-900 bg-fuchsia-50 bg-fuchsia-100
        bg-fuchsia-300 bg-fuchsia-400 bg-fuchsia-500 bg-fuchsia-600 bg-fuchsia-700 bg-fuchsia-800 bg-fuchsia-900
        bg-purple-100 bg-purple-200 bg-purple-300 bg-purple-400 bg-purple-500 bg-purple-600 bg-purple-700 bg-purple-800
        bg-violet-50 bg-violet-100 bg-violet-200 bg-violet-300 bg-violet-400 bg-violet-500 bg-violet-600 bg-violet-700
        bg-violet-900 bg-indigo-50 bg-indigo-100 bg-indigo-200 bg-indigo-300 bg-indigo-400 bg-indigo-500 bg-indigo-600
        bg-indigo-800 bg-indigo-900 bg-blue-50 bg-blue-100 bg-blue-200 bg-blue-300 bg-blue-400 bg-blue-500 bg-blue-600
        bg-blue-800 bg-blue-900 bg-light-blue-50 bg-light-blue-100 bg-light-blue-200 bg-light-blue-300 bg-light-blue-400
        bg-light-blue-600 bg-light-blue-700 bg-light-blue-800 bg-light-blue-900 bg-sky-50 bg-sky-100 bg-sky-200
        bg-sky-400 bg-sky-500 bg-sky-600 bg-sky-700 bg-sky-800 bg-sky-900 bg-cyan-50 bg-cyan-100 bg-cyan-200 bg-cyan-300
        bg-cyan-500 bg-cyan-600 bg-cyan-700 bg-cyan-800 bg-cyan-900 bg-teal-50 bg-teal-100 bg-teal-200 bg-teal-300
        bg-teal-500 bg-teal-600 bg-teal-700 bg-teal-800 bg-teal-900 bg-emerald-50 bg-emerald-100 bg-emerald-200
        bg-emerald-400 bg-emerald-500 bg-emerald-600 bg-emerald-700 bg-emerald-800 bg-emerald-900 bg-green-50
        bg-green-200 bg-green-300 bg-green-400 bg-green-500 bg-green-600 bg-green-700 bg-green-800 bg-green-900
        bg-lime-100 bg-lime-200 bg-lime-300 bg-lime-400 bg-lime-500 bg-lime-600 bg-lime-700 bg-lime-800 bg-lime-900
        bg-yellow-100 bg-yellow-200 bg-yellow-300 bg-yellow-400 bg-yellow-500 bg-yellow-600 bg-yellow-700 bg-yellow-800
        bg-amber-50 bg-amber-100 bg-amber-200 bg-amber-300 bg-amber-400 bg-amber-500 bg-amber-600 bg-amber-700
        bg-amber-900 bg-orange-50 bg-orange-100 bg-orange-200 bg-orange-300 bg-orange-400 bg-orange-500 bg-orange-600
        bg-orange-800 bg-orange-900 bg-red-50 bg-red-100 bg-red-200 bg-red-300 bg-red-400 bg-red-500 bg-red-600
        bg-red-800 bg-red-900 bg-warm-gray-50 bg-warm-gray-100 bg-warm-gray-200 bg-warm-gray-300 bg-warm-gray-400
        bg-warm-gray-600 bg-warm-gray-700 bg-warm-gray-800 bg-warm-gray-900 bg-true-gray-50 bg-true-gray-100
        bg-true-gray-300 bg-true-gray-400 bg-true-gray-500 bg-true-gray-600 bg-true-gray-700 bg-true-gray-800
        bg-gray-50 bg-gray-100 bg-gray-200 bg-gray-300 bg-gray-400 bg-gray-500 bg-gray-600 bg-gray-700 bg-gray-800
        bg-cool-gray-50 bg-cool-gray-100 bg-cool-gray-200 bg-cool-gray-300 bg-cool-gray-400 bg-cool-gray-500
        bg-cool-gray-700 bg-cool-gray-800 bg-cool-gray-900 bg-blue-gray-50 bg-blue-gray-100 bg-blue-gray-200
        bg-blue-gray-400 bg-blue-gray-500 bg-blue-gray-600 bg-blue-gray-700 bg-blue-gray-800 bg-blue-gray-900
        bg-opacity-5 bg-opacity-10 bg-opacity-20 bg-opacity-25 bg-opacity-30 bg-opacity-40 bg-opacity-50 bg-opacity-60
        bg-opacity-75 bg-opacity-80 bg-opacity-90 bg-opacity-95 bg-opacity-100 bg-origin-border bg-origin-padding
        bg-bottom bg-center bg-left bg-left-bottom bg-left-top bg-right bg-right-bottom bg-right-top bg-top bg-repeat
        bg-repeat-x bg-repeat-y bg-repeat-round bg-repeat-space bg-auto bg-cover bg-contain bg-none bg-gradient-to-t
        bg-gradient-to-r bg-gradient-to-br bg-gradient-to-b bg-gradient-to-bl bg-gradient-to-l bg-gradient-to-tl
        from-current from-black from-white from-rose-50 from-rose-100 from-rose-200 from-rose-300 from-rose-400
        from-rose-600 from-rose-700 from-rose-800 from-rose-900 from-pink-50 from-pink-100 from-pink-200 from-pink-300
        from-pink-500 from-pink-600 from-pink-700 from-pink-800 from-pink-900 from-fuchsia-50 from-fuchsia-100
        from-fuchsia-300 from-fuchsia-400 from-fuchsia-500 from-fuchsia-600 from-fuchsia-700 from-fuchsia-800
        from-purple-50 from-purple-100 from-purple-200 from-purple-300 from-purple-400 from-purple-500 from-purple-600
        from-purple-800 from-purple-900 from-violet-50 from-violet-100 from-violet-200 from-violet-300 from-violet-400
        from-violet-600 from-violet-700 from-violet-800 from-violet-900 from-indigo-50 from-indigo-100 from-indigo-200
        from-indigo-400 from-indigo-500 from-indigo-600 from-indigo-700 from-indigo-800 from-indigo-900 from-blue-50
        from-blue-200 from-blue-300 from-blue-400 from-blue-500 from-blue-600 from-blue-700 from-blue-800 from-blue-900
        from-light-blue-100 from-light-blue-200 from-light-blue-300 from-light-blue-400 from-light-blue-500
        from-light-blue-700 from-light-blue-800 from-light-blue-900 from-sky-50 from-sky-100 from-sky-200 from-sky-300
        from-sky-500 from-sky-600 from-sky-700 from-sky-800 from-sky-900 from-cyan-50 from-cyan-100 from-cyan-200
        from-cyan-400 from-cyan-500 from-cyan-600 from-cyan-700 from-cyan-800 from-cyan-900 from-teal-50 from-teal-100
        from-teal-300 from-teal-400 from-teal-500 from-teal-600 from-teal-700 from-teal-800 from-teal-900
        from-emerald-100 from-emerald-200 from-emerald-300 from-emerald-400 from-emerald-500 from-emerald-600
        from-emerald-800 from-emerald-900 from-green-50 from-green-100 from-green-200 from-green-300 from-green-400
        from-green-600 from-green-700 from-green-800 from-green-900 from-lime-50 from-lime-100 from-lime-200
        from-lime-400 from-lime-500 from-lime-600 from-lime-700 from-lime-800 from-lime-900 from-yellow-50
        from-yellow-200 from-yellow-300 from-yellow-400 from-yellow-500 from-yellow-600 from-yellow-700 from-yellow-800
        from-amber-50 from-amber-100 from-amber-200 from-amber-300 from-amber-400 from-amber-500 from-amber-600
        from-amber-800 from-amber-900 from-orange-50 from-orange-100 from-orange-200 from-orange-300 from-orange-400
        from-orange-600 from-orange-700 from-orange-800 from-orange-900 from-red-50 from-red-100 from-red-200
        from-red-400 from-red-500 from-red-600 from-red-700 from-red-800 from-red-900 from-warm-gray-50
        from-warm-gray-200 from-warm-gray-300 from-warm-gray-400 from-warm-gray-500 from-warm-gray-600
        from-warm-gray-800 from-warm-gray-900 from-true-gray-50 from-true-gray-100 from-true-gray-200 from-true-gray-300
        from-true-gray-500 from-true-gray-600 from-true-gray-700 from-true-gray-800 from-true-gray-900 from-gray-50
        from-gray-200 from-gray-300 from-gray-400 from-gray-500 from-gray-600 from-gray-700 from-gray-800 from-gray-900
        from-cool-gray-100 from-cool-gray-200 from-cool-gray-300 from-cool-gray-400 from-cool-gray-500
        from-cool-gray-700 from-cool-gray-800 from-cool-gray-900 from-blue-gray-50 from-blue-gray-100 from-blue-gray-200
        from-blue-gray-400 from-blue-gray-500 from-blue-gray-600 from-blue-gray-700 from-blue-gray-800
        via-transparent via-current via-black via-white via-rose-50 via-rose-100 via-rose-200 via-rose-300 via-rose-400
        via-rose-600 via-rose-700 via-rose-800 via-rose-900 via-pink-50 via-pink-100 via-pink-200 via-pink-300
        via-pink-500 via-pink-600 via-pink-700 via-pink-800 via-pink-900 via-fuchsia-50 via-fuchsia-100 via-fuchsia-200
        via-fuchsia-400 via-fuchsia-500 via-fuchsia-600 via-fuchsia-700 via-fuchsia-800 via-fuchsia-900 via-purple-50
        via-purple-200 via-purple-300 via-purple-400 via-purple-500 via-purple-600 via-purple-700 via-purple-800
        via-violet-50 via-violet-100 via-violet-200 via-violet-300 via-violet-400 via-violet-500 via-violet-600
        via-violet-800 via-violet-900 via-indigo-50 via-indigo-100 via-indigo-200 via-indigo-300 via-indigo-400
        via-indigo-600 via-indigo-700 via-indigo-800 via-indigo-900 via-blue-50 via-blue-100 via-blue-200 via-blue-300
        via-blue-500 via-blue-600 via-blue-700 via-blue-800 via-blue-900 via-light-blue-50 via-light-blue-100
        via-light-blue-300 via-light-blue-400 via-light-blue-500 via-light-blue-600 via-light-blue-700
        via-light-blue-900 via-sky-50 via-sky-100 via-sky-200 via-sky-300 via-sky-400 via-sky-500 via-sky-600
        via-sky-800 via-sky-900 via-cyan-50 via-cyan-100 via-cyan-200 via-cyan-300 via-cyan-400 via-cyan-500
        via-cyan-700 via-cyan-800 via-cyan-900 via-teal-50 via-teal-100 via-teal-200 via-teal-300 via-teal-400
        via-teal-600 via-teal-700 via-teal-800 via-teal-900 via-emerald-50 via-emerald-100 via-emerald-200
        via-emerald-400 via-emerald-500 via-emerald-600 via-emerald-700 via-emerald-800 via-emerald-900 via-green-50
        via-green-200 via-green-300 via-green-400 via-green-500 via-green-600 via-green-700 via-green-800 via-green-900
        via-lime-100 via-lime-200 via-lime-300 via-lime-400 via-lime-500 via-lime-600 via-lime-700 via-lime-800
        via-yellow-50 via-yellow-100 via-yellow-200 via-yellow-300 via-yellow-400 via-yellow-500 via-yellow-600
        via-yellow-800 via-yellow-900 via-amber-50 via-amber-100 via-amber-200 via-amber-300 via-amber-400 via-amber-500
        via-amber-700 via-amber-800 via-amber-900 via-orange-50 via-orange-100 via-orange-200 via-orange-300
        via-orange-500 via-orange-600 via-orange-700 via-orange-800 via-orange-900 via-red-50 via-red-100 via-red-200
        via-red-400 via-red-500 via-red-600 via-red-700 via-red-800 via-red-900 via-warm-gray-50 via-warm-gray-100
        via-warm-gray-300 via-warm-gray-400 via-warm-gray-500 via-warm-gray-600 via-warm-gray-700 via-warm-gray-800
        via-true-gray-50 via-true-gray-100 via-true-gray-200 via-true-gray-300 via-true-gray-400 via-true-gray-500
        via-true-gray-700 via-true-gray-800 via-true-gray-900 via-gray-50 via-gray-100 via-gray-200 via-gray-300
        via-gray-500 via-gray-600 via-gray-700 via-gray-800 via-gray-900 via-cool-gray-50 via-cool-gray-100
        via-cool-gray-300 via-cool-gray-400 via-cool-gray-500 via-cool-gray-600 via-cool-gray-700 via-cool-gray-800
        via-blue-gray-50 via-blue-gray-100 via-blue-gray-200 via-blue-gray-300 via-blue-gray-400 via-blue-gray-500
        via-blue-gray-700 via-blue-gray-800 via-blue-gray-900 to-transparent to-current to-black to-white to-rose-50
        to-rose-200 to-rose-300 to-rose-400 to-rose-500 to-rose-600 to-rose-700 to-rose-800 to-rose-900 to-pink-50
        to-pink-200 to-pink-300 to-pink-400 to-pink-500 to-pink-600 to-pink-700 to-pink-800 to-pink-900 to-fuchsia-50
        to-fuchsia-200 to-fuchsia-300 to-fuchsia-400 to-fuchsia-500 to-fuchsia-600 to-fuchsia-700 to-fuchsia-800
        to-purple-50 to-purple-100 to-purple-200 to-purple-300 to-purple-400 to-purple-500 to-purple-600 to-purple-700
        to-purple-900 to-violet-50 to-violet-100 to-violet-200 to-violet-300 to-violet-400 to-violet-500 to-violet-600
        to-violet-800 to-violet-900 to-indigo-50 to-indigo-100 to-indigo-200 to-indigo-300 to-indigo-400 to-indigo-500
        to-indigo-700 to-indigo-800 to-indigo-900 to-blue-50 to-blue-100 to-blue-200 to-blue-300 to-blue-400 to-blue-500
        to-blue-700 to-blue-800 to-blue-900 to-light-blue-50 to-light-blue-100 to-light-blue-200 to-light-blue-300
        to-light-blue-500 to-light-blue-600 to-light-blue-700 to-light-blue-800 to-light-blue-900 to-sky-50 to-sky-100
        to-sky-300 to-sky-400 to-sky-500 to-sky-600 to-sky-700 to-sky-800 to-sky-900 to-cyan-50 to-cyan-100 to-cyan-200
        to-cyan-400 to-cyan-500 to-cyan-600 to-cyan-700 to-cyan-800 to-cyan-900 to-teal-50 to-teal-100 to-teal-200
        to-teal-400 to-teal-500 to-teal-600 to-teal-700 to-teal-800 to-teal-900 to-emerald-50 to-emerald-100
        to-emerald-300 to-emerald-400 to-emerald-500 to-emerald-600 to-emerald-700 to-emerald-800 to-emerald-900
        to-green-100 to-green-200 to-green-300 to-green-400 to-green-500 to-green-600 to-green-700 to-green-800
        to-lime-50 to-lime-100 to-lime-200 to-lime-300 to-lime-400 to-lime-500 to-lime-600 to-lime-700 to-lime-800
        to-yellow-50 to-yellow-100 to-yellow-200 to-yellow-300 to-yellow-400 to-yellow-500 to-yellow-600 to-yellow-700
        to-yellow-900 to-amber-50 to-amber-100 to-amber-200 to-amber-300 to-amber-400 to-amber-500 to-amber-600
        to-amber-800 to-amber-900 to-orange-50 to-orange-100 to-orange-200 to-orange-300 to-orange-400 to-orange-500
        to-orange-700 to-orange-800 to-orange-900 to-red-50 to-red-100 to-red-200 to-red-300 to-red-400 to-red-500
        to-red-700 to-red-800 to-red-900 to-warm-gray-50 to-warm-gray-100 to-warm-gray-200 to-warm-gray-300
        to-warm-gray-500 to-warm-gray-600 to-warm-gray-700 to-warm-gray-800 to-warm-gray-900 to-true-gray-50
        to-true-gray-200 to-true-gray-300 to-true-gray-400 to-true-gray-500 to-true-gray-600 to-true-gray-700
        to-true-gray-900 to-gray-50 to-gray-100 to-gray-200 to-gray-300 to-gray-400 to-gray-500 to-gray-600 to-gray-700
        to-gray-900 to-cool-gray-50 to-cool-gray-100 to-cool-gray-200 to-cool-gray-300 to-cool-gray-400 to-cool-gray-500
        to-cool-gray-700 to-cool-gray-800 to-cool-gray-900 to-blue-gray-50 to-blue-gray-100 to-blue-gray-200
        to-blue-gray-400 to-blue-gray-500 to-blue-gray-600 to-blue-gray-700 to-blue-gray-800 to-blue-gray-900
        rounded-sm rounded rounded-md rounded-lg rounded-xl rounded-2xl rounded-3xl rounded-full rounded-t-none
        rounded-t rounded-t-md rounded-t-lg rounded-t-xl rounded-t-2xl rounded-t-3xl rounded-t-full rounded-r-none
        rounded-r rounded-r-md rounded-r-lg rounded-r-xl rounded-r-2xl rounded-r-3xl rounded-r-full rounded-b-none
        rounded-b rounded-b-md rounded-b-lg rounded-b-xl rounded-b-2xl rounded-b-3xl rounded-b-full rounded-l-none
        rounded-l rounded-l-md rounded-l-lg rounded-l-xl rounded-l-2xl rounded-l-3xl rounded-l-full rounded-tl-none
        rounded-tl rounded-tl-md rounded-tl-lg rounded-tl-xl rounded-tl-2xl rounded-tl-3xl rounded-tl-full
        rounded-tr-sm rounded-tr rounded-tr-md rounded-tr-lg rounded-tr-xl rounded-tr-2xl rounded-tr-3xl rounded-tr-full
        rounded-br-sm rounded-br rounded-br-md rounded-br-lg rounded-br-xl rounded-br-2xl rounded-br-3xl rounded-br-full
        rounded-bl-sm rounded-bl rounded-bl-md rounded-bl-lg rounded-bl-xl rounded-bl-2xl rounded-bl-3xl rounded-bl-full
        border-2 border-4 border-8 border border-t-0 border-t-2 border-t-4 border-t-8 border-t border-r-0 border-r-2
        border-r-8 border-r border-b-0 border-b-2 border-b-4 border-b-8 border-b border-l-0 border-l-2 border-l-4
        border-l border-transparent border-current border-black border-white border-rose-50 border-rose-100
        border-rose-300 border-rose-400 border-rose-500 border-rose-600 border-rose-700 border-rose-800 border-rose-900
        border-pink-100 border-pink-200 border-pink-300 border-pink-400 border-pink-500 border-pink-600 border-pink-700
        border-pink-900 border-fuchsia-50 border-fuchsia-100 border-fuchsia-200 border-fuchsia-300 border-fuchsia-400
        border-fuchsia-600 border-fuchsia-700 border-fuchsia-800 border-fuchsia-900 border-purple-50 border-purple-100
        border-purple-300 border-purple-400 border-purple-500 border-purple-600 border-purple-700 border-purple-800
        border-violet-50 border-violet-100 border-violet-200 border-violet-300 border-violet-400 border-violet-500
        border-violet-700 border-violet-800 border-violet-900 border-indigo-50 border-indigo-100 border-indigo-200
        border-indigo-400 border-indigo-500 border-indigo-600 border-indigo-700 border-indigo-800 border-indigo-900
        border-blue-100 border-blue-200 border-blue-300 border-blue-400 border-blue-500 border-blue-600 border-blue-700
        border-blue-900 border-light-blue-50 border-light-blue-100 border-light-blue-200 border-light-blue-300
        border-light-blue-500 border-light-blue-600 border-light-blue-700 border-light-blue-800 border-light-blue-900
        border-sky-100 border-sky-200 border-sky-300 border-sky-400 border-sky-500 border-sky-600 border-sky-700
        border-sky-900 border-cyan-50 border-cyan-100 border-cyan-200 border-cyan-300 border-cyan-400 border-cyan-500
        border-cyan-700 border-cyan-800 border-cyan-900 border-teal-50 border-teal-100 border-teal-200 border-teal-300
        border-teal-500 border-teal-600 border-teal-700 border-teal-800 border-teal-900 border-emerald-50
        border-emerald-200 border-emerald-300 border-emerald-400 border-emerald-500 border-emerald-600
        border-emerald-800 border-emerald-900 border-green-50 border-green-100 border-green-200 border-green-300
        border-green-500 border-green-600 border-green-700 border-green-800 border-green-900 border-lime-50
        border-lime-200 border-lime-300 border-lime-400 border-lime-500 border-lime-600 border-lime-700 border-lime-800
        border-yellow-50 border-yellow-100 border-yellow-200 border-yellow-300 border-yellow-400 border-yellow-500
        border-yellow-700 border-yellow-800 border-yellow-900 border-amber-50 border-amber-100 border-amber-200
        border-amber-400 border-amber-500 border-amber-600 border-amber-700 border-amber-800 border-amber-900
        border-orange-100 border-orange-200 border-orange-300 border-orange-400 border-orange-500 border-orange-600
        border-orange-800 border-orange-900 border-red-50 border-red-100 border-red-200 border-red-300 border-red-400
        border-red-600 border-red-700 border-red-800 border-red-900 border-warm-gray-50 border-warm-gray-100
        border-warm-gray-300 border-warm-gray-400 border-warm-gray-500 border-warm-gray-600 border-warm-gray-700
        border-warm-gray-900 border-true-gray-50 border-true-gray-100 border-true-gray-200 border-true-gray-300
        border-true-gray-500 border-true-gray-600 border-true-gray-700 border-true-gray-800 border-true-gray-900
        border-gray-100 border-gray-200 border-gray-300 border-gray-400 border-gray-500 border-gray-600 border-gray-700
        border-gray-900 border-cool-gray-50 border-cool-gray-100 border-cool-gray-200 border-cool-gray-300
        border-cool-gray-500 border-cool-gray-600 border-cool-gray-700 border-cool-gray-800 border-cool-gray-900
        border-blue-gray-100 border-blue-gray-200 border-blue-gray-300 border-blue-gray-400 border-blue-gray-500
        border-blue-gray-700 border-blue-gray-800 border-blue-gray-900 border-opacity-0 border-opacity-5
        border-opacity-20 border-opacity-25 border-opacity-30 border-opacity-40 border-opacity-50 border-opacity-60
        border-opacity-75 border-opacity-80 border-opacity-90 border-opacity-95 border-opacity-100 border-solid
        border-dotted border-double border-none divide-x-0 divide-x-2 divide-x-4 divide-x-8 divide-x divide-y-0
        divide-y-4 divide-y-8 divide-y divide-y-reverse divide-x-reverse divide-transparent divide-current divide-black
        divide-rose-50 divide-rose-100 divide-rose-200 divide-rose-300 divide-rose-400 divide-rose-500 divide-rose-600
        divide-rose-800 divide-rose-900 divide-pink-50 divide-pink-100 divide-pink-200 divide-pink-300 divide-pink-400
        divide-pink-600 divide-pink-700 divide-pink-800 divide-pink-900 divide-fuchsia-50 divide-fuchsia-100
        divide-fuchsia-300 divide-fuchsia-400 divide-fuchsia-500 divide-fuchsia-600 divide-fuchsia-700
        divide-fuchsia-900 divide-purple-50 divide-purple-100 divide-purple-200 divide-purple-300 divide-purple-400
        divide-purple-600 divide-purple-700 divide-purple-800 divide-purple-900 divide-violet-50 divide-violet-100
        divide-violet-300 divide-violet-400 divide-violet-500 divide-violet-600 divide-violet-700 divide-violet-800
        divide-indigo-50 divide-indigo-100 divide-indigo-200 divide-indigo-300 divide-indigo-400 divide-indigo-500
        divide-indigo-700 divide-indigo-800 divide-indigo-900 divide-blue-50 divide-blue-100 divide-blue-200
        divide-blue-400 divide-blue-500 divide-blue-600 divide-blue-700 divide-blue-800 divide-blue-900
        divide-light-blue-100 divide-light-blue-200 divide-light-blue-300 divide-light-blue-400 divide-light-blue-500
        divide-light-blue-700 divide-light-blue-800 divide-light-blue-900 divide-sky-50 divide-sky-100 divide-sky-200
        divide-sky-400 divide-sky-500 divide-sky-600 divide-sky-700 divide-sky-800 divide-sky-900 divide-cyan-50
        divide-cyan-200 divide-cyan-300 divide-cyan-400 divide-cyan-500 divide-cyan-600 divide-cyan-700 divide-cyan-800
        divide-teal-50 divide-teal-100 divide-teal-200 divide-teal-300 divide-teal-400 divide-teal-500 divide-teal-600
        divide-teal-800 divide-teal-900 divide-emerald-50 divide-emerald-100 divide-emerald-200 divide-emerald-300
        divide-emerald-500 divide-emerald-600 divide-emerald-700 divide-emerald-800 divide-emerald-900 divide-green-50
        divide-green-200 divide-green-300 divide-green-400 divide-green-500 divide-green-600 divide-green-700
        divide-green-900 divide-lime-50 divide-lime-100 divide-lime-200 divide-lime-300 divide-lime-400 divide-lime-500
        divide-lime-700 divide-lime-800 divide-lime-900 divide-yellow-50 divide-yellow-100 divide-yellow-200
        divide-yellow-400 divide-yellow-500 divide-yellow-600 divide-yellow-700 divide-yellow-800 divide-yellow-900
        divide-amber-100 divide-amber-200 divide-amber-300 divide-amber-400 divide-amber-500 divide-amber-600
        divide-amber-800 divide-amber-900 divide-orange-50 divide-orange-100 divide-orange-200 divide-orange-300
        divide-orange-500 divide-orange-600 divide-orange-700 divide-orange-800 divide-orange-900 divide-red-50
        divide-red-200 divide-red-300 divide-red-400 divide-red-500 divide-red-600 divide-red-700 divide-red-800
        divide-warm-gray-50 divide-warm-gray-100 divide-warm-gray-200 divide-warm-gray-300 divide-warm-gray-400
        divide-warm-gray-600 divide-warm-gray-700 divide-warm-gray-800 divide-warm-gray-900 divide-true-gray-50
        divide-true-gray-200 divide-true-gray-300 divide-true-gray-400 divide-true-gray-500 divide-true-gray-600
        divide-true-gray-800 divide-true-gray-900 divide-gray-50 divide-gray-100 divide-gray-200 divide-gray-300
        divide-gray-500 divide-gray-600 divide-gray-700 divide-gray-800 divide-gray-900 divide-cool-gray-50
        divide-cool-gray-200 divide-cool-gray-300 divide-cool-gray-400 divide-cool-gray-500 divide-cool-gray-600
        divide-cool-gray-800 divide-cool-gray-900 divide-blue-gray-50 divide-blue-gray-100 divide-blue-gray-200
        divide-blue-gray-400 divide-blue-gray-500 divide-blue-gray-600 divide-blue-gray-700 divide-blue-gray-800
        divide-opacity-0 divide-opacity-5 divide-opacity-10 divide-opacity-20 divide-opacity-25 divide-opacity-30
        divide-opacity-50 divide-opacity-60 divide-opacity-70 divide-opacity-75 divide-opacity-80 divide-opacity-90
        divide-opacity-100 divide-solid divide-dashed divide-dotted divide-double divide-none ring-0 ring-1 ring-2
        ring-8 ring ring-inset ring-transparent ring-current ring-black ring-white ring-rose-50 ring-rose-100
        ring-rose-300 ring-rose-400 ring-rose-500 ring-rose-600 ring-rose-700 ring-rose-800 ring-rose-900 ring-pink-50
        ring-pink-200 ring-pink-300 ring-pink-400 ring-pink-500 ring-pink-600 ring-pink-700 ring-pink-800 ring-pink-900
        ring-fuchsia-100 ring-fuchsia-200 ring-fuchsia-300 ring-fuchsia-400 ring-fuchsia-500 ring-fuchsia-600
        ring-fuchsia-800 ring-fuchsia-900 ring-purple-50 ring-purple-100 ring-purple-200 ring-purple-300 ring-purple-400
        ring-purple-600 ring-purple-700 ring-purple-800 ring-purple-900 ring-violet-50 ring-violet-100 ring-violet-200
        ring-violet-400 ring-violet-500 ring-violet-600 ring-violet-700 ring-violet-800 ring-violet-900 ring-indigo-50
        ring-indigo-200 ring-indigo-300 ring-indigo-400 ring-indigo-500 ring-indigo-600 ring-indigo-700 ring-indigo-800
        ring-blue-50 ring-blue-100 ring-blue-200 ring-blue-300 ring-blue-400 ring-blue-500 ring-blue-600 ring-blue-700
        ring-blue-900 ring-light-blue-50 ring-light-blue-100 ring-light-blue-200 ring-light-blue-300 ring-light-blue-400
        ring-light-blue-600 ring-light-blue-700 ring-light-blue-800 ring-light-blue-900 ring-sky-50 ring-sky-100
        ring-sky-300 ring-sky-400 ring-sky-500 ring-sky-600 ring-sky-700 ring-sky-800 ring-sky-900 ring-cyan-50
        ring-cyan-200 ring-cyan-300 ring-cyan-400 ring-cyan-500 ring-cyan-600 ring-cyan-700 ring-cyan-800 ring-cyan-900
        ring-teal-100 ring-teal-200 ring-teal-300 ring-teal-400 ring-teal-500 ring-teal-600 ring-teal-700 ring-teal-800
        ring-emerald-50 ring-emerald-100 ring-emerald-200 ring-emerald-300 ring-emerald-400 ring-emerald-500
        ring-emerald-700 ring-emerald-800 ring-emerald-900 ring-green-50 ring-green-100 ring-green-200 ring-green-300
        ring-green-500 ring-green-600 ring-green-700 ring-green-800 ring-green-900 ring-lime-50 ring-lime-100
        ring-lime-300 ring-lime-400 ring-lime-500 ring-lime-600 ring-lime-700 ring-lime-800 ring-lime-900 ring-yellow-50
        ring-yellow-200 ring-yellow-300 ring-yellow-400 ring-yellow-500 ring-yellow-600 ring-yellow-700 ring-yellow-800
        ring-amber-50 ring-amber-100 ring-amber-200 ring-amber-300 ring-amber-400 ring-amber-500 ring-amber-600
        ring-amber-800 ring-amber-900 ring-orange-50 ring-orange-100 ring-orange-200 ring-orange-300 ring-orange-400
        ring-orange-600 ring-orange-700 ring-orange-800 ring-orange-900 ring-red-50 ring-red-100 ring-red-200
        ring-red-400 ring-red-500 ring-red-600 ring-red-700 ring-red-800 ring-red-900 ring-warm-gray-50
        ring-warm-gray-200 ring-warm-gray-300 ring-warm-gray-400 ring-warm-gray-500 ring-warm-gray-600
        ring-warm-gray-800 ring-warm-gray-900 ring-true-gray-50 ring-true-gray-100 ring-true-gray-200 ring-true-gray-300
        ring-true-gray-500 ring-true-gray-600 ring-true-gray-700 ring-true-gray-800 ring-true-gray-900 ring-gray-50
        ring-gray-200 ring-gray-300 ring-gray-400 ring-gray-500 ring-gray-600 ring-gray-700 ring-gray-800 ring-gray-900
        ring-cool-gray-100 ring-cool-gray-200 ring-cool-gray-300 ring-cool-gray-400 ring-cool-gray-500
        ring-cool-gray-700 ring-cool-gray-800 ring-cool-gray-900 ring-blue-gray-50 ring-blue-gray-100 ring-blue-gray-200
        ring-blue-gray-400 ring-blue-gray-500 ring-blue-gray-600 ring-blue-gray-700 ring-blue-gray-800
        ring-opacity-0 ring-opacity-5 ring-opacity-10 ring-opacity-20 ring-opacity-25 ring-opacity-30 ring-opacity-40
        ring-opacity-60 ring-opacity-70 ring-opacity-75 ring-opacity-80 ring-opacity-90 ring-opacity-95 ring-opacity-100
        ring-offset-1 ring-offset-2 ring-offset-4 ring-offset-8 ring-offset-transparent ring-offset-current
        ring-offset-white ring-offset-rose-50 ring-offset-rose-100 ring-offset-rose-200 ring-offset-rose-300
        ring-offset-rose-500 ring-offset-rose-600 ring-offset-rose-700 ring-offset-rose-800 ring-offset-rose-900
        ring-offset-pink-100 ring-offset-pink-200 ring-offset-pink-300 ring-offset-pink-400 ring-offset-pink-500
        ring-offset-pink-700 ring-offset-pink-800 ring-offset-pink-900 ring-offset-fuchsia-50 ring-offset-fuchsia-100
        ring-offset-fuchsia-300 ring-offset-fuchsia-400 ring-offset-fuchsia-500 ring-offset-fuchsia-600
        ring-offset-fuchsia-800 ring-offset-fuchsia-900 ring-offset-purple-50 ring-offset-purple-100
        ring-offset-purple-300 ring-offset-purple-400 ring-offset-purple-500 ring-offset-purple-600
        ring-offset-purple-800 ring-offset-purple-900 ring-offset-violet-50 ring-offset-violet-100
        ring-offset-violet-300 ring-offset-violet-400 ring-offset-violet-500 ring-offset-violet-600
        ring-offset-violet-800 ring-offset-violet-900 ring-offset-indigo-50 ring-offset-indigo-100
        ring-offset-indigo-300 ring-offset-indigo-400 ring-offset-indigo-500 ring-offset-indigo-600
        ring-offset-indigo-800 ring-offset-indigo-900 ring-offset-blue-50 ring-offset-blue-100 ring-offset-blue-200
        ring-offset-blue-400 ring-offset-blue-500 ring-offset-blue-600 ring-offset-blue-700 ring-offset-blue-800
        ring-offset-light-blue-50 ring-offset-light-blue-100 ring-offset-light-blue-200 ring-offset-light-blue-300
        ring-offset-light-blue-500 ring-offset-light-blue-600 ring-offset-light-blue-700 ring-offset-light-blue-800
        ring-offset-sky-50 ring-offset-sky-100 ring-offset-sky-200 ring-offset-sky-300 ring-offset-sky-400
        ring-offset-sky-600 ring-offset-sky-700 ring-offset-sky-800 ring-offset-sky-900 ring-offset-cyan-50
        ring-offset-cyan-200 ring-offset-cyan-300 ring-offset-cyan-400 ring-offset-cyan-500 ring-offset-cyan-600
        ring-offset-cyan-800 ring-offset-cyan-900 ring-offset-teal-50 ring-offset-teal-100 ring-offset-teal-200
        ring-offset-teal-400 ring-offset-teal-500 ring-offset-teal-600 ring-offset-teal-700 ring-offset-teal-800
        ring-offset-emerald-50 ring-offset-emerald-100 ring-offset-emerald-200 ring-offset-emerald-300
        ring-offset-emerald-500 ring-offset-emerald-600 ring-offset-emerald-700 ring-offset-emerald-800
        ring-offset-green-50 ring-offset-green-100 ring-offset-green-200 ring-offset-green-300 ring-offset-green-400
        ring-offset-green-600 ring-offset-green-700 ring-offset-green-800 ring-offset-green-900 ring-offset-lime-50
        ring-offset-lime-200 ring-offset-lime-300 ring-offset-lime-400 ring-offset-lime-500 ring-offset-lime-600
        ring-offset-lime-800 ring-offset-lime-900 ring-offset-yellow-50 ring-offset-yellow-100 ring-offset-yellow-200
        ring-offset-yellow-400 ring-offset-yellow-500 ring-offset-yellow-600 ring-offset-yellow-700
        ring-offset-yellow-900 ring-offset-amber-50 ring-offset-amber-100 ring-offset-amber-200 ring-offset-amber-300
        ring-offset-amber-500 ring-offset-amber-600 ring-offset-amber-700 ring-offset-amber-800 ring-offset-amber-900
        ring-offset-orange-100 ring-offset-orange-200 ring-offset-orange-300 ring-offset-orange-400
        ring-offset-orange-600 ring-offset-orange-700 ring-offset-orange-800 ring-offset-orange-900 ring-offset-red-50
        ring-offset-red-200 ring-offset-red-300 ring-offset-red-400 ring-offset-red-500 ring-offset-red-600
        ring-offset-red-800 ring-offset-red-900 ring-offset-warm-gray-50 ring-offset-warm-gray-100
        ring-offset-warm-gray-300 ring-offset-warm-gray-400 ring-offset-warm-gray-500 ring-offset-warm-gray-600
        ring-offset-warm-gray-800 ring-offset-warm-gray-900 ring-offset-true-gray-50 ring-offset-true-gray-100
        ring-offset-true-gray-300 ring-offset-true-gray-400 ring-offset-true-gray-500 ring-offset-true-gray-600
        ring-offset-true-gray-800 ring-offset-true-gray-900 ring-offset-gray-50 ring-offset-gray-100
        ring-offset-gray-300 ring-offset-gray-400 ring-offset-gray-500 ring-offset-gray-600 ring-offset-gray-700
        ring-offset-gray-900 ring-offset-cool-gray-50 ring-offset-cool-gray-100 ring-offset-cool-gray-200
        ring-offset-cool-gray-400 ring-offset-cool-gray-500 ring-offset-cool-gray-600 ring-offset-cool-gray-700
        ring-offset-cool-gray-900 ring-offset-blue-gray-50 ring-offset-blue-gray-100 ring-offset-blue-gray-200
        ring-offset-blue-gray-400 ring-offset-blue-gray-500 ring-offset-blue-gray-600 ring-offset-blue-gray-700
        ring-offset-blue-gray-900 shadow-sm shadow shadow-md shadow-lg shadow-xl shadow-2xl shadow-inner shadow-none
        opacity-5 opacity-10 opacity-20 opacity-25 opacity-30 opacity-40 opacity-50 opacity-60 opacity-70 opacity-75
        opacity-90 opacity-95 opacity-100 mix-blend-normal mix-blend-multiply mix-blend-screen mix-blend-overlay
        mix-blend-lighten mix-blend-color-dodge mix-blend-color-burn mix-blend-hard-light mix-blend-soft-light
        mix-blend-exclusion mix-blend-hue mix-blend-saturation mix-blend-color mix-blend-luminosity bg-blend-normal
        bg-blend-screen bg-blend-overlay bg-blend-darken bg-blend-lighten bg-blend-color-dodge bg-blend-color-burn
        bg-blend-soft-light bg-blend-difference bg-blend-exclusion bg-blend-hue bg-blend-saturation bg-blend-color
        filter filter-none blur-none blur-sm blur blur-md blur-lg blur-xl blur-2xl blur-3xl brightness-0 brightness-50
        brightness-90 brightness-95 brightness-100 brightness-105 brightness-110 brightness-125 brightness-150
        contrast-0 contrast-50 contrast-75 contrast-100 contrast-125 contrast-150 contrast-200 drop-shadow-sm
        drop-shadow-md drop-shadow-lg drop-shadow-xl drop-shadow-2xl drop-shadow-none grayscale-0 grayscale
        -hue-rotate-90 -hue-rotate-60 -hue-rotate-30 -hue-rotate-15 hue-rotate-0 hue-rotate-15 hue-rotate-30
        hue-rotate-90 hue-rotate-180 invert-0 invert saturate-0 saturate-50 saturate-100 saturate-150 saturate-200
        sepia backdrop-filter backdrop-filter-none backdrop-blur-none backdrop-blur-sm backdrop-blur backdrop-blur-md
        backdrop-blur-xl backdrop-blur-2xl backdrop-blur-3xl backdrop-brightness-0 backdrop-brightness-50
        backdrop-brightness-90 backdrop-brightness-95 backdrop-brightness-100 backdrop-brightness-105
        backdrop-brightness-125 backdrop-brightness-150 backdrop-brightness-200 backdrop-contrast-0 backdrop-contrast-50
        backdrop-contrast-100 backdrop-contrast-125 backdrop-contrast-150 backdrop-contrast-200 backdrop-grayscale-0
        -backdrop-hue-rotate-180 -backdrop-hue-rotate-90 -backdrop-hue-rotate-60 -backdrop-hue-rotate-30
        backdrop-hue-rotate-0 backdrop-hue-rotate-15 backdrop-hue-rotate-30 backdrop-hue-rotate-60
        backdrop-hue-rotate-180 backdrop-invert-0 backdrop-invert backdrop-opacity-0 backdrop-opacity-5
        backdrop-opacity-20 backdrop-opacity-25 backdrop-opacity-30 backdrop-opacity-40 backdrop-opacity-50
        backdrop-opacity-70 backdrop-opacity-75 backdrop-opacity-80 backdrop-opacity-90 backdrop-opacity-95
        backdrop-saturate-0 backdrop-saturate-50 backdrop-saturate-100 backdrop-saturate-150 backdrop-saturate-200
        backdrop-sepia border-collapse border-separate table-auto table-fixed transition-none transition-all transition
        transition-opacity transition-shadow transition-transform duration-75 duration-100 duration-150 duration-200
        duration-500 duration-700 duration-1000 ease-linear ease-in ease-out ease-in-out delay-75 delay-100 delay-150
        delay-300 delay-500 delay-700 delay-1000 animate-none animate-spin animate-ping animate-pulse animate-bounce
        transform-gpu transform-none origin-center origin-top origin-top-right origin-right origin-bottom-right
        origin-bottom-left origin-left origin-top-left scale-0 scale-50 scale-75 scale-90 scale-95 scale-100 scale-105
        scale-125 scale-150 scale-x-0 scale-x-50 scale-x-75 scale-x-90 scale-x-95 scale-x-100 scale-x-105 scale-x-110
        scale-x-150 scale-y-0 scale-y-50 scale-y-75 scale-y-90 scale-y-95 scale-y-100 scale-y-105 scale-y-110
        scale-y-150 rotate-0 rotate-1 rotate-2 rotate-3 rotate-6 rotate-12 rotate-45 rotate-90 rotate-180 -rotate-180
        -rotate-45 -rotate-12 -rotate-6 -rotate-3 -rotate-2 -rotate-1 translate-x-0 translate-x-px translate-x-0.5
        translate-x-1.5 translate-x-2 translate-x-2.5 translate-x-3 translate-x-3.5 translate-x-4 translate-x-5
        translate-x-7 translate-x-8 translate-x-9 translate-x-10 translate-x-11 translate-x-12 translate-x-14
        translate-x-20 translate-x-24 translate-x-28 translate-x-32 translate-x-36 translate-x-40 translate-x-44
        translate-x-52 translate-x-56 translate-x-60 translate-x-64 translate-x-72 translate-x-80 translate-x-96
        translate-x-1/3 translate-x-2/3 translate-x-1/4 translate-x-2/4 translate-x-3/4 translate-x-full -translate-x-0
        -translate-x-0.5 -translate-x-1 -translate-x-1.5 -translate-x-2 -translate-x-2.5 -translate-x-3 -translate-x-3.5
        -translate-x-5 -translate-x-6 -translate-x-7 -translate-x-8 -translate-x-9 -translate-x-10 -translate-x-11
        -translate-x-14 -translate-x-16 -translate-x-20 -translate-x-24 -translate-x-28 -translate-x-32 -translate-x-36
        -translate-x-44 -translate-x-48 -translate-x-52 -translate-x-56 -translate-x-60 -translate-x-64 -translate-x-72
        -translate-x-96 -translate-x-1/2 -translate-x-1/3 -translate-x-2/3 -translate-x-1/4 -translate-x-2/4
        -translate-x-full translate-y-0 translate-y-px translate-y-0.5 translate-y-1 translate-y-1.5 translate-y-2
        translate-y-3 translate-y-3.5 translate-y-4 translate-y-5 translate-y-6 translate-y-7 translate-y-8
        translate-y-10 translate-y-11 translate-y-12 translate-y-14 translate-y-16 translate-y-20 translate-y-24
        translate-y-32 translate-y-36 translate-y-40 translate-y-44 translate-y-48 translate-y-52 translate-y-56
        translate-y-64 translate-y-72 translate-y-80 translate-y-96 translate-y-1/2 translate-y-1/3 translate-y-2/3
        translate-y-2/4 translate-y-3/4 translate-y-full -translate-y-0 -translate-y-px -translate-y-0.5 -translate-y-1
        -translate-y-2 -translate-y-2.5 -translate-y-3 -translate-y-3.5 -translate-y-4 -translate-y-5 -translate-y-6
        -translate-y-8 -translate-y-9 -translate-y-10 -translate-y-11 -translate-y-12 -translate-y-14 -translate-y-16
        -translate-y-24 -translate-y-28 -translate-y-32 -translate-y-36 -translate-y-40 -translate-y-44 -translate-y-48
        -translate-y-56 -translate-y-60 -translate-y-64 -translate-y-72 -translate-y-80 -translate-y-96 -translate-y-1/2
        -translate-y-2/3 -translate-y-1/4 -translate-y-2/4 -translate-y-3/4 -translate-y-full skew-x-0 skew-x-1 skew-x-2
        skew-x-6 skew-x-12 -skew-x-12 -skew-x-6 -skew-x-3 -skew-x-2 -skew-x-1 skew-y-0 skew-y-1 skew-y-2 skew-y-3
        skew-y-12 -skew-y-12 -skew-y-6 -skew-y-3 -skew-y-2 -skew-y-1 appearance-none cursor-auto cursor-default
        cursor-wait cursor-text cursor-move cursor-help cursor-not-allowed outline-none outline-white outline-black
        pointer-events-auto resize-none resize-y resize-x resize select-none select-text select-all select-auto
      ].freeze

      def call
        sorted_values.join(' ')
      end

    private

      def sorted_values
        resolve_uniq_values(*values, **conditions).sort_by do |value|
          SORT_ORDER.index(value) || 999_999
        end
      end
    end
  end
end
